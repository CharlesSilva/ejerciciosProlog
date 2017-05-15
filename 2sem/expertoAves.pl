:-dynamic si/1.
:-dynamic no/1.
:-dynamic info/2.

/*--- pajaro albatross ---*/
bird(laysan_albatross):-
  family(albatross),
  color(white),!.
bird(black_footed_albatross):-
  family(albatross),
  color(dark),!.

/*--- pajaro cisne ---*/
bird(whistling_swan):-
  family(swan),
  voice(muffled_musical_whistle).

bird(trumpeter_swan):-
  family(swan),
  voice(loud_trumpeting).

/*--- Clasificacion familiar ---*/
family(albatross):-
  order(tubenose),
  size(large),
  wings(long_narrow).

family(swan):-
  order(waterfowl),
  neck(long),
  color(white),
  flight(ponderous).

/*--- Reglas para relaciones jerarquicas ---*/
order(tubenose):-
  nostrils(external_tubular),
  live(at_sea),
  bill(hooked).

order(waterfowl):-
  feed(webbwed),
  bill(flat).

nostrils(X):-ask(nostrils,X),!.
live(X):-ask(live,X),!.

/*

  .
  .
  .

 */

ask(A,V):-                % pregunta por Atributo - Valor
  known(si,A,V),          % succed if true
  !.

ask(A,V):-
  known(_,A,V),
  !,fail.

ask(A,V):-
  write(A:V),             % ask user
  write('?(si/no)'),
  read(Y),                % get answer
  asserta(known(Y,A,V)),  % remeber it
  y==si.                  % succed or fail

start:-
  write("Atributo:"),
  read(A),
  write("Valor: "),
  read(V),
  ask(A,V).
