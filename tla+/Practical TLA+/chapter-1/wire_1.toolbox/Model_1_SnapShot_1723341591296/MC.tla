---- MODULE MC ----
EXTENDS wire, TLC

\* Constant expression definition @modelExpressionEval
const_expr_172334158924129000 == 
Cardinality({"a", "b", "a"})
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_172334158924129000>>)
----

\* INIT definition @modelBehaviorNoSpec:0
init_172334158924130000 ==
FALSE/\people = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_172334158924131000 ==
FALSE/\people' = people
----
=============================================================================
\* Modification History
\* Created Sat Aug 10 18:59:49 PDT 2024 by xiaochencui
