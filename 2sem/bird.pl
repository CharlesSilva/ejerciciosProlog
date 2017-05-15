%Pajaro albatros
bird(laysan_albatros):-
		family(albatros),
		color(white),
		!.

bird(black_footed_albatros):-
		family(albatros),
		color(dark),
		!.

%Pajaro cisne silvador
bird(whistling_swan):-
		family(swan),
		voice(muffled_musical_whistle).

%Pajaro cisne trompetero
bird(trumpeter_swan):-
		family(swan),
		voice(loud_trumpetting).

%Clasificacion familiar
family(albatros):-
		order(tubenose),
		size(large),
		wing(long_narrow).

family(swan):-
		order(waterfowl),
		neck(long),
		color(white),
		flight(ponderous).

%Reglas de clasificacion de orden
order(tubenose):-
		nostrils(external_tubular),
		live(at_sea),
		bill(hooked).

order(waterfowl):-
		feet(webbed),
		bill(flat).

%Preguntas tipo atributo valor
nostrils(X):-ask(nostrils,X),!.
live(X):-ask(live,X),!.
bill:-ask(bill,X),!.
voice(X):-ask(voice,X),!.
wings(X):-ask(wings,X),!.

%Predicado que arma la pregunta y guarda el resultado
ask(A,V):-
	known(si,A,V), %Succeed if true
	!. %CHECAR

ask(A,V):-
	known(_,A,V), %Fail if false
	!,fail.

ask(A,V):-
	write(A:V),	%ask user
	write('?si/no):'),
	read(Y), %get answer
	asserta(known(Y,A,V)), %remember it
	Y==si. % succeed or fail
