-module(three_of_a_kind).

-behavior(score).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-export([score/1]).

score(Roll) ->
    apply(fun score/6,[lists:sum(Roll)|lists:sort(Roll)]).

score(Score,A,A,A,_B,_C) ->
    Score;
score(Score,_A,B,B,B,_C) ->
    Score;
score(Score,_A,_B,C,C,C) ->
    Score;
score(_Score,_A,_B,_C,_D,_E) ->
    0.

-ifdef(EUNIT).

score_test_() ->
    [
     {"pass out zero on no-match",
      ?_assertEqual(0,score(score,a,b,c,d,e))},
     {"pass out score on three a",
      ?_assertEqual(score,score(score,a,a,a,b,c))},
     {"pass out score on three b",
      ?_assertEqual(score,score(score,a,b,b,b,c))},
     {"pass out score on three c",
      ?_assertEqual(score,score(score,a,b,c,c,c))}
    ].

-endif.
