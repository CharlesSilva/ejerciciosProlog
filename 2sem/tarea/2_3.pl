top_goal(X):-start.
:-dynamic si/1.
:-dynamic no/1.
:-dynamic info/2.
/*SHELL NATIVO */
go:-
  greeting,
  repeat,
  write('>'),read(X),
  do(X),
  X == quit.

greeting:-
  write("Este es el shell nativo de prolog."),nl,
  write("Ingrese load, consult o quit en el prompt"),nl.

do(load):-load_kb,!.
do(consult):-solve,!.
do(quit).

do(X):-
  write(X),
  write("no es un comando valido"),nl,fail.

load_kb:-
  write("Ingrese el nombre del archivo: "),
  read(F),
  reconsult(F).

solve:-
  top_goal(X),
  write("la respuesta es:"),
  write(X),nl.

solve:-
  write("No answer found"),nl.

/* expertoAves.pl */

start:-
  assert(si(end)),
	assert(no(end)),

	preguntar.

start:-
  preguntar.

introducir:-
	write('Que objeto es(fin - para terminar)?: '),
	read(Object),
	not(Object = 'fin'),
	atributos(Object, []),
	write(' Otro objeto(s/n)?: '),!,
	read(A), A = s,
  introducir.

atributos(Obj, Lista):-
	write(Obj),
	write(' es/tiene/hace (fin - para terminar)?: '),
	read(Attribute),
	not(Attribute = 'fin'),
	add(Attribute, Lista, Lista2),
	atributos(Obj, Lista2).

atributos(Obj, Lista):-
	assert(info(Obj, Lista)),
	open('b_conoc.txt', append, Stream),
	write(Stream, 'user:info('),
	write(Stream, Obj),
	write(Stream, ','),
	write(Stream, Lista),
	write(Stream, ').'),
	nl(Stream),
	close(Stream).

member(X, [X|L]):- !.

member(X, [Y|L]):- member(X,L).

add(X,L,L):- member(X,L), !.

add(X, L,[X|L]).

/* pide informacion al usuario para encontrar un objeto(meta) */

preguntar:-
	info(O,A),
	anterioressi(A),
	anterioresno(A),
	intentar(O,A),
  purgar.

preguntar:-
  purgar.

/*Selecciona los objetos que tienen atributos apropiados ya determinados anteriormente */
anterioressi(A):-
	si(T), !,
	xanterioressi(T,A,[]), !.

xanterioressi(end,_,_):- !.

xanterioressi(T,A,L):-
	member(T,A), !,
	add(T,L,L2),
	si(X),
	not(member(X,L2)),!,
	xanterioressi(X,A,L2).

/* seleccionar todos los objetos que tienen atributos ya determinados como no pertenecientes al objeto */

anterioresno(A):-
	no(T),
	xanterioresno(T,A,[]), !.

xanterioresno(end,_,_):- !.

xanterioresno(T,A,L):-
	not(member(T,A)), !,
	add(T,L,L2),
	no(X),not(member(X,L2)), !,
	xanterioresno(X,A,L2).

/* intentar una hipotesis(meta) */
intentar(O,[]):-
	write('El objeto encontrado es '),
	write(O), nl.

intentar(O,[X|T]):-
	si(X), !,
	intentar(O,T).

intentar(O,[X|T]):-
	write('¿El objeto tiene como atributo:  '),
	write(X), write('? (s/n): '),
	read(R),
	procesar(O,X,R), !,
	intentar(O,T).

/* procesar varias respuestas */
procesar(_,X,s):-
	asserta(si(X)), !.

procesar(_,X,n):-
	asserta(no(X)),!,fail.

procesar(O, X, porque):-
	write('Creo que puede ser: '),
	write(O),
	write(' porque tiene: '),nl,
	si(Z),
	xwrite(Z),
	nl,
	Z = end, !,
	write('tiene el atributo '),
	write(X),
	write('? (s/n): '),
	read(R),
	procesar(O,X,R), !.

xwrite(end).

xwrite(X):-
	write(X).

purgar:-
	retract(si(X)),
	X = end, fail.

purgar:-
	retract(no(X)),
	X = end.

member(X,[X|_L]):-!.
member(X,[_Y|L]):-
	member(X,L).

add(X,L,L):-member(X,L),!.
add(X,L,[X|L]).
