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
printCategorie([L|N],[Subcat|SubcatNext]):-  write("* "), write(L),nl,printSubCategorie(Subcat),longitud(N,Len),( Len >= 1 ->printCategorie(N,SubcatNext);!).
printSubCategorie([L|N]):-  write(" + "), write(L),nl,longitud(N,Len),( Len >= 1 ->printSubCategorie(N);!).

miembroList(H,[],Z):- Z=0 .
miembroList(H,[C|_],Z):- miembro(H,C,Z),(Z==1 ->!).
miembroList(H,[_|R],Z):- miembroList(H,R,Z).

miembro(X,[],Z):- Z = 0.
miembro(X,[Y|_],Z):- (X == Y -> Z = 1,!).
miembro(X,[_|R],Z):- miembro(X,R,Z).


miembroVal(X,[],Z,Val):- Z = 0.
miembroVal(X,[Y|_],Z,Val):- (X == Y -> Z = 1),Val = Y,!.
miembroVal(X,[_|R],Z,Val):- miembroVal(X,R,Z,Val).


miembroListVal(H,[],Z,Val):- Z=0 .
miembroListVal(H,[C|_],Z,Val):- miembro(H,C,Z),(Z==1 ->!), Val=C.
miembroListVal(H,[_|R],Z,Val):- miembroListVal(H,R,Z,Val).


longitud([],0).
longitud([_|R],Len):- longitud(R,Len1), Len is Len1+1.


%validateInput():-.

validateComida([],X):- nl,writeln('La comida que quiere no está disponible'),nl,writeln('Vuelva a intentarlo'),nl, readln(Input),validateComida(Input,X).
validateComida([H|_],X):- getComidas(Ca),getComidas2(Cb),miembro(H,Ca,Za),miembroList(H,Cb,Zb),(Za==1 ->X = H,!;Zb==1 ->X = H,!).
validateComida([H|T],X):- validateComida(T,X).


validateBebida([],X):- nl,writeln('La bebida que quiere no está disponible'),nl,writeln('Vuelva a intentarlo'),nl, readln(Input),valid_sentence(Input,InputVal),validateBebida(InputVal,X).
validateBebida([H|_],X):-  getBebidas(Ca),getBebidas2(Cb),miembro(H,Ca,Za),miembroList(H,Cb,Zb),(Za==1 ->X = H,!;Zb==1 ->X = H,!).
validateBebida([H|T],X):- validateBebida(T,X).


validateLugar([],X):- nl,writeln('El lugar que quiere no está disponible'),nl,writeln('Vuelva a intentarlo'),nl, readln(Input),valid_sentence(Input,InputVal),validateLugar(InputVal,X).
validateLugar([H|_],X):- getLugares(C),miembro(H,C,Z),(Z==1 ->X = H,!).
validateLugar([H|T],X):- validateLugar(T,X).

validateCantidad([],X):- nl,writeln('No reconozco ese numero'),nl,writeln('Vuelva a intentarlo'),nl, readln(Input),validateCantidad(Input,X).
%valid_sentence(Input,InputVal)

validateCantidad([H|_],X):- (numberatom(H) -> X = H ,!).
validateCantidad([_|T],X):- validateCantidad(T,X).

numberatom(Atom) :-
   atom_chars(Atom, Chs),
    catch(number_chars(_, Chs), error(syntax_error(_),_), false).

checkSub(X,Y):- getComidas(Ca),miembroVal(X,Ca,Za,Val),(Za==1,Y = Val).
checkSub(X,Y):- getBebidas(Ca),miembroVal(X,Ca,Za,Val),(Za==1,Y = Val).
checkSub(X,Y):- getComidas2(Ca),miembroListVal(X,Ca,Za,Val),(Za==1,comida([Type,Val,_]) ), Y=Type.
checkSub(X,Y):- getBebidas2(Ca),miembroListVal(X,Ca,Za,Val),(Za==1,bebida([Type,Val,_]) ), Y=Type.






/*
 ___________________________________________________
|		   Sistema Experto		    |
|___________________________________________________|

*/

searchRestaurant(TipoComida,TipoBebida,Lugar,CapacidadTem):-(
    (   restaurante([Nombre,TipoComida,TipoBebida,Lugar,Ubicacion,Menu,Capacidad,Disposicion])->recomendarRest(Nombre,Lugar,Ubicacion,Menu,Disposicion));nl,write('-Lo siento, no encontramos un restaurante con sus preferencias'),nl,preguntarDenuevo()).

recomendarRest(Nombre,Lugar,Ubicacion,Menu,Indicaciones):- write('-¡Encontramos un restaurante ideal!'),nl,write('-Su nombre es: '), write(Nombre),nl,write('-Se ubica en: '),write(Ubicacion),write(' de '),write(Lugar),nl,write('-Un comentario del restaurante: '),write(Indicaciones),nl,preguntarDenuevo().

preguntarDenuevo(Response):- miembro('Si',Response,Z),(Z==1 -> startES).
preguntarDenuevo(Response):- miembro('Si',Response,Z),(Z==0 -> !).
preguntarDenuevo():-write('¿Desea volver a buscar?'),nl,write('Si / No'),nl,readln(Response),preguntarDenuevo(Response).

startES:-
    writeln('
┌───── •✧✧• ─────┐
 -RestauranTEC-
└───── •✧✧• ─────┘
'),
    writeln('-Hola, ¡Bienvenido a RestauranTEC!'),
    nl,
    writeln("-¿que tipo de comida se te antoja?"),
    nl,
    writeln("-Tenemos disponible: "),nl,
    getComidas(Comidas),
    getComidas2(Comidas2),
    %writeln(Comidas),
    printCategorie(Comidas,Comidas2),
    readln(Oracion1),
    valid_sentence(Oracion1,Oracionver),
    validateComida(Oracionver,TipoComida),
    %nl,write('comida ingresada: '),write(TipoComida),nl,


    writeln("-¿que tipo de bebida desea tomar?"),
    nl,
    writeln("-Tenemos disponible: "),nl,
    getBebidas(Bebidas),
    getBebidas2(Bebidas2),
    printCategorie(Bebidas,Bebidas2),
    readln(Oracion2),
    valid_sentence(Oracion2,Oracionver2),
    validateBebida(Oracionver2,TipoBebida),
    %nl,write('bebida ingresada: '),write(TipoBebida),nl,


    writeln("-¿En que zona está buscando el restaurante?"),
    nl,
    writeln("-Las zonas que cubrimos son: "),nl,
    getLugares(Lug),
    printCategorie(Lug),
    readln(Oracion3),
    valid_sentence(Oracion3,Oracionver3),
    validateLugar(Oracionver3,Lugar),

    writeln('-¿Cuantas personas van a asistir?'),nl,
    readln(Cantidad),
    validateCantidad(Cantidad,CantidadVer),
    %nl,write('cantidad ingresada: '),write(CantidadVer),nl,

    %nl,write('lugar ingresado: '),write(Lugar),nl,
    checkSub(TipoComida,TipoComidaVer),
    checkSub(TipoBebida,TipoBebidaVer),
    searchRestaurant(TipoComidaVer,TipoBebidaVer,Lugar,CantidadVer).

