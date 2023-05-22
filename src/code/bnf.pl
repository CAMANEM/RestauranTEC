/* -------------------------------------------------------------------------------------------------------------
    Here is build the BNF (Backus-Naur Form) used for the expert system
    The current BNF is build based in the book "El Lenguaje de Programación PROLOG", de M. Teresa. Escrig.
   -----------------------------------------------------------------------------------------------------------*/


% <><><><><><><><><> subjects <><><><><><><><><><>

nameS(sing, masc, [hombre|S],S).
nameS(plu, masc, [hombres|S],S).
nameS(sing, fem, [manzana|S],S).
nameS(plu, fem, [manzanas|S],S).



% <><><><><><><><><> Verbs <><><><><><><><><><><>

verb(sing, thrd, [come|S],S).
verb(sing, frst, [comere|S],S).
verb(plu, frst, [comeremos|S],S).
verb(plu, thrd, [comeran|S],S).

verb(sing, frst, [pido|S],S).
verb(plu, frst, [pedimos|S],S).
verb(plu, frst, [pediremos|S],S).
verb(plu, thrd, [pidieron|S],S).
verb(plu, thrd, [piden|S],S).

verb(sing, frst, [quiero|S],S).
verb(plu, frst, [queremos|S],S).
verb(plu, frst, [queriamos|S],S).
verb(plu, thrd, [quieren|S],S).
verb(plu, thrd, [quisieran|S],S).



% <><><><><><><><> determiners <><><><><><><><><>

% Determined Articles
determinant(sing, masc, thrd, [el|S], S).
determinant(sing, fem, thrd, [la|S], S).
determinant(plu, masc, thrd, [los|S], S).
determinant(plu, fem, thrd, [las|S], S).

% Indetermined Articles
determinant(sing, masc, thrd, [un|S], S).
determinant(sing, fem, thrd, [una|S], S).
determinant(plu, masc, thrd, [unos|S], S).
determinant(plu, fem, thrd, [unas|S], S).



% <><><><><><><><> verb phrase <><><><><><><><><>

/*
    Validates or generates a valid verb phrase
    @param   Num:  number form (singular or plural)
    @param     _:  the genre (masculin of feminine)
    @param  Prsn:  person form (first, third)
    @param    S0:  list of words ([come, unas, manzanas])
    @param     S:  list of words remaining after the verb phrase ([])
*/
verb_phrase(Num, _, Prsn, S0, S) :-
    verb(Num, Prsn, S0, S1),
    noun_phrase(_, _, _, S1, S).

/*
    Validates or generates a valid verb phrase
    @param   Num:  number form (singular or plural)
    @param     _:  the genre (masculin of feminine)
    @param  Prsn:  person form (first, third)
    @param    S0:  list of words ([come, unas, manzanas])
    @param     S:  list of words remaining after the verb phrase ([unas, manzanas])
*/
verb_phrase(Num, _, Prsn, S0, S):- verb(Num, Prsn, S0, S).



% <><><><><><><><> noun phrase <><><><><><><><><>

/*
    Validates or generates a valid noun phrase
    @param   Num:  number form (singular or plural)
    @param   Gen:  the genre (masculin of feminine)
    @param  Prsn:  person form (first or third)
    @param    S0:  list of words ([el hombre, come, unas, manzanas])
    @param     S:  list of words remaining after the noun phrase ([come, unas, manzanas])
*/
noun_phrase(Num, Gen, Prsn, S0, S) :-
    determinant(Num, Gen, Prsn, S0, S1),
    nameS(Num, Gen, S1, S).



% <><><><><><><><> Sentence <><><><><><><><><><><>

/*
    Validates or generates a valid sentence
    @param  S0:  list of words forming the sentence ([el hombre, come, unas, manzanas])
    @param   S:  lista vacia
    @e.g.
    sentence(S,[]). --> shows valid sentences
    sentence([el,hombre,come,la,manzana],[]).  --> validate sentence
*/
sentence(S0,S):-
    noun_phrase(Num, Gen, Prsn, S0, S1),
    verb_phrase(Num, Gen, Prsn, S1, S).