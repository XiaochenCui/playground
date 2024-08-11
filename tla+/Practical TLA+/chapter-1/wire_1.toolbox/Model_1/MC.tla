---- MODULE MC ----
EXTENDS wire, TLC

\* Constant expression definition @modelExpressionEval
const_expr_172340257703417000 == 
(1..3) \X ((10..12) \X (100 .. 102))
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_172340257703417000>>)
----

\* INIT definition @modelBehaviorNoSpec:0
init_172340257703418000 ==
FALSE/\people = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_172340257703419000 ==
FALSE/\people' = people
----
=============================================================================
\* Modification History
\* Created Sun Aug 11 11:56:17 PDT 2024 by xiaochencui
