trabaja(pepe,gamesa).
trabaja(lulu,ibm).
trabaja(jose,cocacola).
estudia(pepe,uvm).
estudia(lulu,upiicsa).
estudia(raul,escom).

inicio:-
  write_ln('Ingresa un nombre: '),
  read(X),
  (labora(X)->(not(estudy(X)),not(trabaja(X,Org))))->nini(X).

labora(Individuo):-
  trabaja(Individuo,Organizacion),
  write('Labora en: '),
  write(Organizacion),nl;
  write('No trabaja'),nl.

estudy(Individuo):-
  estudia(Individuo,Escuela),
  write('Estudia en: '),
  write(Escuela),nl;
  write('No Estudia'),nl,false.

nini(Individuo):-
    write(Individuo),
    write(" ES NINI.").
