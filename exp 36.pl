% -----------------------------------------
% BEST FIRST SEARCH (GREEDY) - PROLOG
% -----------------------------------------

% -------- Heuristic values ----------
h(a, 10).
h(b, 8).
h(c, 5).
h(d, 7).
h(e, 3).
h(f, 6).
h(g, 0).     % Goal has lowest heuristic

% -------- Graph edges ----------
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(e, g).
edge(f, g).

% -------- Goal ----------
goal(g).

% -----------------------------------------
% MAIN PREDICATE
% -----------------------------------------
best_first(Start, Solution) :-
    search([[Start]], Solution).

% If the first path reaches the goal
search([[Node|Path]|_], [Node|Path]) :-
    goal(Node).

% Otherwise expand nodes
search([Path|OtherPaths], Solution) :-
    extend(Path, NewPaths),
    append(OtherPaths, NewPaths, AllPaths),
    sort_by_heuristic(AllPaths, SortedPaths),
    search(SortedPaths, Solution).

% -----------------------------------------
% Extend current path
% -----------------------------------------
extend([Node|Path], NewPaths) :-
    findall([NewNode, Node|Path],
            (edge(Node, NewNode),
             \+ member(NewNode, [Node|Path])),
            NewPaths).

% -----------------------------------------
% Sort paths based on heuristic value
% -----------------------------------------
sort_by_heuristic(Paths, Sorted) :-
    add_heuristic(Paths, Pairs),
    sort(Pairs, SortedPairs),
    remove_heuristic(SortedPairs, Sorted).

% Attach heuristic to each path
add_heuristic([], []).
add_heuristic([[Node|Path]|T], [[H,[Node|Path]]|R]) :-
    h(Node, H),
    add_heuristic(T, R).

% Remove heuristic after sorting
remove_heuristic([], []).
remove_heuristic([[_,Path]|T], [Path|R]) :-
    remove_heuristic(T, R).
