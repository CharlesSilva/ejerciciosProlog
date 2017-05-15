top_goal(X):-bird(X).
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
