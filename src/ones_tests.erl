-module(ones_tests).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-import(ones,[score/1]).

-ifdef(EUNIT).

score_test_() ->
    [
     {"score zero points for zero ones",
      ?_assertEqual(0,score([2,3,4,5,6]))},
     {"score one point for a single one",
      ?_assertEqual(1,score([1,2,3,4,5]))},
     {"score five for all ones",
      ?_assertEqual(5,score([1,1,1,1,1]))}
    ].

-endif.
