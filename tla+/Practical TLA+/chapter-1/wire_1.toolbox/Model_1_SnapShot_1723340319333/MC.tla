---- MODULE MC ----
EXTENDS wire, TLC

\* Constant expression definition @modelExpressionEval
const_expr_17233403160215000 == 
1 + 2
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_17233403160215000>>)
----

=============================================================================
\* Modification History
\* Created Sat Aug 10 18:38:36 PDT 2024 by xiaochencui
