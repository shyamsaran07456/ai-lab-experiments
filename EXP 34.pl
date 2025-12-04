initial_state(state(at_door, on_floor, at_window, has_not_eaten)).
final_state(state(_, _, _, has_eaten)).

action(state(at_door, on_floor, at_window, has_not_eaten), climb,   state(at_window, on_window, at_window, has_not_eaten)).
action(state(at_window, on_floor, at_window, has_not_eaten), grasp,   state(at_window, on_floor, at_window, has_eaten)).
action(state(at_window, on_window, at_window, has_not_eaten), climb,   state(at_door, on_window, at_door, has_not_eaten)).
action(state(at_door, on_window, at_door, has_not_eaten), walk,    state(at_middle, on_floor, at_middle, has_not_eaten)).
action(state(at_middle, on_floor, at_middle, has_not_eaten), grasp,   state(at_middle, on_floor, at_middle, has_eaten)).
action(state(at_middle, on_floor, at_middle, has_eaten), walk,    state(at_door, on_floor, at_door, has_eaten)).

execute_actions(CurrentState, [], CurrentState) :-
    final_state(CurrentState).
execute_actions(CurrentState, [Action|Rest], FinalState) :-
    action(CurrentState, Action, NextState),
    execute_actions(NextState, Rest, FinalState).

solve_problem(ActionList) :-
    initial_state(InitialState),
    execute_actions(InitialState, ActionList, FinalState),
    final_state(FinalState).
