import logging
from pprint import pprint
import sys
from typing import List, TypedDict

from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain.prompts import PromptTemplate
from langchain import hub
from langchain.schema import Document

from langgraph.graph import StateGraph
from langgraph.graph import END

from langchain_core.output_parsers import JsonOutputParser
from langchain_core.output_parsers import StrOutputParser

from langchain_community.document_loaders import PyPDFLoader
from langchain_community.vectorstores import Chroma
from langchain_community.chat_models import ChatOllama
from langchain_community.embeddings import GPT4AllEmbeddings
from langchain_community.tools.tavily_search import TavilySearchResults

import streamlit as st

import os


logging.basicConfig(
    level=logging.INFO,
    format='[%(asctime)s] [%(levelname)s] [%(filename)s:%(lineno)d] %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)


def main():
    local_llm = "llama3"
    st.title("Multi-PDF ChatBot using LLAMA3 & Adaptive RAG")
    user_input = st.text_input(
        "Question:", placeholder="Ask about your PDF", key="input_abc"
    )
    with st.sidebar:
        uploaded_files = st.file_uploader(
            "Upload your file", type=["pdf"], accept_multiple_files=True
        )
        process = st.button("Process")

    logging.info(f"process: {process}")
    logging.info(f"uploaded_files: {uploaded_files}")
    
    if process:
        if not uploaded_files:
            st.warning("Please upload at least one PDF file.")
            st.stop()
    else:
        return

    # Ensure the temp directory exists
    temp_dir = "/tmp"
    if not os.path.exists(temp_dir):
        os.makedirs(temp_dir)

    # Process each uploaded file
    data = []
    for uploaded_file in uploaded_files:
        temp_file_path = os.path.join(temp_dir, uploaded_file.name)

        # Save the file to disk
        with open(temp_file_path, "wb") as file:
            file.write(uploaded_file.getbuffer())  # Use getbuffer() for Streamlit files

        # Load the PDF using PyPDFLoader
        try:
            loader = PyPDFLoader(temp_file_path)
            data = loader.load()  # Assuming loader.load() is the correct method
            st.write(f"Data loaded for {uploaded_file.name}")
        except Exception as e:
            st.error(f"Failed to load {uploaded_file.name}: {str(e)}")

    vectorstore = get_vectorstore(data)

    # Create a retriever and initialize the LLM
    retriever = vectorstore.as_retriever()
    llm = ChatOllama(model=local_llm, format="json", temperature=0)

    prompt = PromptTemplate(
        template="""You are an expert at routing a user question to a vectorstore or web search. 
        Use the vectorstore for questions on LLM agents, prompt engineering, and embeddings. 
        You do not need to be stringent with the keywords in the question related to these topics. 
        Otherwise, use web search. 
        Give a binary choice 'web_search' or 'vectorstore'. 
        Return a JSON with a single key 'datasource' and no preamble or explanation. 
        Question to route: {question}""",
        input_variables=["question"],
    )

    question_router = prompt | llm | JsonOutputParser()
    question = "llm agent memory"
    docs = retriever.get_relevant_documents(question)
    doc_txt = docs[1].page_content
    question_router.invoke({"question": question})
    llm = ChatOllama(model=local_llm, format="json", temperature=0)

    prompt = PromptTemplate(
        template="""You are a grader assessing the relevance of a retrieved document.
        Here is the retrieved document: 

        {document}

        Here is the user question: {question}
        If the document contains keywords related to the user question, grade it as relevant.
        It does not need to be a stringent test. The goal is to filter out erroneous matches.
        Give a binary score 'yes' or 'no' to indicate whether the document is relevant.
        Provide the binary score as a JSON with a single key 'score' and no preamble or explanation.""",
        input_variables=["question", "document"],
    )

    retrieval_grader = prompt | llm | JsonOutputParser()
    question = "agent memory"
    docs = retriever.get_relevant_documents(question)
    doc_txt = docs[1].page_content
    st.write(retrieval_grader.invoke({"question": question, "document": doc_txt}))

    ### Generate
    prompt = hub.pull("rlm/rag-prompt")

    # LLM
    llm = ChatOllama(model=local_llm, temperature=0)

    # Post-processing
    def format_docs(docs):
        return "\n\n".join(doc.page_content for doc in docs)

    # Chain
    rag_chain = prompt | llm | StrOutputParser()

    # Run
    question = "agent memory"
    generation = rag_chain.invoke({"context": docs, "question": question})
    print(generation)

    ### Hallucination Grader
    # LLM
    llm = ChatOllama(model=local_llm, format="json", temperature=0)

    # Prompt
    prompt = PromptTemplate(
        template="""You are a grader assessing whether an answer is grounded in facts.
        Here are the facts:
        ---------
        {documents}
        ---------
        Here is the answer: {generation}
        Give a binary score 'yes' or 'no' to indicate whether the answer is grounded.
        Provide the binary score as a JSON with a single key 'score' and no preamble or explanation.""",
        input_variables=["generation", "documents"],
    )

    # Hallucination grader pipeline
    hallucination_grader = prompt | llm | JsonOutputParser()
    hallucination_grader.invoke({"documents": docs, "generation": generation})

    ### Answer Grader

    # LLM initialization
    llm = ChatOllama(model=local_llm, format="json", temperature=0)

    # Prompt for assessing answer usefulness
    prompt = PromptTemplate(
        template="""You are a grader assessing whether an answer is useful to resolve the question.
        Here is the answer:
        ---------
        {generation}
        ---------
        Here is the question: {question}
        Give a binary score 'yes' or 'no' to indicate whether the answer is useful.
        Provide the binary score as a JSON with a single key 'score' and no preamble or explanation.""",
        input_variables=["generation", "question"],
    )

    # Answer grader pipeline
    answer_grader = prompt | llm | JsonOutputParser()
    answer_grader.invoke({"question": question, "generation": generation})

    ### Question Re-writer

    # LLM
    llm = ChatOllama(model=local_llm, temperature=0)

    # Prompt
    re_write_prompt = PromptTemplate(
        template="""You a question re-writer that converts an input question to a better question
            for vectorstore retrieval. Look at the initial and formulate an improved question.
            Here is the initial question: \n\n {question}. Improved question with no preamble or explanation.""",
        input_variables=["generation", "question"],
    )

    question_rewriter = re_write_prompt | llm | StrOutputParser()
    question_rewriter.invoke({"question": question})

    web_search_tool = TavilySearchResults(k=3, traily_api_key=traily_api_key)


    class GraphState(TypedDict):
        """
        Represents the state of our graph.

        Attributes:
            question: question
            generation: LLM generation
            documents: list of documents
        """

        question: str
        generation: str
        documents: List[str]

    def retrieve(state):
        """
        Retrieve documents

        Args:
            state (dict): The current graph state

        Returns:
            state (dict): New key added to state, documents, that contains retrieved documents
        """
        print("---RETRIEVE---")
        question = state["question"]

        # Retrieval
        documents = retriever.get_relevant_documents(question)
        return {"documents": documents, "question": question}

    def generate(state):
        """
        Generate answer

        Args:
        state (dict): The current graph state

        Returns:
        state (dict): New key added to state, generation, that contains LLM generation of answer
        """
        print("---GENERATE---")
        question = state["question"]
        documents = state["documents"]

        # RAG generation
        generation = rag_chain.invoke({"context": documents, "question": question})
        return {"documents": documents, "question": question, "generation": generation}

    def grade_documents(state):
        """
        Determines whether the retrieved documents are relevant to the question.

        Args:
            state (dict): The current graph state

        Returns:
            state (dict): Updates documents key with only filtered relevant documents
        """

        print("---CHECK DOCUMENT RELEVANCE TO QUESTION---")
        question = state["question"]
        documents = state["documents"]

        # Score each doc
        filtered_docs = []
        for d in documents:
            score = retrieval_grader.invoke(
                {"question": question, "document": d.page_content}
            )
            grade = score["score"]
            if grade == "yes":
                print("---GRADE: DOCUMENT RELEVANT---")
                filtered_docs.append(d)
            else:
                print("---GRADE: DOCUMENT NOT RELEVANT---")
                continue
        return {"documents": filtered_docs, "question": question}


    def transform_query(state):
        """
        Transform the query to produce a better question.

        Args:
            state (dict): The current graph state

        Returns:
            state (dict): Updates question key with a re-phrased question
        """

        print("---TRANSFORM QUERY---")
        question = state["question"]
        documents = state["documents"]

        # Re-write question
        better_question = question_rewriter.invoke({"question": question})
        return {"documents": documents, "question": better_question}

    def web_search(state):
        """
        Web search based on the re-phrased question.

        Args:
            state (dict): The current graph state

        Returns:
            state (dict): Updates documents key with appended web results
        """

        print("---WEB SEARCH---")
        question = state["question"]

        # Web search
        docs = web_search_tool. invoke({"query": question})
        web_results = "\n".join([d["content"] for d in docs])
        web_results = Document(page_content=web_results)

        return {"documents": web_results, "question": question}

### Edges ###
    def route_question(state, question_router):
        """
        Route question to web search or RAG.

        Args:
            state (dict): The current graph state

        Returns:
            str: Next node to call
        """

        print("---ROUTE QUESTION---")
        question = state["question"]
        print(question)
        source = question_router.invoke({"question": question})
        print(source)
        print(source['datasource'])

        if source['datasource'] == 'web_search':
            print("---ROUTE QUESTION TO WEB SEARCH---")
            return "web_search"
        elif source['datasource'] == 'vectorstore':
            print("---ROUTE QUESTION TO RAG---")
        return "vectorstore"
    
    def decide_to_generate(state):
        """
        Determines whether to generate an answer, or re-generate a question.

        Args:
            state (dict): The current graph state

        Returns:
            str: Binary decision for next node to call
        """
        print("---ASSESS GRADED DOCUMENTS---")
        question = state["question"]
        filtered_documents = state["documents"]

        if not filtered_documents:
            # ALL documents have been filtered check_relevance
            # We will re-generate a new query
            print("---DECISION: ALL DOCUMENTS ARE NOT RELEVANT TO QUESTION, TRANSFORM QUERY---")
            return "transform_query"
        else:
            # We have relevant documents, so generate answer
            print("---DECISION: GENERATE---")
            return "generate"

    def grade_generation_v_documents_and_question(state, hallucination_grader, answer_grader):
        """
        Determines whether the generation is grounded in the document and answers question.

        Args:
            state (dict): The current graph state

        Returns:
            str: Decision for next node to call
        """
        print("---CHECK HALLUCINATIONS---")
        question = state["question"]
        documents = state["documents"]
        generation = state["generation"]

        score = hallucination_grader.invoke({"documents": documents, "generation": generation})
        grade = score['score']

        # Check hallucination
        if grade == "yes":
            print("---DECISION: GENERATION IS GROUNDED IN DOCUMENTS---—")
            # Check question-answering
            print("---GRADE GENERATION vs QUESTION---")
            score = answer_grader.invoke({"question": question,"generation": generation})
            grade = score['score']
            if grade == "yes":
                print("---DECISION: GENERATION ADDRESSES QUESTION---")
                return "useful"
            else:
                print("---DECISION: GENERATION DOES NOT ADDRESS QUESTION---")
                return "not useful"
        else:
            pprint("---DECISION: GENERATION IS NOT GROUNDED IN DOCUMENTS, RE-TRY---")
            return "not supported"

    workflow = StateGraph(GraphState)

    # Define the nodes
    workflow.add_node("web_search", web_search) # web search
    workflow.add_node("retrieve", retrieve) # retrieve

    workflow.add_node("grade_documents", grade_documents) # grade documents

    workflow.add_node("generate", generate) # generatae

    workflow.add_node("transform_query", transform_query) # transform_query

    # Build graph
    workflow.set_conditional_entry_point(
        route_question,
        {
        "web_search": "web_search",
        "vectorstore": "retrieve",
        },
    )
    workflow.add_edge("web_search", "generate")
    workflow.add_edge("retrieve", "grade_documents")
    workflow.add_conditional_edges(
        "grade_documents",
        decide_to_generate,
        {
        "transform_query": "transform_query",
        "generate": "generate",
        },
    )
    workflow.add_edge("transform_query", "retrieve")
    workflow.add_conditional_edges(
        "generate",
        grade_generation_v_documents_and_question,
        {
        "not supported": "generate",
        "useful": END,
        "not useful": "transform_query",
        },
    )

    # Compile
    app = workflow. compile()

def get_vectorstore(data):
    text_splitter = RecursiveCharacterTextSplitter.from_tiktoken_encoder(
        chunk_size=250, chunk_overlap=0
    )
    text_chunks = text_splitter.split_documents(data)

    # Add chunks to vectorDB
    vectorstore = Chroma.from_documents(
        documents=text_chunks,
        collection_name="rag-chroma",
        embedding=GPT4AllEmbeddings(),
    )
    return vectorstore


if __name__ == "__main__":
    main()
