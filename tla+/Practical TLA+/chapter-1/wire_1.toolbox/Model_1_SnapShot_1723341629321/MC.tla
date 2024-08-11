---- MODULE MC ----
EXTENDS wire, TLC

\* Constant expression definition @modelExpressionEval
const_expr_172334162724735000 == 
(1..2) \union (2..3)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_172334162724735000>>)
----

\* INIT definition @modelBehaviorNoSpec:0
init_172334162724736000 ==
FALSE/\people = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_172334162724737000 ==
FALSE/\people' = people
----
=============================================================================
\* Modification History
\* Created Sat Aug 10 19:00:27 PDT 2024 by xiaochencui
