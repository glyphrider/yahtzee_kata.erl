-module(two_pair).

-behavior(score).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-export([score/1]).

score(Roll) ->
    apply(fun score/5,lists:sort(Roll)).

score(_A,B,B,C,C) ->
    B+B+C+C;
score(A,A,_B,C,C) ->
    A+A+C+C;
score(A,A,B,B,_C) ->
    A+A+B+B;
score(_A,_B,_C,_D,_E) ->
    0.

-ifdef(EUNIT).

score_test_() ->
    [
     {"two pair stacked low",
      ?_assertEqual(6,score(1,1,2,2,3))},
     {"two pair spaced",
      ?_assertEqual(8,score(1,1,2,3,3))},
     {"two pair stacked high",
      ?_assertEqual(10,score(1,2,2,3,3))}
    ].

-endif.
