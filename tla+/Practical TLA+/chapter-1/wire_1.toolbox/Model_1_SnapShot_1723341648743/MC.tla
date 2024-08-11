---- MODULE MC ----
EXTENDS wire, TLC

\* Constant expression definition @modelExpressionEval
const_expr_172334164669441000 == 
{1, 2, 2} \union (2..3)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_172334164669441000>>)
----

\* INIT definition @modelBehaviorNoSpec:0
init_172334164669442000 ==
FALSE/\people = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_172334164669443000 ==
FALSE/\people' = people
----
=============================================================================
\* Modification History
\* Created Sat Aug 10 19:00:46 PDT 2024 by xiaochencui
