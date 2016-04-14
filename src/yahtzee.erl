-module(yahtzee).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-export([ones/1,three_of_a_kind/1]).

ones(Roll) ->
    lists:sum(lists:filter(fun(Die) -> Die == 1 end,Roll)).

three_of_a_kind(Roll) ->
    apply(fun three_of_a_kind/6,[lists:sum(Roll)|lists:sort(Roll)]).

three_of_a_kind(Score,A,A,A,_B,_C) ->
    Score;
three_of_a_kind(Score,_A,B,B,B,_C) ->
    Score;
three_of_a_kind(Score,_A,_B,C,C,C) ->
    Score;
three_of_a_kind(_Score,_A,_B,_C,_D,_E) ->
    0.

-ifdef(EUNIT).

%%% EUnit tests for internal/private functions
three_of_a_kind_test_() ->
    [
     {"pass out zero on no-match",
      ?_assertEqual(0,three_of_a_kind(score,a,b,c,d,e))},
     {"pass out score on three a",
      ?_assertEqual(score,three_of_a_kind(score,a,a,a,b,c))},
     {"pass out score on three b",
      ?_assertEqual(score,three_of_a_kind(score,a,b,b,b,c))},
     {"pass out score on three c",
      ?_assertEqual(score,three_of_a_kind(score,a,b,c,c,c))}
    ].

-endif.

