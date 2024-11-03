# by Achour Younes and houcem el imam
:- dynamic task/4.

create_task(Id, Description, Assignee) :-
    \+ task(Id, _, _, _),
    assertz(task(Id, Description, Assignee, false)),
    format("Task created: ~w.~n", [Id]).

assign_task(Id, NewAssignee) :-
    retract(task(Id, Description, _, Status)),
    assertz(task(Id, Description, NewAssignee, Status)),
    format("Task ~w assigned to user: ~w.~n", [Id, NewAssignee]).

mark_completed(Id) :-
    retract(task(Id, Description, Assignee, _)),
    assertz(task(Id, Description, Assignee, true)),
    format("Task ~w marked as completed.~n", [Id]).

display_tasks :-
    forall(task(Id, Description, Assignee, Status),
           (format("Task ~w:~n- Description: ~w~n- Assignee: ~w~n- Completion status: ~w~n",
                   [Id, Description, Assignee, Status]))).

display_tasks_assigned_to(Assignee) :-
    format("Tasks assigned to ~w:~n", [Assignee]),
    forall(task(Id, Description, Assignee, Status),
           (format("Task ~w:~n- Description: ~w~n- Completion status: ~w~n",
                   [Id, Description, Status]))).

display_completed_tasks :-
    format("Completed tasks:~n"),
    forall(task(Id, Description, Assignee, true),
           (format("Task ~w:~n- Description: ~w~n- Assignee: ~w~n- Completion status: true~n",
                   [Id, Description, Assignee]))).
?- create_task(2, 'Design homepage layout', 'Bob').
