-module(yahtzee).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-export([ones/1,twos/1,three_of_a_kind/1]).

ones(Roll) ->
    top_section_line(1,Roll).

twos(Roll) ->
    top_section_line(2,Roll).

top_section_line(Line,Roll) ->
    lists:sum(lists:filter(fun(Die) ->
				   Die == Line
			   end,Roll)).


three_of_a_kind(Roll) ->
    apply(fun three_of_a_kind/6,[lists:sum(Roll)|lists:sort(Roll)]).

three_of_a_kind(Score,A,A,A,_B,_C) ->
    Score;
three_of_a_kind(Score,_A,B,B,B,_C) ->
    Score;
three_of_a_kind(Score,_A,_B,C,C,C) ->
    Score;
three_of_a_kind(_Score,_A,_B,_C,_D,_E) ->
    0.

-ifdef(EUNIT).

%%% EUnit tests for internal/private functions
top_section_line_test_() ->
    [
     {"score zero points for zero ones",
      ?_assertEqual(0,top_section_line(1,[2,3,4,5,6]))},
     {"score one point for a single one",
      ?_assertEqual(1,top_section_line(1,[1,2,3,4,5]))},
     {"score five for all ones",
      ?_assertEqual(5,top_section_line(1,[1,1,1,1,1]))}
    ].

three_of_a_kind_test_() ->
    [
     {"pass out zero on no-match",
      ?_assertEqual(0,three_of_a_kind(score,a,b,c,d,e))},
     {"pass out score on three a",
      ?_assertEqual(score,three_of_a_kind(score,a,a,a,b,c))},
     {"pass out score on three b",
      ?_assertEqual(score,three_of_a_kind(score,a,b,b,b,c))},
     {"pass out score on three c",
      ?_assertEqual(score,three_of_a_kind(score,a,b,c,c,c))}
    ].

-endif.

