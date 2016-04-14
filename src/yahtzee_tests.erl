-module(yahtzee_tests).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-import(yahtzee,[ones/1,twos/1,three_of_a_kind/1]).

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

twos_test_() ->
    [
     {"score zero points for zero ones",
      ?_assertEqual(0,twos([1,3,4,5,6]))}
    ].

three_of_a_kind_test_() ->
    [
     {"score zero points for no three-of-a-kind",
      ?_assertEqual(0,three_of_a_kind([1,2,3,4,5]))},
     {"score total on three-of-a-kind",
      ?_assertEqual(15,three_of_a_kind([4,1,4,2,4]))}
    ].

-endif.
