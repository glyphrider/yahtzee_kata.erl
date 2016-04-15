-module(pair).

-behavior(score).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-export([score/1]).

score(Roll) ->
    apply(fun score/5,lists:sort(Roll)).

score(_A,_B,_C,D,D) ->
    D+D;
score(_A,_B,C,C,_D) ->
    C+C;
score(_A,B,B,_C,_D) ->
    B+B;
score(A,A,_B,_C,_D) ->
    A+A;
score(_A,_B,_C,_D,_E) ->
    0.

-ifdef(EUNIT).

score_test_() ->
    [
     {"pass out zero on no match",
      ?_assertEqual(0,score(a,b,c,d,e))}
    ].

-endif.
