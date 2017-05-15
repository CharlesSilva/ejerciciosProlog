/*
  MANEJO DE LISTAS
  ejemplo de el menu de un restaurante.

  SWIPROLOG
*/

:- dynamic cliente/1. /* NOS PERMITE ADITAR UN RECURSO ESTATICO EN TIEMPO DE EJECUCION */
menu(sopa,[fideo,lentejas,crema,codito]).
menu(arroz,[rojo,verde,blanco]).
menu(guisado,[milanesa,enchilada,puerco]).
menu(postre,[gelaina,pastel,helado]).
menu(bebida,[refresco,agua,jugo]).
cliente([]). /* LISTA ESTATICA */

inicio:-
  write('<<<<< -- MENU RESTAURANTE -- >>>>>'),
  nl,
  repeat,
  muestraop(X),
  X=7,
  write(adios),nl.

muestraop(X):-
  write('Escribe el numero de tu opcion'),nl,
  write('1 -- SOPA'),nl,
  write('2 -- ARROZ'),nl,
  write('3 -- GUISADO'),nl,
  write('4 -- POSTRE'),nl,
  write('5 -- BEBIDA'),nl,
  write('6 -- PEDIDO'),nl,
  write('7 -- SALIR'),nl,
  read(X),
  op(X),!.

op(1):-
  menu(sopa,L_sopas),
  write(L_sopas),nl,
  write('Elija la sopa: '),
  read(Platillo),
  guarda_eleccion(Platillo).

op(2):-
  menu(arroz,L_arroz),
  write(L_arroz),nl,
  write('Elija el arroz: '),
  read(Arroz),
  guarda_eleccion(Arroz).

op(3):-
  menu(guisado,L_guisado),
  write(L_guisado),nl,
  write('Elija el guisado: '),
  read(Guisado),
  guarda_eleccion(Guisado).

op(4):-
  menu(postre,L_postres),
  write(L_postres),nl,
  write('Elija el postre: '),
  read(Postre),
  guarda_eleccion(Postre).

op(5):-
  menu(bebida,L_bebida),
  write(L_bebida),nl,
  write('Elija su bebida: '),
  read(Bebida),
  guarda_eleccion(Bebida).

op(6):-
  write('Su pedido es: '),nl,
  cliente(Lista2),
  write(Lista2),nl.

op(7).

op(_):-
write('INGRESE UNA OPCION CORRECTA'),nl.

guarda_eleccion(Platillo):-
  cliente(Lista),
  anade(Platillo,Lista,Lista2),
  retract(cliente(Lista)),
  assert(cliente(Lista2)).

anade(Platillo,Lista,Lista2):- member(Platillo,Lista),!.
anade(Platillo,Lista,[Platillo|Lista]).
