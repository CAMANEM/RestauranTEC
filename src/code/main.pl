:-consult('bnf').

:- initialization(restauranTEC).

restauranTEC:-
    writeln('**************************************************'),
    writeln('***************    RestauranTEC    ***************'),
    writeln('**************************************************'),
    writeln("Welcome to RestauranTEC, we'll make sure to find the perfect place for you!"),
    writeln("Now, why don't you tell me if there's anything you'd like to have in particular"),
    readln(Ans), sentence(Ans,[]).
