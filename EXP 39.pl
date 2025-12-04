cannot_fly(penguin).
can_fly(eagle).

has_wings(eagle).
has_wings(penguin).
has_wings(crow).

bird(penguin).
bird(eagle).
bird(crow).

can_fly_bird(X) :-
    can_fly(X).

can_fly_bird(X) :-
    has_wings(X),
    \+ cannot_fly(X).

infer(X) :-
    bird(X),
    can_fly_bird(X).
