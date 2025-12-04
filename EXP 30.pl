move(0, _, _, _) :- !.
move(N, From, To, Aux) :-
    N > 0,
    N1 is N - 1,
    move(N1, From, Aux, To),
    write('Move the top disk from '), write(From), write(' to '), write(To), nl,
    move(N1, Aux, To, From).
