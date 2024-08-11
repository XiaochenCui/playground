---- MODULE MC ----
EXTENDS wire, TLC

\* Constant expression definition @modelExpressionEval
const_expr_172334039155711000 == 
1 + 2
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_172334039155711000>>)
----

\* INIT definition @modelBehaviorNoSpec:0
init_172334039155712000 ==
FALSE/\people = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_172334039155713000 ==
FALSE/\people' = people
----
=============================================================================
\* Modification History
\* Created Sat Aug 10 18:39:51 PDT 2024 by xiaochencui
