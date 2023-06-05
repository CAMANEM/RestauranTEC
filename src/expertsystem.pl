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
get_comidas(C):- findall(X,(comida([X,_,_])),C).
get_comidas2(C):-findall(X,(comida([_,X,_])),C).

get_bebidas(B):- findall(X,(bebida([X,_,_])),B).
get_bebidas2(B):-findall(X,(bebida([_,X,_])),B).

get_lugares(L):- findall(X,(lugar([X,_,_])),L).
get_lugares2(L):- findall(X,(lugar([_,X,_])),L).

%  Imprime en consola una lista de valores y una lista de subvalores si
%  se encuentra disponible.


print_categorie([L|N]):-  write("* "), write(L),nl,longitud(N,Len),( Len >= 1 ->print_categorie(N);!).

print_subcategorie([L|N]):-  write(" + "), write(L),nl,longitud(N,Len),( Len >= 1 ->print_subcategorie(N);!).


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
miembroListVal(H,[C|_],Z,Val):- miembro(H,C,Z),(Z==1 ->Val=C,!) .
miembroListVal(H,[_|R],Z,Val):- miembroListVal(H,R,Z,Val).

%  funcion miembro para revisar si pertenece a una lista, devuelve su
%  veracidad y valor revisado.
miembroVal(X,[],Z,Val):- Z = 0.
miembroVal(X,[Y|_],Z,Val):- (X == Y -> Z = 1,Val = Y,!).
miembroVal(X,[_|R],Z,Val):- miembroVal(X,R,Z,Val).

%devuelve la longitud de una lista.
longitud([],0).
longitud([_|R],Len):- longitud(R,Len1), Len is Len1+1.


isPregunta([],Z):- Z= 0 .
isPregunta([H|_],Z):- (H == '?' -> Z=1) .
isPregunta([_|N],Z):- isPregunta(N,Z) .


is_comida(H,X,Z):- get_comidas(Ca),get_comidas2(Cb),miembro(H,Ca,Za),miembroList(H,Cb,Zb),(Za==1 ->X = H,Z=1;Zb==1 ->X = H,Z=1).
is_comida([H|_],X,Z):- get_comidas(Ca),get_comidas2(Cb),miembro(H,Ca,Za),miembroList(H,Cb,Zb),(Za==1 ->X = H,Z=1;Zb==1 ->X = H,Z=1).
is_comida([_|N],X,Z):-is_comida(N,X,Z).

is_comida([],Z):- Z=0.
is_comida([H|_],Z):- get_comidas(Ca),get_comidas2(Cb),miembro(H,Ca,Za),miembroList(H,Cb,Zb),(Za==1 ->Z=1,!;Zb==1 ->Z=1,!).
is_comida([_|N],Z):-is_comida(N,Z).


isBebida(H,X,Z):- get_bebidas(Ca),get_bebidas2(Cb),miembro(H,Ca,Za),miembroList(H,Cb,Zb),(Za==1 ->X = H,Z=1;Zb==1 ->X = H,Z=1).
isBebida([H|_],X,Z):- get_bebidas(Ca),get_bebidas2(Cb),miembro(H,Ca,Za),miembroList(H,Cb,Zb),(Za==1 ->X = H,Z=1;Zb==1 ->X = H,Z=1).
isBebida([_|N],X,Z):-isBebida(N,X,Z).

isBebida([],Z):- Z = 0.
isBebida([H|_],Z):-get_bebidas(Ca),get_bebidas2(Cb),miembro(H,Ca,Za),miembroList(H,Cb,Zb),(Za ==1 ->Z=1;Zb ==1 ->Z=1).
isBebida([_|N],Z):-isBebida(N,Z).


is_lugar(H,X,Z):- get_lugares(Ca),get_lugares2(Cb),miembro(H,Ca,Za),miembro(H,Cb,Zb),(Za==1 ->X = H,Z=1 ; Zb==1 ->X = H,Z=1).
is_lugar([],Z):- Z=0.
is_lugar([H|_],Z):-get_lugares(Ca),get_lugares2(Cb),miembro(H,Ca,Za),miembroList(H,Cb,Zb),(Za==1 ->Z=1,!;Zb==1 ->Z=1,!).
is_lugar([_|N],Z):- is_lugar(N,Z).


isCantidad([],Z):- Z=0.
isCantidad([H|_],Z):- (numberatom(H) -> Z = 1 ,!).
isCantidad([_|N],Z):- isCantidad(N,Z).


isAyuda([],Z):- Z=0.
isAyuda([H|_],Z):- (H=='ayuda' -> Z=1,!;H=='Ayuda' -> z=1,!).
isAyuda([_|N],Z):- isAyuda(N,Z).


is_end([],Z):- Z=0.
is_end([H|_],Z):-(H=='adios' -> Z=1,!;H=='Ayuda' -> z=1,!).
is_end([_|N],Z):- is_end(N,Z).

%
%
%
validateInput(Oracion,X):- is_end(Oracion,Val),(Val ==1 ->halt()).
validateInput(Oracion,X):- isAyuda(Oracion,Val),(Val ==1 -> printAyuda(),nl,readln(Input),validateInput(Input,X)).
validateInput(Oracion,X):- isPregunta(Oracion,Val),(Val ==1 ->validate_question(Oracion),nl,readln(Input),validateInput(Input,X)).
validateInput(Oracion,X):- is_comida(Oracion,Val),(Val ==1 -> validateComida(Oracion,Comida),X=Comida).
validateInput(Oracion,X):- isBebida(Oracion,Val),(Val ==1 -> validateBebida(Oracion,Bebida),X=Bebida).
validateInput(Oracion,X):- is_lugar(Oracion,Val),(Val ==1 -> validate_lugar(Oracion,Lugar),X=Lugar).
validateInput(Oracion,X):- isCantidad(Oracion,Val),(Val ==1 -> validate_amount(Oracion,Lugar),X=Lugar).


% valida si la entrada del usuario es una comida disponible en la base
% de datos, devuelve su valor revisado
validateComida([],X):- nl,writeln('La comida que quiere no está disponible'),nl,writeln('Vuelva a intentarlo'),nl, readln(Input),validateComida(Input,X).
validateComida([H|_],X):- is_comida(H,Val,Z),(Z==1 -> X=Val ,!).
validateComida([H|T],X):- validateComida(T,X).


% valida si la entrada del usuario es una bebida disponible en la base
% de datos, devuelve su valor revisado
validateBebida([],X):- nl,writeln('La bebida que quiere no está disponible'),nl,writeln('Vuelva a intentarlo'),nl, readln(Input),valid_sentence(Input,InputVal),validateBebida(InputVal,X).
validateBebida([H|_],X):-  isBebida(H,Val,Z),(Z==1 -> X=Val ,!).
validateBebida([H|T],X):- validateBebida(T,X).


% valida si la entrada del usuario es un lugar disponible en la base
% de datos, devuelve su valor revisado
validate_lugar([],X):- nl,writeln('El lugar que quiere no está disponible'),nl,writeln('Vuelva a intentarlo'),nl, readln(Input),valid_sentence(Input,InputVal),validate_lugar(InputVal,X).
validate_lugar([H|_],X):- is_lugar(H,Val,Z),(Z==1 -> X=Val,!).
validate_lugar([_|T],X):- validate_lugar(T,X).

% Revisa si la entrada del usuario contiene un numero.
validate_amount([],X):- nl,writeln('Ingrese un numero valido'),nl,writeln('Vuelva a intentarlo'),nl, readln(Input),validate_amount(Input,X).

validate_amount([H|_],X):- (numberatom(H) -> X = H ,!).
validate_amount([_|T],X):- validate_amount(T,X).


validate_question([]):- nl,write('No entendí tu pregunta'),nl,writeln('Vuelva a intentarlo'),nl.
validate_question([H|N]):-read_question(H,P),is_comida(N,Val,Z),(P == 1,Z==1 -> nl,write('Menu de comida: '),write(Val),nl,comida([Val,Menu,_]),print_subcategorie(Menu)),!.
validate_question([H|N]):-read_question(H,P),is_comida(N,Z),(P==1,Z==0 -> nl,write('-Tenemos disponible: '),nl,get_comidas(Cat),print_categorie(Cat)),!.
validate_question([H|N]):-read_question(H,P),isBebida(N,Val,Z),( P == 2,Z==1 -> nl,write('Menu de bebida: '),write(Val),nl,bebida([Val,Menu,_]),print_subcategorie(Menu)),!.
validate_question([H|_]):-isBebida(H,Val,Z),( Z==1 -> nl,write('Menu de bebida: '),write(Val),nl,bebida([Val,Menu,_]),print_subcategorie(Menu)),!.
validate_question([H|N]):-read_question(H,P),isBebida(N,Z),(P == 2,Z==0 -> nl,write('Tenemos disponible: '),nl,get_bebidas(Cat),print_categorie(Cat)),!.
validate_question([_|N]):-validate_question(N).

read_question(H,Z):-  z = 0.
read_question(H,Z):- (H=='comida' -> Z=1,! ;H=='comidas' -> Z=1,!).
read_question(H,Z):- (H=='bebida' -> Z=2,! ;H=='bebidas' -> Z=2,!).


numberatom(Atom) :-
   atom_chars(Atom, Chs),
    catch(number_chars(_, Chs), error(syntax_error(_),_), false).

% Revisa si un valor pertenece a la categoria principal o subcategoria
checkSub(X,Y):- get_comidas(Ca),miembroVal(X,Ca,Za,Val),(Za==1,Y = Val).
checkSub(X,Y):- get_bebidas(Ca),miembroVal(X,Ca,Za,Val),(Za==1,Y = Val).
checkSub(X,Y):- get_lugares(Ca),miembroVal(X,Ca,Za,Val),(Za==1,Y = Val).
checkSub(X,Y):- get_comidas2(Ca),miembroListVal(X,Ca,Za,Val),(Za==1,comida([Type,Val,_]) ), Y=Type.
checkSub(X,Y):- get_bebidas2(Ca),miembroListVal(X,Ca,Za,Val),(Za==1,bebida([Type,Val,_]) ), Y=Type.
checkSub(X,Y):- get_lugares2(Ca),miembroListVal(X,Ca,Za,Val),(Za==1,bebida([Type,Val,_]) ), Y=Type.



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


printAyuda():-nl,write('-¡Este es el menu de ayuda!'),nl,write('Puede hacerle preguntas a RestauranTEC como: '),nl,write('-"que (comidas/bebidas) tienen?"'),nl,write('-"que tipo de (comida/bebida) (especifico[a]) tienen?"').



%                      Inicia el sistema experto
startES:-
   tab(3), writeln('
┌───── •✧✧• ─────┐
 -RestauranTEC-
└───── •✧✧• ─────┘
'),
    writeln('-Hola, ¡Bienvenido a RestauranTEC!'),
    nl,writeln('-Para pedir informacion puede escribir "ayuda" '),nl,
    writeln("-¿que tipo de comida se te antoja?"),nl,
    readln(Oracion1),
    valid_sentence(Oracion1,Oracionver),
    validateInput(Oracionver,TipoComida),
    %nl,write('comida ingresada: '),write(TipoComida),nl,


    writeln("-¿que tipo de bebida desea tomar?"),
    nl,
    readln(Oracion2),
    valid_sentence(Oracion2,Oracionver2),
    validateInput(Oracionver2,TipoBebida),
    %nl,write('bebida ingresada: '),write(TipoBebida),nl,


    writeln("-¿En que zona está buscando el restaurante?"),
    nl,
    writeln("-Las zonas que cubrimos son: "),nl,
    get_lugares(Lug),
    print_categorie(Lug),
    readln(Oracion3),
    valid_sentence(Oracion3,Oracionver3),
    validateInput(Oracionver3,Lugar),
    %nl,write('lugar ingresado: '),write(Lugar),nl,


    writeln('-¿Cuantas personas van a asistir?'),nl,
    readln(Cantidad),
    valid_sentence(Cantidad,Cantidadver),
    validateInput(Cantidadver,CantidadVal),
    %nl,write('cantidad ingresada: '),write(CantidadVer),nl,


    checkSub(TipoComida,TipoComidaVer),
    checkSub(TipoBebida,TipoBebidaVer),
    checkSub(Lugar,LugarVer),
    write('-Buscando...'),nl,
    searchRestaurant(TipoComidaVer,TipoBebidaVer,LugarVer,CantidadVal).

