-module(four_of_a_kind).

-behavior(score).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-export([score/1]).

score(Roll) ->
    apply(fun score/6,[lists:sum(Roll)|lists:sort(Roll)]).

score(Total,A,A,A,A,_B) ->
    Total;
score(Total,_A,B,B,B,B) ->
    Total;
score(_Total,_A,_B,_C,_D,_E) ->
    0.

-ifdef(EUNIT).

score_test_() ->
    [
     {"return total if first four dice are the same",
      ?_assertEqual(total,score(total,same,same,same,same,not_the_same))},
     {"return total if last four dice are the same",
      ?_assertEqual(total,score(total,not_the_same,same,same,same,same))},
     {"return zero otherwise",
      ?_assertEqual(0,score(total,a,b,c,d,e))}
    ].

-endif.
