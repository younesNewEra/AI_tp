% Q1
belongs_to(Element, [_, Tail]) :-
    belongs_to(Element, Tail).

% Q2
belongs_to(Element, [Element | _]) :-
    write("yes, it is").

% Q3
last_element(Element, [Element]).
last_element(Element, [_ | Tail]) :-
    last_element(Element, Tail),
    write("yes, it is").

% Q4
is_penultimate(Element, [Element, _]) :- !.
is_penultimate(Element, [_ | Tail]) :-
    is_penultimate(Element, Tail).

% Q5
remove_kth_element(1, [_ | Tail], Tail).
remove_kth_element(K, [Head | Tail], [Head | ResultTail]) :-
    K > 1,
    K1 is K - 1,
    remove_kth_element(K1, Tail, ResultTail).

% Q6
list_length([], 0).
list_length([_ | Tail], Length) :-
    list_length(Tail, TailLength),
    Length is TailLength + 1.

% Q7
all_even([]).
all_even([Head | Tail]) :-
    Head mod 2 =:= 0,
    all_even(Tail).

% Q8
concat_lists([], List2, List2).
concat_lists([Head | List1], List2, [Head | ResultList]) :-
    concat_lists(List1, List2, ResultList).

% Q9
palindrome([]) :-
    write("empty list").
palindrome(List) :-
    reverse(List, List),
    write("equal").