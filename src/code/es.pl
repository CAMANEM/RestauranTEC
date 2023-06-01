:-consult('database').
:-consult('bnf').
:-style_check(-singleton).


/*
 ______________________________________________________________
|		     funciones atómicas                        |
|______________________________________________________________|
*/



getComidas(C):- findall(X,(comida([X,_,_])),C).
getComidas2(C):-findall(X,(comida([_,X,_])),C).

getBebidas(B):- findall(X,(bebida([X,_,_])),B).
getBebidas2(B):-findall(X,(bebida([_,X,_])),B).

getLugares(L):- findall(X,(lugar([X,_])),L).



printCategorie([L|N]):-  write("* "), write(L),nl,longitud(N,Len),( Len >= 1 ->printCategorie(N);!).

miembroList(H,[],Z):- Z=0 .
miembroList(H,[C|_],Z):- miembro(H,C,Z),(Z==1 ->!).
miembroList(H,[_|R],Z):- miembroList(H,R,Z).

miembro(X,[],Z):- Z = 0.
miembro(X,[Y|_],Z):- (X == Y -> Z = 1,!).
miembro(X,[_|R],Z):- miembro(X,R,Z).


miembroVal(X,[],Z,Val):- Z = 0.
miembroVal(X,[Y|_],Z,Val):- (X == Y -> Z = 1,!),Val = Y.
miembroVal(X,[_|R],Z,Val):- miembro(X,R,Z).


miembroListVal(H,[],Z,Val):- Z=0 .
miembroListVal(H,[C|_],Z,Val):- miembro(H,C,Z),(Z==1 ->!), Val=C.
miembroListVal(H,[_|R],Z,Val):- miembroList(H,R,Z).


longitud([],0).
longitud([_|R],Len):- longitud(R,Len1), Len is Len1+1.


validateComida([],X):- nl,writeln('La comida que quiere no está disponible'),nl,writeln('Vuelva a intentarlo'),nl, readln(Input),validateComida(Input,X).
validateComida([H|_],X):- getComidas(Ca),getComidas2(Cb),miembro(H,Ca,Za),miembroList(H,Cb,Zb),(Za==1 ->X = H,!;Zb==1 ->X = H,!).
validateComida([H|T],X):- validateComida(T,X).


validateBebida([],X):- nl,writeln('La bebida que quiere no está disponible'),nl,writeln('Vuelva a intentarlo'),nl, readln(Input),validateBebida(Input,X).
validateBebida([H|_],X):-  getBebidas(Ca),getBebidas2(Cb),miembro(H,Ca,Za),miembroList(H,Cb,Zb),(Za==1 ->X = H,!;Zb==1 ->X = H,!).
validateBebida([H|T],X):- validateBebida(T,X).


validateLugar([],X):- nl,writeln('El lugar que quiere no está disponible'),nl,writeln('Vuelva a intentarlo'),nl, readln(Input),validateLugar(Input,X).
validateLugar([H|_],X):- getLugares(C),miembro(H,C,Z),(Z==1 ->X = H,!).
validateLugar([H|T],X):- validateLugar(T,X).

checkSub(X,Y):- getComidas(Ca),miembroVal(X,Ca,Za,Val),(Za==1,Y = Val).
checkSub(X,Y):- getBebidas(Ca),miembroVal(X,Ca,Za,Val),(Za==1,Y = Val).
checkSub(X,Y):- getComidas2(Ca),miembroListVal(X,Ca,Za,Val),(Za==1,comida([Type,Val,_]) ), Y=Type.
checkSub(X,Y):- getBebidas2(Ca),miembroListVal(X,Ca,Za,Val),(Za==1,bebida([Type,Val,_]) ), Y=Type.



%checkBebida().


/*
 ___________________________________________________
|		   Sistema Experto		    |
|___________________________________________________|

*/

startES:-
    writeln('
┌───── •✧✧• ─────┐
 -RestauranTEC-
└───── •✧✧• ─────┘
'),
    writeln('Hola, ¡Bienvenido a RestauranTEC!'),
    nl,
    writeln("¿que tipo de comida se te antoja?"),
    nl,
    writeln("Tenemos disponible: "),nl,
    getComidas(Comidas),
    %writeln(Comidas),
    printCategorie(Comidas),
    readln(Oracion1),
    valid_sentence(Oracion1,Oracionver),
    validateComida(Oracionver,TipoComida),
    nl,write('comida ingresada: '),write(TipoComida),nl,


    writeln("¿que tipo de bebida desea tomar?"),
    nl,
    writeln("Tenemos disponible: "),nl,
    getBebidas(Bebidas),
    printCategorie(Bebidas),
    readln(Oracion2),
    valid_sentence(Oracion2,Oracionver2),
    validateBebida(Oracionver2,TipoBebida),
    nl,write('bebida ingresada: '),write(TipoBebida),nl,


    writeln("¿En que zona está buscando el restaurante?"),
    nl,
    writeln("Los restaurantes que tenemos cubren: "),nl,
    getLugares(Lug),
    printCategorie(Lug),
    readln(Oracion3),
    valid_sentence(Oracion3,Oracionver3),
    validateLugar(Oracionver3,Lugar),
    nl,write('lugar ingresado: '),write(Lugar),nl,
    write('Check Comida: '),write(TipoComida),checkSub(TipoComida,TipoComidaVer),write(TipoComidaVer),
    restaurante([Nombre,TipoComida,Lugar,Ubicacion,Menu,Capacidad,Disposicion]),
    writeln(Nombre).

