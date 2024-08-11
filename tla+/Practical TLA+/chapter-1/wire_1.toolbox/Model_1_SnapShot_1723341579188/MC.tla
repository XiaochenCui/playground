---- MODULE MC ----
EXTENDS wire, TLC

\* Constant expression definition @modelExpressionEval
const_expr_172334157711023000 == 
Cardinality({"a", "b"})
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_172334157711023000>>)
----

\* INIT definition @modelBehaviorNoSpec:0
init_172334157711124000 ==
FALSE/\people = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_172334157711125000 ==
FALSE/\people' = people
----
=============================================================================
\* Modification History
\* Created Sat Aug 10 18:59:37 PDT 2024 by xiaochencui
