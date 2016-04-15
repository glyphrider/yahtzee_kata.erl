-module(yahtzee).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-export([score/2]).

score(Roll,Category) ->
    Category:score(Roll).

-ifdef(EUNIT).

%%% EUnit tests for internal/private functions

-endif.

