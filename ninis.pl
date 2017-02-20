/*
  consultas simples
  ejemplo de un directorio de estudiantes y trabajadores.

  SWIPROLOG
*/

trabaja(pepe,gamesa).
trabaja(lulu,ibm).
estudia(pepe,uvm).
estudia(lulu,upiicsa).
estudia(raul,escom).

inicio:-
  write_ln('Ingresa un nombre: '),
  read(Persona),
  (labora(Persona);estudy(Persona));nini(Persona).

labora(Individuo):-
  trabaja(Individuo,Organizacion),
  write('Labora en: '),
  write(Organizacion),nl.

estudy(Individuo):-
  estudia(Individuo,Escuela),
  write('Estudia en: '),
  write(Escuela),nl.

nini(Individuo):-
  write('ES UN NINI!!!').
