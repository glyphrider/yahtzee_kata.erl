-module(yahtzee).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-export([ones/1]).

ones(_Roll) ->
    0.

-ifdef(EUNIT).

%%% EUnit tests for internal/private functions

-endif.

