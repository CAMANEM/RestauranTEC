/* -------------------------------------------------------------------------------------------------------------
    Here is build the BNF (Backus-Naur Form) used for the expert system
    The current BNF is build based in the book "El Lenguaje de Programación PROLOG", de M. Teresa. Escrig.
   -----------------------------------------------------------------------------------------------------------*/


% <><><><><><><><> adjectives <><><><><><><><><>

adjectives(sing, masc, [rico|S], S).
adjectives(sing, fem, [rica|S], S).
adjectives(plu, masc, [ricos|S], S).
adjectives(plu, fem, [ricas|S], S).

% <><><><><><><><> prepositions <><><><><><><><><>

preposition([a|S],S).
preposition([ante|S],S).
preposition([bajo|S],S).
preposition([cabe|S],S).
preposition([con|S],S).
preposition([contra|S],S).
preposition([de|S],S).
preposition([desde|S],S).
preposition([en|S],S).
preposition([entre|S],S).
preposition([hasta|S],S).
preposition([hacia|S],S).
preposition([para|S],S).
preposition([por|S],S).
preposition([segun|S],S).
preposition([sin|S],S).
preposition([so|S],S).
preposition([sobre|S],S).
preposition([tras|S],S).

% <><><><><><><><><> name/noun <><><><><><><><><><>

nameS(sing, masc, [hombre|S],S).
nameS(plu, masc, [hombres|S],S).
nameS(sing, fem, [manzana|S],S).
nameS(plu, fem, [manzanas|S],S).

nameS(sing, masc, [hijo|S],S).
nameS(sing, fem, [hija|S],S).
nameS(plu, masc, [hijos|S],S).
nameS(plu, fem, [hijas|S],S).

% <><><><><><><><><> Verbs <><><><><><><><><><><>

verb(sing, thrd, [come|S],S).
verb(sing, frst, [como|S],S).
verb(sing, frst, [comere|S],S).
verb(sing, thrd, [comera|S],S).
verb(plu, frst, [comeremos|S],S).
verb(plu, thrd, [comeran|S],S).

verb(sing, frst, [pido|S],S).
verb(sing, thrd, [pide|S],S).
verb(plu, frst, [pedimos|S],S).
verb(plu, frst, [pediremos|S],S).
verb(plu, thrd, [pidieron|S],S).
verb(plu, thrd, [piden|S],S).

verb(sing, frst, [quiero|S],S).
verb(plu, frst, [queremos|S],S).
verb(plu, frst, [queriamos|S],S).
verb(plu, frst, [quisieramos|S],S).
verb(sing, thrd, [quiere|S],S).
verb(plu, thrd, [quieren|S],S).
verb(plu, thrd, [quisieran|S],S).
verb(plu, thrd, [querian|S],S).



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


%% Determinative adjectives

% Demostrative adjectives
determinant(sing, masc, thrd, [aquel|S], S).
determinant(sing, fem, thrd, [aquella|S], S).
determinant(plu, masc, thrd, [aquellos|S], S).
determinant(plu, fem, thrd, [aquellas|S], S).

determinant(sing, masc, thrd, [ese|S], S).
determinant(sing, fem, thrd, [esa|S], S).
determinant(plu, masc, thrd, [esos|S], S).
determinant(plu, fem, thrd, [esas|S], S).

determinant(sing, masc, thrd, [este|S], S).
determinant(sing, fem, thrd, [esta|S], S).
determinant(plu, masc, thrd, [estos|S], S).
determinant(plu, fem, thrd, [estas|S], S).

% posesive adjectives

determinant(sing, _, thrd, [mi|S], S).
determinant(plu, _, thrd, [mis|S], S).

determinant(sing, masc, thrd, [nuestro|S], S).
determinant(sing, fem, thrd, [nuestra|S], S).
determinant(plu, masc, thrd, [nuestros|S], S).
determinant(plu, fem, thrd, [nuestras|S], S).

% <><><><><><><><> pronouns <><><><><><><><><>

pronoun(sing, thrd, [oscar|S], S).
pronoun(sing, thrd, [sebastian|S], S).
pronoun(sing, thrd, [valerie|S], S).
pronoun(sing, thrd, [el| S], S).
pronoun(sing, thrd, [ella| S], S).
pronoun(plu, thrd, [ellos|S], S).
pronoun(plu, thrd, [ellas|S], S).
pronoun(plu, frst, [nosotros|S], S).
pronoun(sing, frst, [yo|S], S).


% <><><><><><><><> prepositional phrase <><><><><><><><><>

prepositional_phrase(S0, S) :-
    preposition(S0, S1),
    nameS(_, _, S1, S).


% <><><><><><><><> adjectival phrase <><><><><><><><><>

adjectival_phrase(Num, Gen, S0, S) :-
    adjectives(Num, Gen, S0, S).


% <><><><><><><><> name complement <><><><><><><><><>

name_complement(Num, Gen,S0, S) :-
    prepositional_phrase(S0, S1).

name_complement(Num, Gen, S0, S) :-
    adjectival_phrase(Num, Gen, S0, S).

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

verb_phrase(Num, _, Prsn, S0, S):- verb(Num, Prsn, S0, S).
*/


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

noun_phrase(Num, Gen, Prsn, S0, S) :-
    determinant(Num, Gen, Prsn, S0, S1),
    nameS(Num, Gen, S1, S2),
    prepositional_phrase(S2, S).



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

sentence(S0,S):-
    pronoun(Num, Prsn, S0, S1),
    verb_phrase(Num, Gen, Prsn, S1, S).