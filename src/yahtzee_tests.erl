-module(yahtzee_tests).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-import(yahtzee,[ones/1]).

-ifdef(EUNIT).

ones_test_() ->
    [
     {"score zero points for zero ones",
      ?_assertEqual(0,ones([2,3,4,5,6]))},
     {"score one point for a single one",
      ?_assertEqual(1,ones([1,2,3,4,5]))},
     {"score five for all ones",
      ?_assertEqual(5,ones([1,1,1,1,1]))}
    ].

-endif.
