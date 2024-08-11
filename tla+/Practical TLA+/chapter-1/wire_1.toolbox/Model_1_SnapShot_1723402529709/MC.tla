---- MODULE MC ----
EXTENDS wire, TLC

\* Constant expression definition @modelExpressionEval
const_expr_17234025274105000 == 
(1..3) \X (4..6)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_17234025274105000>>)
----

\* INIT definition @modelBehaviorNoSpec:0
init_17234025274106000 ==
FALSE/\people = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_17234025274107000 ==
FALSE/\people' = people
----
=============================================================================
\* Modification History
\* Created Sun Aug 11 11:55:27 PDT 2024 by xiaochencui
