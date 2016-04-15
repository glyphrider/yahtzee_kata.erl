-module(small_straight).

-behavior(score).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-export([score/1]).

score(Roll) ->
    score_sorted(lists:sort(Roll)).

score_sorted([1,2,3,4,5]) ->
    15;
score_sorted(_) ->
    0.

-ifdef(EUNIT).

-endif.
