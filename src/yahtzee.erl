-module(yahtzee).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-export([ones/1]).

ones(Roll) ->
    lists:sum(lists:filter(fun(Die) -> Die == 1 end,Roll)).

-ifdef(EUNIT).

%%% EUnit tests for internal/private functions

-endif.

