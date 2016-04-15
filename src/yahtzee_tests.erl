-module(yahtzee_tests).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-import(yahtzee,[score/2]).

-ifdef(EUNIT).

category_test_() ->
    {setup,
     fun() ->
	     meck:new(category,[non_strict])
     end,
     fun(ok) ->
	     meck:unload(category)
     end,
     [
      {"confirm that score calls category:score",
       fun() ->
	       meck:expect(category,score,fun([1,2,3,4,5]) -> 99 end),
	       ?assertEqual(99,score([1,2,3,4,5],category))
       end}
     ]}.

no_such_category_test_() ->
    {"confirm that bad category throws error:undef",
     ?_assertError(undef,score([1,2,3,4,5],category))}.

ones_test_() ->
    [
     {"score zero points for zero ones",
      ?_assertEqual(0,score([2,3,4,5,6],ones))},
     {"score one point for a single one",
      ?_assertEqual(1,score([1,2,3,4,5],ones))},
     {"score five for all ones",
      ?_assertEqual(5,score([1,1,1,1,1],ones))}
    ].

twos_test_() ->
    [
     {"score zero points for zero ones",
      ?_assertEqual(0,score([1,3,4,5,6],twos))}
    ].

pair_test_() ->
    [
     {"score zero points for no pair",
      ?_assertEqual(0,score([1,2,3,4,5],pair))},
     {"score two points for a pair of ones",
      ?_assertEqual(2,score([1,1,2,3,4],pair))},
     {"score two points for a disconnected pair of ones",
      ?_assertEqual(2,score([1,2,3,4,1],pair))},
     {"score four points for a pair of ones and a pair of twos",
      ?_assertEqual(4,score([2,2,1,1,3],pair))}
    ].

three_of_a_kind_test_() ->
    [
     {"score zero points for no three-of-a-kind",
      ?_assertEqual(0,score([1,2,3,4,5],three_of_a_kind))},
     {"score total on three-of-a-kind",
      ?_assertEqual(15,score([4,1,4,2,4],three_of_a_kind))}
    ].

four_of_a_kind_test_() ->
    [
     {"score five points for five ones",
      ?_assertEqual(5,score([1,1,1,1,1],four_of_a_kind))},
     {"score six points for a little four of a kind",
      ?_assertEqual(6,score([1,1,2,1,1],four_of_a_kind))},
     {"score twenty-nine for a big four of a kind",
      ?_assertEqual(29,score([6,5,6,6,6],four_of_a_kind))},
     {"score zero for garbage",
      ?_assertEqual(0,score([1,1,1,2,2],four_of_a_kind))}
    ].

two_pair_test_() ->
    [
     {"score zero on a bust",
      ?_assertEqual(0,score([1,2,3,4,5],two_pair))}
    ].

small_straight_test_() ->
    [
     {"small straight scores 15",?_assertEqual(15,score([1,2,3,4,5],small_straight))},
     {"busted straight scores 0",?_assertEqual(0,score([1,2,3,4,6],small_straight))}
    ].
-endif.
