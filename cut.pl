data(uno).
data(dos).
data(tres).


corte(X,Y,Z):-
	data(X),!,
	data(Y),
	data(Z).

corte('ultima', 'no hay mas combinaciones','...').

main:-
	corte(X,Y,Z),
	write(X-Y-Z),nl,
	fail.
