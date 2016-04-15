-module(ones).

-behavior(score).

-export([score/1]).

score(Roll) ->
    top_section_line:score(1,Roll).
