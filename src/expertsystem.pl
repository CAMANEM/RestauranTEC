:-consult('database').
:-consult('bnf').
:-style_check(-singleton).


/*
 ______________________________________________________________
|		     funciones atomicas                        |
|______________________________________________________________|
*/




/*
    Takes all the specific values of a statement and returns them on a list.
    The second function does the same but with other specific values.
    @param      C:  list with all the specific values of a statement.
*/
get_comidas(C):- findall(X,(comida([X,_,_])),C).
get_comidas2(C):-findall(X,(comida([_,X,_])),C).

get_bebidas(B):- findall(X,(bebida([X,_,_])),B).
get_bebidas2(B):-findall(X,(bebida([_,X,_])),B).

get_lugares(L):- findall(X,(lugar([X,_,_])),L).
get_lugares2(L):- findall(X,(lugar([_,X,_])),L).




/*
    Prints a list on the terminal with a small format, * for principal categories.
    @param          List:   List with all the values to be printed.
*/
print_categorie([L|N]):-  write('*'), write(L),nl,longitud(N,Len),( Len >= 1 ->print_categorie(N);!).

/*
    Prints a list on the terminal with a small format, + for sub categories.
    @param          List:   List with all the values to be printed.
*/
print_subcategorie([L|N]):-  write(' + '), write(L),nl,longitud(N,Len),( Len >= 1 ->print_subcategorie(N);!).





/*
    This function checks if an input is a member of a given list and returns a boolean.
    @param        X:  input as an atom sent by the user.
    @param        List:  List of lists to check if the input is member.
    @param        Z:  Boolean, true if the input is part of the list, false if not.

*/
member_list(H,[],Z):- Z=0 .
member_list(H,[C|_],Z):- member(H,C,Z),(Z==1 ->!).
member_list(H,[_|R],Z):- member_list(H,R,Z).
/*
    This function checks if an input is a member of a given list and returns a boolean.
    @param        X:  input as an atom sent by the user.
    @param        List:  List to check if the input is a member.
    @param        Z:  Boolean, true if the input is part of the list, false if not.

*/
member(X,[],Z):- Z = 0.
member(X,[Y|_],Z):- (X == Y -> Z = 1,!).
member(X,[_|R],Z):- member(X,R,Z).


/*
    This function checks if an input is a member of a given list and returns a boolean.
    @param        X:  input as an atom sent by the user.
    @param        List:  List of lists to check if the input is a member.
    @param        Z:  Boolean, true if the input is part of the list, false if not.
    @param        Val:  Checked value if the input was a member of the list.

*/
member_listVal(H,[],Z,Val):- Z=0 .
member_listVal(H,[C|_],Z,Val):- member(H,C,Z),(Z==1 ->Val=C,!) .
member_listVal(H,[_|R],Z,Val):- member_listVal(H,R,Z,Val).

/*
    This function checks if an input is a member of a given list and returns a boolean and the checked value.
    @param        X:  input as an atom sent by the user.
    @param        List:  List to check if the input is a member.
    @param        Z:  Boolean, true if the input is part of the list, false if not.
    @param        Val:  Checked value if the input was a member of the list.

*/
member_val(X,[],Z,Val):- Z = 0.
member_val(X,[Y|_],Z,Val):- (X == Y -> Z = 1,Val = Y,!).
member_val(X,[_|R],Z,Val):- member_val(X,R,Z,Val).



/*
    Returns the length of a list or sentence.
    @param      List:   list or sentece to count.
    @param      Len:    Length of the list.
*/
longitud([],0).
longitud([_|R],Len):- longitud(R,Len1), Len is Len1+1.




/*
    All the is_X functions receive a sentence sent by the user and checks if that sentence contains a food, drink, place, a question or a help text
    it can return the check value if needed or just return the boolean.
    @param        List:  sentence sent by the user as input.
    @param        X:  value checked by the function.
    @param        Z:  boolean if the sentence contains a value or not.
   
*/
is_question([],Z):- Z= 0 .
is_question([H|_],Z):- (H == '?' -> Z=1) .
is_question([_|N],Z):- is_question(N,Z) .

is_comida(H,X,Z):- get_comidas(Ca),get_comidas2(Cb),member(H,Ca,Za),member_list(H,Cb,Zb),(Za==1 ->X = H,Z=1;Zb==1 ->X = H,Z=1).
is_comida([H|_],X,Z):- get_comidas(Ca),get_comidas2(Cb),member(H,Ca,Za),member_list(H,Cb,Zb),(Za==1 ->X = H,Z=1;Zb==1 ->X = H,Z=1).
is_comida([_|N],X,Z):-is_comida(N,X,Z).

is_comida([],Z):- Z=0.
is_comida([H|_],Z):- get_comidas(Ca),get_comidas2(Cb),member(H,Ca,Za),member_list(H,Cb,Zb),(Za==1 ->Z=1,!;Zb==1 ->Z=1,!).
is_comida([_|N],Z):-is_comida(N,Z).

is_bebida(H,X,Z):- get_bebidas(Ca),get_bebidas2(Cb),member(H,Ca,Za),member_list(H,Cb,Zb),(Za==1 ->X = H,Z=1;Zb==1 ->X = H,Z=1).
is_bebida([H|_],X,Z):- get_bebidas(Ca),get_bebidas2(Cb),member(H,Ca,Za),member_list(H,Cb,Zb),(Za==1 ->X = H,Z=1;Zb==1 ->X = H,Z=1).
is_bebida([_|N],X,Z):-is_bebida(N,X,Z).

is_bebida([],Z):- Z = 0.
is_bebida([H|_],Z):-get_bebidas(Ca),get_bebidas2(Cb),member(H,Ca,Za),member_list(H,Cb,Zb),(Za ==1 ->Z=1;Zb ==1 ->Z=1).
is_bebida([_|N],Z):-is_bebida(N,Z).

is_place(H,X,Z):- get_lugares(Ca),get_lugares2(Cb),member(H,Ca,Za),member(H,Cb,Zb),(Za==1 ->X = H,Z=1 ; Zb==1 ->X = H,Z=1).
is_place([],Z):- Z=0.
is_place([H|_],Z):-get_lugares(Ca),get_lugares2(Cb),member(H,Ca,Za),member_list(H,Cb,Zb),(Za==1 ->Z=1,!;Zb==1 ->Z=1,!).
is_place([_|N],Z):- is_place(N,Z).

is_amount([],Z):- Z=0.
is_amount([H|_],Z):- (numberatom(H) -> Z = 1 ,!).
is_amount([_|N],Z):- is_amount(N,Z).

is_ayuda([],Z):- Z=0.
is_ayuda([H|_],Z):- (H=='ayuda' -> Z=1,!;H=='Ayuda' -> z=1,!).
is_ayuda([_|N],Z):- is_ayuda(N,Z).





/*
    Receives a sentence and sends that to the correct validation, it returns the correct validated value.
    @param        Oracion:  sentence sent by the user as a list.
    @param        X:  checked core value of the sentence.

*/
validate_input(Oracion,X):- is_end(Oracion,Val),(Val ==1 ->halt()).
validate_input(Oracion,X):- is_ayuda(Oracion,Val),(Val ==1 -> printAyuda(),nl,readln(Input),valid_sentence(Input,Inputver),validate_input(Inputver,X)).
validate_input(Oracion,X):- is_question(Oracion,Val),(Val ==1 ->validate_question(Oracion),nl,readln(Input),valid_sentence(Input,Inputver),validate_input(Inputver,X)).
validate_input(Oracion,X):- is_comida(Oracion,Val),(Val ==1 -> validate_comida(Oracion,Comida),X=Comida).
validate_input(Oracion,X):- is_bebida(Oracion,Val),(Val ==1 -> validate_bebida(Oracion,Bebida),X=Bebida).
validate_input(Oracion,X):- is_place(Oracion,Val),(Val ==1 -> validate_lugar(Oracion,Lugar),X=Lugar).
validate_input(Oracion,X):- is_amount(Oracion,Val),(Val ==1 -> validate_amount(Oracion,Lugar),X=Lugar).





/*
    all the validate_X receives the input sentence and checks if the value is in the database.
    @param        List:  input sentece sent by the user as a list.
    @param        X:  checked value from the database.

*/
validate_comida([],X):- nl,writeln('La comida que quiere no esta disponible'),nl,writeln('Vuelva a intentarlo'),nl, readln(Input),validate_comida(Input,X).
validate_comida([H|_],X):- is_comida(H,Val,Z),(Z==1 -> X=Val ,!).
validate_comida([H|T],X):- validate_comida(T,X).

validate_bebida([],X):- nl,writeln('La bebida que quiere no esta disponible'),nl,writeln('Vuelva a intentarlo'),nl, readln(Input),valid_sentence(Input,InputVal),validate_bebida(InputVal,X).
validate_bebida([H|_],X):-  is_bebida(H,Val,Z),(Z==1 -> X=Val ,!).
validate_bebida([H|T],X):- validate_bebida(T,X).

validate_lugar([],X):- nl,writeln('El lugar que quiere no esta disponible'),nl,writeln('Vuelva a intentarlo'),nl, readln(Input),valid_sentence(Input,InputVal),validate_lugar(InputVal,X).
validate_lugar([H|_],X):- is_place(H,Val,Z),(Z==1 -> X=Val,!).
validate_lugar([_|T],X):- validate_lugar(T,X).

validate_amount([],X):- nl,writeln('Ingrese un numero valido'),nl,writeln('Vuelva a intentarlo'),nl, readln(Input),validate_amount(Input,X).
validate_amount([H|_],X):- (numberatom(H) -> X = H ,!).
validate_amount([_|T],X):- validate_amount(T,X).



/*
    Receives a question as a sentence and prints the answer on the terminal.
    @param        List:  question sent by the user as a list.

*/
validate_question([]):- nl,write('No entendi su pregunta'),nl,writeln('Vuelva a intentarlo'),nl.
validate_question([H|N]):-read_question(H,P),is_comida(N,Val,Z),(P == 1,Z==1 -> nl,write('Menu de comida: '),write(Val),nl,comida([Val,Menu,_]),print_subcategorie(Menu)),!.
validate_question([H|N]):-read_question(H,P),is_comida(N,Z),(P==1,Z==0 -> nl,write('-Tenemos disponible: '),nl,get_comidas(Cat),print_categorie(Cat)),!.
validate_question([H|N]):-read_question(H,P),is_bebida(N,Val,Z),( P == 2,Z==1 -> nl,write('Menu de bebida: '),write(Val),nl,bebida([Val,Menu,_]),print_subcategorie(Menu)),!.
validate_question([H|_]):-is_bebida(H,Val,Z),( Z==1 -> nl,write('Menu de bebida: '),write(Val),nl,bebida([Val,Menu,_]),print_subcategorie(Menu)),!.
validate_question([H|N]):-read_question(H,P),is_bebida(N,Z),(P == 2,Z==0 -> nl,write('Tenemos disponible: '),nl,get_bebidas(Cat),print_categorie(Cat)),!.
validate_question([_|N]):-validate_question(N).

/*
    Receives an atom and checks if its an identification word for a question, returns an int to indicate wich question is being asked.
    @param        H:  atom with the question value.
    @param        Z:  int that indicates the question type.

*/
read_question(H,Z):-  z = 0.
read_question(H,Z):- (H=='comida' -> Z=1,! ;H=='comidas' -> Z=1,!).
read_question(H,Z):- (H=='bebida' -> Z=2,! ;H=='bebidas' -> Z=2,!).

/*
    Receives an atom and checks if the atom is a number.
    @param        Atom:  atom input sent by the user.
*/
numberatom(Atom) :-
   atom_chars(Atom, Chs),
    catch(number_chars(_, Chs), error(syntax_error(_),_), false).



/*
    Checks if user input is part of a sublist in the database, returns the principal categorie of the input.
    @param        X:  type of food, drink or place set by the user.
    @param        Y:  principal categorie of the input.

*/
check_sub(X,Y):- get_comidas(Ca),member_val(X,Ca,Za,Val),(Za==1,Y = Val).
check_sub(X,Y):- get_bebidas(Ca),member_val(X,Ca,Za,Val),(Za==1,Y = Val).
check_sub(X,Y):- get_lugares(Ca),member_val(X,Ca,Za,Val),(Za==1,Y = Val).
check_sub(X,Y):- get_comidas2(Ca),member_listVal(X,Ca,Za,Val),(Za==1,comida([Type,Val,_]) ), Y=Type.
check_sub(X,Y):- get_bebidas2(Ca),member_listVal(X,Ca,Za,Val),(Za==1,bebida([Type,Val,_]) ), Y=Type.
check_sub(X,Y):- get_lugares2(Ca),member_listVal(X,Ca,Za,Val),(Za==1,lugar([Type,Val,_]) ), Y=Type.



/*
    receives 2 numbers and checks if the amount of people is less than the restaurant capacity.
    @param        CapInp:  amount of people going to the restaurant.
    @param        CapRest:  capacity of the restaurant.
   
*/
capacidad_Val(CapInp,CapRest):- atom_number(CapRest,R),(CapInp<R -> true; false).




/*
 ___________________________________________________
|		   Sistema Experto		    |
|___________________________________________________|

*/

/*
    Searchs the database for restaurants that match the parameters.
    @param        TipoComida:  type of food that the user wants
    @param        TipoBebida:  type of drink that the user wants
    @param        Lugar:  Area where the user searchs the restaurant
    @param        Capacidad:  amount of people going to the restaurant

*/
search_restaurant(TipoComida,TipoBebida,Lugar,Capacidad):-

    (   restaurante([Nombre,TipoComida,TipoBebidaRest,Lugar,Ubicacion,Menu,CapacidadRes,Disposicion]),
    member(TipoBebida,TipoBebidaRest,Za) ,write(Za),
    ( Za==1 ,capacidad_Val(Capacidad,CapacidadRes)->recomendar_rest(Nombre,Lugar,Ubicacion,Menu,Disposicion),!);nl,write('-Lo siento, no encontramos un restaurante con sus preferencias'),nl,ask_again()).




recomendar_rest(Nombre,Lugar,Ubicacion,Menu,Indicaciones):- nl, write('Encontramos un restaurante ideal!'),nl,write('-Su nombre es: '), write(Nombre),nl,write('-Se ubica en: '),write(Ubicacion),write(' de '),write(Lugar),nl,write('-Un comentario del restaurante: '),write(Indicaciones),nl,nl,ask_again().


/*
    Ask the user if they want to do another search, if yes then call the startES. again, else stops the program.

*/
ask_again(Response):- member('Si',Response,Z),(Z==1 -> startES).
ask_again(Response):- member('Si',Response,Z),(Z==0 -> !).
ask_again():-write('Desea volver a buscar?'),nl,write('Si / No'),nl,readln(Response),ask_again(Response).

/*
    Prints the help menu on the terminal to show extra information for the user.
*/
printAyuda():-nl,write('-Este es el menu de ayuda!'),nl,write('Puede hacerle preguntas a RestauranTEC como: '),nl,write('-"que (comidas/bebidas) tienen?"'),nl,write('-"que tipo de (comida/bebida) (especifico[a]) tienen?"').



/*
    Starts the Expert System to ask the user about wich food, drinks, place and the amount of people for the restaurant search
*/
startES:-
    writeln('
 _________________________________________
|                                         |
|             -RestauranTEC-              |
|_________________________________________|'),nl,

    writeln('-Hola, Bienvenido a RestauranTEC!'),
    nl,writeln('-Para pedir informacion puede escribir "ayuda" '),nl,
    writeln('-que tipo de comida se te antoja?'),nl,
    readln(Oracion1),
    valid_sentence(Oracion1,Oracionver),
    validate_input(Oracionver,TipoComida),
    %nl,write('comida ingresada: '),write(TipoComida),nl,


    writeln('-que tipo de bebida desea tomar?'),
    nl,
    readln(Oracion2),
    valid_sentence(Oracion2,Oracionver2),
    validate_input(Oracionver2,TipoBebida),
    %nl,write('bebida ingresada: '),write(TipoBebida),nl,


    writeln('-En que zona esta buscando el restaurante?'),
    nl,
    writeln('-Las zonas que cubrimos son: '),nl,
    get_lugares(Lug),
    print_categorie(Lug),
    readln(Oracion3),
    valid_sentence(Oracion3,Oracionver3),
    validate_input(Oracionver3,Lugar),
    %nl,write('lugar ingresado: '),write(Lugar),nl,


    writeln('-Cuantas personas van a asistir?'),nl,
    readln(Cantidad),
    valid_sentence(Cantidad,Cantidadver),
    validate_input(Cantidadver,CantidadVal),
    %nl,write('cantidad ingresada: '),write(CantidadVer),nl,


    check_sub(TipoComida,TipoComidaVer),
    check_sub(TipoBebida,TipoBebidaVer),
    check_sub(Lugar,LugarVer),
    write('-Buscando...'),nl,
    search_restaurant(TipoComidaVer,TipoBebidaVer,LugarVer,CantidadVal).






