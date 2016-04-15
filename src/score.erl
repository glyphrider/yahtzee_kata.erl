-module(score).

-callback score(Roll :: list(integer())) -> integer().
