domains
	list = integer*. 
	
predicates	
	biggerThan(list, integer, list). % список, число, результат
	oddElements(list, list). % список, результат
	deleteElement(list, integer, list).% список, число, результат	
	createSet(list, list). %исходный список, результат
	
clauses
	biggerThan([], _, []).
	biggerThan([H|T], Min, [H|ResTail]) :- 
		H > Min,
		biggerThan(T, Min, ResTail), !.  
	biggerThan([_|T], Min, ResTail) :- 
		biggerThan(T, Min, ResTail).
	
	oddElements([], []).
	oddElements([_], []).
	oddElements([_|[H|T]],[H|ResTail]) :-
		oddElements(T, ResTail).

	deleteElement([], _, []).
	deleteElement([El|T], El, ResTail) :- 
		deleteElement(T, El, ResTail), !.
	deleteElement([H|T], El, [H|ResTail]) :- 
		deleteElement(T, El, ResTail).

	createSet([], []).
	createSet([H|T], [H|ResTail]) :-
		deleteElement(T, H, TmpRes),
		createSet(TmpRes, ResTail).
	
goal
	%biggerThan([1, 2, 3, 4, 2, 1], 5, Res).
	%oddElements([1, 2, 3, 4], Res).
	%oddElements([1, 2, 3], Res).
	%deleteElement([1, 2, 3, 3, 1, 3, 4], 3, Res).
	%createSet([1, 2, 3, 3, 1, 3, 4], Res).
	%createSet([1, 1, 1], Res).
