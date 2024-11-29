from typing import List, TypedDict
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain.prompts import PromptTemplate
from langchain import hub

from langchain_core.output_parsers import JsonOutputParser
from langchain_core.output_parsers import StrOutputParser

from langchain_community.document_loaders import PyPDFLoader
from langchain_community.vectorstores import Chroma
from langchain_community.chat_models import ChatOllama
from langchain_community.embeddings import GPT4AllEmbeddings
from langchain_community.tools.tavily_search import TavilySearchResults

import streamlit as st

import os

traily_api_key = "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"


def main():
    local_llm = "llama3"
    st.title("Multi-PDF ChatBot using LLAMA3 & Adaptive RAG")
    # user_input = st.text_input("Question:", )
    user_input = st.text_input(
        "Question:", placeholder="Ask about your PDF", key="input_abc"
    )
    with st.sidebar:
        uploaded_files = st.file_uploader(
            "Upload your file", type=["pdf"], accept_multiple_files=True
        )
        process = st.button("Process")
    if process:
        if not uploaded_files:
            st.warning("Please upload at least one PDF file.")
            st.stop()

    # Ensure the temp directory exists
    temp_dir = "/tmp"
    if not os.path.exists(temp_dir):
        os.makedirs(temp_dir)

    # Process each uploaded file
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

    # Split the data into chunks using RecursiveCharacterTextSplitter
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

    # LLM initialization
    llm = ChatOllama(model=local_llm, format="json", temperature=0)

    # Prompt for assessing grounding
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
    result = hallucination_grader.invoke({"documents": docs, "generation": generation})

    # Answer Grader

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
    result = answer_grader.invoke({"question": question, "generation": generation})

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


if __name__ == "__main__":
    main()
