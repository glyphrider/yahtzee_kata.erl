-module(twos).

-behavior(score).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-export([score/1]).

score(Roll) ->
    top_section_line:score(2,Roll).

-ifdef(EUNIT).

-endif.
