:-consult('database').
:-consult('bnf').
:-style_check(-singleton).


/*
 ______________________________________________________________
|		     funciones atómicas                        |
|______________________________________________________________|
*/



getComidas(C):- findall(X,(comida([X,_,_])),C).

getBebidas(B):- findall(X,(bebida([X,_,_])),B).

getLugares(L):- findall(X,(lugar([X,_])),L).



printCategorie([L|N]):-  write("* "), write(L),nl,longitud(N,Len),( Len >= 1 ->printCategorie(N);!).


miembro(X,[X|_]).
miembro(X,[_|R]):- miembro(X,R).


longitud([],0).
longitud([_|R],Len):- longitud(R,Len1), Len is Len1+1.


validateComida([],X):- nl,writeln('La comida que quiere no está disponible'),nl,writeln('Vuelva a intentarlo'),nl, readln(Input),validateComida(Input,X).
validateComida([H|_],X):- getComidas(C),miembro(H,C),X = H,!.
validateComida([H|T],X):- getComidas(C),\+miembro(H,C),validateComida(T,X).


validateBebida([],X):- nl,writeln('La bebida que quiere no está disponible'),nl,writeln('Vuelva a intentarlo'),nl, readln(Input),validateBebida(Input,X).
validateBebida([H|_],X):- getBebidas(C),miembro(H,C),X = H,!.
validateBebida([H|T],X):- getBebidas(C),\+miembro(H,C),validateBebida(T,X).


validateLugar([],X):- nl,writeln('El lugar que quiere no está disponible'),nl,writeln('Vuelva a intentarlo'),nl, readln(Input),validateLugar(Input,X).
validateLugar([H|_],X):- getLugares(C),miembro(H,C),X = H,!.
validateLugar([H|T],X):- getLugares(C),\+miembro(H,C),validateLugar(T,X).

/*
 ___________________________________________________
|		   Sistema Experto		    |
|___________________________________________________|

*/

startES:-
    writeln('
'),
    writeln('Hola, ¡Bienvenido a RestauranTEC!'),
    nl,
    writeln("¿que tipo de comida se te antoja?"),
    nl,
    writeln("Tenemos disponible: "),nl,
    getComidas(Comidas),
    printCategorie(Comidas),
    readln(Oracion1),
    validateComida(Oracion1,TipoComida),
    nl,write('comida ingresada: '),write(TipoComida),nl,

    writeln("¿que tipo de bebida desea tomar?"),
    nl,
    writeln("Tenemos disponible: "),nl,
    getBebidas(Bebidas),
    printCategorie(Bebidas),
    readln(Oracion2),
    validateBebida(Oracion2,TipoBebida),
    nl,write('bebida ingresada: '),write(TipoBebida),


    writeln("¿En que zona está buscando el restaurante?"),
    nl,
    writeln("Los restaurantes que tenemos cubren: "),nl,
    getLugares(Lug),
    printCategorie(Lug),
    readln(Oracion3),
    validateLugar(Oracion3,Lugar),
    nl,write('lugar ingresado: '),write(Lugar).

