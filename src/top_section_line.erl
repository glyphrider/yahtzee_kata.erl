-module(top_section_line).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-export([score/2]).

score(Line,Roll) ->
    lists:sum(lists:filter(fun(Die) ->
				   Die == Line
			   end,Roll)).

-ifdef(EUNIT).

-endif.
