:-consult('database').
:-consult('bnf').
:-style_check(-singleton).


/*
 ______________________________________________________________
|		     funciones atómicas                        |
|______________________________________________________________|
*/


%   Obtiene todos los valores en la posicion X de un hecho en la base de
%   datos y lo devuelve como una lista.
getComidas(C):- findall(X,(comida([X,_,_])),C).
getComidas2(C):-findall(X,(comida([_,X,_])),C).

getBebidas(B):- findall(X,(bebida([X,_,_])),B).
getBebidas2(B):-findall(X,(bebida([_,X,_])),B).

getLugares(L):- findall(X,(lugar([X,_,_])),L).
getLugares2(L):- findall(X,(lugar([_,X,_])),L).

%  Imprime en consola una lista de valores y una lista de subvalores si
%  se encuentra disponible.
printCategorie([L|N]):-  write("* "), write(L),nl,longitud(N,Len),( Len >= 1 ->printCategorie(N);!).
printCategorie([L|N],[Subcat|SubcatNext]):-  write("* "), write(L),nl,printSubCategorie(Subcat),longitud(N,Len),( Len >= 1 ->printCategorie(N,SubcatNext);!).
printSubCategorie([L|N]):-  write(" + "), write(L),nl,longitud(N,Len),( Len >= 1 ->printSubCategorie(N);!).


%  revisa si un valor es miembro de una lista de listas, solo devuelve
%  su veracidad.
miembroList(H,[],Z):- Z=0 .
miembroList(H,[C|_],Z):- miembro(H,C,Z),(Z==1 ->!).
miembroList(H,[_|R],Z):- miembroList(H,R,Z).


%  funcion miembro para revisar si pertenece a una lista, devuelve su
%  veracidad
miembro(X,[],Z):- Z = 0.
miembro(X,[Y|_],Z):- (X == Y -> Z = 1,!).
miembro(X,[_|R],Z):- miembro(X,R,Z).


%  Revisa si un valor es miembro de una lista de listas, devuelve su
%  veracidad y el valor  revisado.
miembroListVal(H,[],Z,Val):- Z=0 .
miembroListVal(H,[C|_],Z,Val):- miembro(H,C,Z),(Z==1 ->!), Val=C.
miembroListVal(H,[_|R],Z,Val):- miembroListVal(H,R,Z,Val).

%  funcion miembro para revisar si pertenece a una lista, devuelve su
%  veracidad y valor revisado.
miembroVal(X,[],Z,Val):- Z = 0.
miembroVal(X,[Y|_],Z,Val):- (X == Y -> Z = 1),Val = Y,!.
miembroVal(X,[_|R],Z,Val):- miembroVal(X,R,Z,Val).

%devuelve la longitud de una lista.
longitud([],0).
longitud([_|R],Len):- longitud(R,Len1), Len is Len1+1.

%validateInput():-.
%

% valida si la entrada del usuario es una comida disponible en la base
% de datos, devuelve su valor revisado
validateComida([],X):- nl,writeln('La comida que quiere no está disponible'),nl,writeln('Vuelva a intentarlo'),nl, readln(Input),validateComida(Input,X).
validateComida([H|_],X):- getComidas(Ca),getComidas2(Cb),miembro(H,Ca,Za),miembroList(H,Cb,Zb),(Za==1 ->X = H,!;Zb==1 ->X = H,!).
validateComida([H|T],X):- validateComida(T,X).


% valida si la entrada del usuario es una bebida disponible en la base
% de datos, devuelve su valor revisado
validateBebida([],X):- nl,writeln('La bebida que quiere no está disponible'),nl,writeln('Vuelva a intentarlo'),nl, readln(Input),valid_sentence(Input,InputVal),validateBebida(InputVal,X).
validateBebida([H|_],X):-  getBebidas(Ca),getBebidas2(Cb),miembro(H,Ca,Za),miembroList(H,Cb,Zb),(Za==1 ->X = H,!;Zb==1 ->X = H,!).
validateBebida([H|T],X):- validateBebida(T,X).


% valida si la entrada del usuario es un lugar disponible en la base
% de datos, devuelve su valor revisado
validateLugar([],X):- nl,writeln('El lugar que quiere no está disponible'),nl,writeln('Vuelva a intentarlo'),nl, readln(Input),valid_sentence(Input,InputVal),validateLugar(InputVal,X).
validateLugar([H|_],X):- getLugares(Ca),getLugares2(Cb),miembro(H,Ca,Za),miembro(H,Cb,Zb),(Za==1 ->X = H,! ; Zb==1 ->X = H,!).
validateLugar([H|T],X):- validateLugar(T,X).

% Revisa si la entrada del usuario contiene un numero.
validateCantidad([],X):- nl,writeln('No reconozco ese numero'),nl,writeln('Vuelva a intentarlo'),nl, readln(Input),validateCantidad(Input,X).

validateCantidad([H|_],X):- (numberatom(H) -> X = H ,!).
validateCantidad([_|T],X):- validateCantidad(T,X).

numberatom(Atom) :-
   atom_chars(Atom, Chs),
    catch(number_chars(_, Chs), error(syntax_error(_),_), false).

% Revisa si un valor pertenece a la categoria principal o subcategoria
checkSub(X,Y):- getComidas(Ca),miembroVal(X,Ca,Za,Val),(Za==1,Y = Val).
checkSub(X,Y):- getBebidas(Ca),miembroVal(X,Ca,Za,Val),(Za==1,Y = Val).
checkSub(X,Y):- getLugares(Ca),miembroVal(X,Ca,Za,Val),(Za==1,Y = Val).
checkSub(X,Y):- getComidas2(Ca),miembroListVal(X,Ca,Za,Val),(Za==1,comida([Type,Val,_]) ), Y=Type.
checkSub(X,Y):- getBebidas2(Ca),miembroListVal(X,Ca,Za,Val),(Za==1,bebida([Type,Val,_]) ), Y=Type.
checkSub(X,Y):- getLugares2(Ca),miembroListVal(X,Ca,Za,Val),(Za==1,bebida([Type,Val,_]) ), Y=Type.

% Revisa si la cantidad de personas que van es menor que la capacidad
% del restaurante.
capacidadVal(CapInp,CapRest):- atom_number(CapRest,R),(CapInp<R -> true; false).




/*
 ___________________________________________________
|		   Sistema Experto		    |
|___________________________________________________|

*/

% Revisa si en la base de datos un restaurante cumple con los valores de
% que pide el usuario, si encuentra un restaurante lo recomienda, sino
% le avisa al usuario que no hubo coincidencia.
searchRestaurant(TipoComida,TipoBebida,Lugar,CapacidadTem):-(
    (   restaurante([Nombre,TipoComida,TipoBebida,Lugar,Ubicacion,Menu,Capacidad,Disposicion]),capacidadVal(CapacidadTem,Capacidad)->recomendarRest(Nombre,Lugar,Ubicacion,Menu,Disposicion); nl,write('-Lo siento, no encontramos un restaurante con sus preferencias'),nl,preguntarDenuevo())).

recomendarRest(Nombre,Lugar,Ubicacion,Menu,Indicaciones):- nl, write('-¡Encontramos un restaurante ideal!'),nl,write('-Su nombre es: '), write(Nombre),nl,write('-Se ubica en: '),write(Ubicacion),write(' de '),write(Lugar),nl,write('-Un comentario del restaurante: '),write(Indicaciones),nl,nl,preguntarDenuevo().


% Pregunta al usuario si quiere volver a correr el programa.
preguntarDenuevo(Response):- miembro('Si',Response,Z),(Z==1 -> startES).
preguntarDenuevo(Response):- miembro('Si',Response,Z),(Z==0 -> !).
preguntarDenuevo():-write('¿Desea volver a buscar?'),nl,write('Si / No'),nl,readln(Response),preguntarDenuevo(Response).

%                      Inicia el sistema experto
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
    %isPregunta(Oracion1,Val1),(Val1 == 1-> write('Respuesta')),
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
    checkSub(Lugar,LugarVer),
    write('searching...'),nl,
    searchRestaurant(TipoComidaVer,TipoBebidaVer,LugarVer,CantidadVer).

