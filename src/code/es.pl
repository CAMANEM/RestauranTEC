:-consult('database').
:-consult('bnf').
:-style_check(-singleton).


/*
 ______________________________________________________________
|		     funciones atómicas                        |
|______________________________________________________________|
*/
list_to_string(List, String):-
	atomic_list_concat(List, ' ', String).

/*input_to_list(L):-
	atom_codes(A,Cs),
	atomic_list_concat(L,' ',A).*/



getComidas(C):- findall(X,(comida([X,_,_])),C).

getBebidas(B):- findall(X,(bebida([X,_,_])),B).

printCategorie([L|N]):-  write("* Comida "), write(L),nl, printCategorie(N).


miembro(X,[X|_]).
miembro(X,[_|R]):- miembro(X,R).


longitud([],0).
longitud([_|R],Len):- longitud(R,Len1), Len is Len1+1.


validateComida([],X):- nl,writeln('La comida que quiere no está disponible'),nl,writeln('Vuelva a intentarlo'),nl.

validateComida([H|_],X):- getComidas(C),miembro(H,C),X = H,!.
validateComida([H|T],X):- getComidas(C),\+miembro(H,C),validateComida(T,X) .

%validateBebida:- .

/*
 ___________________________________________________
|		   Sistema Experto		    |
|___________________________________________________|

*/

startES:-
    writeln('Hola, ¡Bienvenido a RestauranTEC!'),
    nl,
    writeln("¿que tipo de comida se te antoja?"),
    nl,
    writeln("Tenemos disponible: "),nl,
    getComidas(Comidas),
    printCategorie(Comidas),
    sleep(0.5),
    read(Oracion1),

    validateComida(Oracion1,TipoComida),
    nl,write('comida ingresada: '),write(TipoComida).

