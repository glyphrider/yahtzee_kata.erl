-module(top_section_line_tests).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-import(top_section_line,[score/2]).

-ifdef(EUNIT).

top_section_line_test_() ->
    [
     {"score zero points for zero ones",
      ?_assertEqual(0,score(1,[2,3,4,5,6]))},
     {"score one point for a single one",
      ?_assertEqual(1,score(1,[1,2,3,4,5]))},
     {"score five for all ones",
      ?_assertEqual(5,score(1,[1,1,1,1,1]))}
    ].

-endif.
