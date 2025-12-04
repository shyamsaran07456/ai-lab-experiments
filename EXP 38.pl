cannot_fly(penguin).
can_fly(eagle).

has_wings(eagle).
has_wings(penguin).
has_wings(crow).

bird(X) :- cannot_fly(X).
bird(X) :- can_fly(X).

infer(X) :- bird(X).
