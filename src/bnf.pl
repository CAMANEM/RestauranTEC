/* -------------------------------------------------------------------------------------------------------------
    Here is build the BNF (Backus-Naur Form) used for the expert system
    The current BNF is build based in the book "El Lenguaje de Programación PROLOG", de M. Teresa. Escrig.
   -----------------------------------------------------------------------------------------------------------*/
:- style_check(-singleton).


sign-->[];[.]. % sinonimos

question_sign(['?'|S],S).

% <><><><><><><><> Question words <><><><><><><><><>

question([que|S],S).
question([cual|S],S).
question([cuales|S],S).

% <><><><><><><><> adverbs <><><><><><><><><>

% place

adverb([cerca|S], S).
adverb([lejos|S], S).

% TIME

adverb([antes|S], S).
adverb([luego|S], S).
adverb([pronto|S], S).
adverb([hoy|S], S).
adverb([mañana|S], S).
adverb([ahora|S], S).
adverb([ahorita|S], S).

% affirmation

adverb([si|S], S).
adverb([claro|S], S).
adverb([tambien|S], S).


% negation

adverb([no|S], S).
adverb([tampoco|S], S).
adverb([ni|S], S).

% doubt

adverb([quiza|S], S).
adverb([igual|S], S).
adverb([posiblemente|S], S).
adverb([probablemente|S], S).
adverb([seguramente|S], S).
adverb-->[].


% <><><><><><><><> adjectives <><><><><><><><><>

adjective(sing, masc, [rico|S], S).
adjective(sing, fem, [rica|S], S).
adjective(plu, masc, [ricos|S], S).
adjective(plu, fem, [ricas|S], S).

adjective(sing, masc, [pequeno|S], S).
adjective(sing, fem, [pequena|S], S).
adjective(plu, masc, [pequenos|S], S).
adjective(plu, fem, [pequenas|S], S).

adjective(sing, _, [grande|S], S).
adjective(plu, _, [grandes|S], S).

adjective(sing, masc, [frio|S], S).
adjective(sing, fem, [fria|S], S).
adjective(plu, masc, [frios|S], S).
adjective(plu, fem, [frias|S], S).

adjective(sing, masc, [frito|S], S).
adjective(plu, fem, [fritas|S], S).

% bebidas

adjective(sing, _, [caliente|S], S).
adjective(plu, _, [calientes|S], S).
adjective(sing, fem, [natural|S],S).
adjective(sing, masc, [natural|S],S).
adjective(plu, fem, [naturales|S],S).
adjective(plu, masc, [naturales|S],S).
adjective(sing, fem, [gaseosa|S],S).
adjective(plu, fem, [gaseosas|S],S).

adjective(sing, fem, [nacional|S],S).
adjective(sing, fem, [corona|S],S).

% comidas
adjective(sing, fem, [rapida|S], S).
adjective(sing, fem, [italiana|S], S).
adjective(sing, fem, [china|S], S).
adjective(sing, fem, [saludable|S], S).
adjective(sing, fem, [tipica|S], S).

% for n person

adjective(sing, _, [persona|S], S).
adjective(plu, _, [personas|S], S).

% <><><><><><><><> Conjuction <><><><><><><><><>

conjunction([y|S],S).
conjunction([o|S],S).
conjunction([u|S],S).

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

noun(sing, masc, [hombre|S],S).
noun(plu, masc, [hombres|S],S).
noun(sing, fem, [mujer|S],S).
noun(plu, fem, [mujeres|S],S).
noun(sing, fem, [manzana|S],S).
noun(plu, fem, [manzanas|S],S).

noun(sing, masc, [hijo|S],S).
noun(sing, fem, [hija|S],S).
noun(plu, masc, [hijos|S],S).
noun(plu, fem, [hijas|S],S).
noun(sing, masc, [esposo|S],S).
noun(sing, fem, [esposa|S],S).

noun(sing, fem, [hamburguesa|S],S).
noun(plu, fem, [hamburguesas|S],S).

% food
noun(sing, fem, [comida|S],S).
noun(plu, fem, [comidas|S],S).

noun(plu, fem, [papas|S],S).
noun(sing, masc, [postre|S],S).
noun(sing, masc, [pollo|S],S).

noun(sing, masc, [casado|S],S).
noun(sing, masc, [mondongo|S],S).
noun(sing, fem, [prensada|S],S).
noun(sing, fem, [tortilla|S],S).

noun(sing, masc, [sandwich|S],S). % sinonimo
noun(sing, masc, [emparedado|S],S). % sinonimo
noun(sing, fem, [ensalada|S],S).
noun(sing, fem, [pasta|S],S).
noun(sing, masc, [falafel|S],S).

noun(sing, fem, [pizza|S],S).
noun(plu, fem, [pizzas|S],S).
noun(sing, masc, [spaguetti|S],S).
noun(sing, fem, [lasagna|S],S).
noun(sing, masc, [gelato|S],S).

noun(plu, fem, [gyozas|S],S).
noun(plu, masc, [dumplings|S],S).
noun(sing, masc, [cantones|S],S).
noun(sing, masc, [tofu|S],S).

% drinks
noun(sing, fem, [bebida|S],S).
noun(plu, fem, [bebidas|S],S).
noun(sing, masc, [fresco|S],S).
noun(plu, masc, [frescos|S],S).
noun(sing, masc, [refresco|S],S).
noun(plu, masc, [refrescos|S],S).

noun(sing, masc, [coctel|S],S).
noun(plu, masc, [cocteles|S],S).
noun(sing, fem, [gaseosa|S],S).
noun(plu, fem, [gaseosas|S],S).
noun(sing, fem, [cerveza|S],S).
noun(plu, fem, [cervezas|S],S).

noun(sing, masc, [cas|S],S).
noun(sing, fem, [fresa|S],S).

noun(sing, masc, [cafe|S],S).
noun(sing, masc, [chocolate|S],S).
noun(sing, masc, [capuchino|S],S).

noun(sing, fem, [cocacola|S],S).
noun(sing, fem, [sprite|S],S).
noun(sing, fem, [fanta|S],S).

noun(sing, masc, [martini |S],S).
noun(sing, fem, [margarita|S],S).

noun(sing, fem, [nacional|S],S).
noun(sing, fem, [corona|S],S).


% locations

noun(sing, _, ['Cartago'|S],S).
noun(sing, _, ['SanJose'|S],S).
noun(sing, _, ['Heredia'|S],S).

noun(sing, _, ['McDonalds'|S],S).
noun(sing, _, ['KFC'|S],S).

noun(sing, _, ['Balcon Criollo'|S],S).
noun(sing, _, ['Rancho Los Coyotes'|S],S).

noun(sing, _, ['Samadhi'|S],S).
noun(sing, _, ['Subway'|S],S).

noun(sing, _, ['La Dolce Vita'|S],S).
noun(sing, _, ['Ragu'|S],S).

noun(sing, _, ['Cuchara Oriental'|S],S).
noun(sing, _, ['Yong Xing'|S],S).

% numbers
/*
    Validates if the noun is a number higher than zero and clasifies it as singular (1) or plural (1<)
    and returns the rest of the list without the number
    @param   Num:  number form (singular or plural)
    @param    S0:  list with the number
    @param     S:  rest of the list without the number
*/
noun(Num, _, S0,S):-
    get_first(S0, X),
    is_digit(Num,X),
    get_next(S0, S).

/*
    Gets the first element of a given list
    @param   [FirstElement|_]:  a not empty list
    @param        FirsElement:  first element of the given list
*/
get_first([FirstElement|_], FirstElement).

/*
    Returns a list without its first Element
    @param    [_|Next]:  a not empty list
    @param        Next:  rest of the list without the first element
*/
get_next([_|Next], Next).


/*
    Validates if the noun is a number higher than zero and clasifies it as singular (1) or plural (1<)
    @param   Num:  number form (singular or plural)
    @param     X:  value to validate
*/
is_digit(Num, X) :-
       number(X),
       (X == 1 -> Num = 'sing').

is_digit(Num, X) :-
       number(X),
       (X > 1 -> Num = 'plu').




% <><><><><><><><><> Verbs <><><><><><><><><><><>

verb(sing, frst, [adoro|S],S). % present
verb(sing, thrd, [adora|S],S). % present
verb(plu, frst, [adoramos|S],S). % present
verb(plu, thrd, [adoran|S],S). % present
verb(sing, frst, [adorare|S],S). % future
verb(sing, thrd, [adorara|S],S). % future
verb(plu, frst, [adoraremos|S],S). % future
verb(plu, thrd, [adoraran|S],S). % future
verb(sing, frst, [adoraba|S],S). % past
verb(sing, thrd, [adoraba|S],S). % past
verb(plu, frst, [adorabamos|S],S). % past
verb(plu, thrd, [adoraban|S],S). % past
verb(sing, frst, [adoraria|S],S). % condicional
verb(sing, thrd, [adoraria|S],S). % condicional
verb(plu, frst, [adorariamos|S],S). % condicional
verb(plu, thrd, [adorarian|S],S). % condicional


verb(sing, frst, [agradezco|S],S).
verb(sing, thrd, [agradece|S],S).
verb(plu, frst, [agradecemos|S],S).
verb(plu, thrd, [agradecen|S],S).
verb(sing, frst, [agradecere|S],S).
verb(sing, thrd, [agradecera|S],S).
verb(plu, frst, [agradeceremos|S],S).
verb(plu, thrd, [agradeceran|S],S).
verb(sing, frst, [agradecia|S],S).
verb(sing, thrd, [agradecia|S],S).
verb(plu, frst, [agradeciamos|S],S).
verb(plu, thrd, [agradecian|S],S).
verb(sing, frst, [agradeceria|S],S).
verb(sing, thrd, [agradeceria|S],S).
verb(plu, frst, [agradeceriamos|S],S).
verb(plu, thrd, [agradecerian|S],S).

verb(sing, frst, [ambiciono|S],S).
verb(sing, thrd, [ambiciona|S],S).
verb(plu, frst, [ambicionamos|S],S).
verb(plu, thrd, [ambicionan|S],S).
verb(sing, frst, [ambicionare|S],S).
verb(sing, thrd, [ambicionara|S],S).
verb(plu, frst, [ambicionaremos|S],S).
verb(plu, thrd, [ambicionaran|S],S).
verb(sing, frst, [ambicionaba|S],S).
verb(sing, thrd, [ambicionaba|S],S).
verb(plu, frst, [ambicionabamos|S],S).
verb(plu, thrd, [ambicionaban|S],S).
verb(sing, frst, [ambicionaria|S],S).
verb(sing, thrd, [ambicionaria|S],S).
verb(plu, frst, [ambicionariamos|S],S).
verb(plu, thrd, [ambicionarian|S],S).

verb(sing, frst, [amo|S],S).
verb(sing, thrd, [ama|S],S).
verb(plu, frst, [amamos|S],S).
verb(plu, thrd, [aman|S],S).
verb(sing, frst, [amare|S],S).
verb(sing, thrd, [amara|S],S).
verb(plu, frst, [amaremos|S],S).
verb(plu, thrd, [amaran|S],S).
verb(sing, frst, [amaba|S],S).
verb(sing, thrd, [amaba|S],S).
verb(plu, frst, [amabamos|S],S).
verb(plu, thrd, [amaban|S],S).
verb(sing, frst, [amaria|S],S).
verb(sing, thrd, [amaria|S],S).
verb(plu, frst, [amariamos|S],S).
verb(plu, thrd, [amarian|S],S).

verb(sing, frst, [anhelo|S],S).
verb(sing, thrd, [anhela|S],S).
verb(plu, frst, [anhelamos|S],S).
verb(plu, thrd, [anhelan|S],S).
verb(sing, frst, [anhelare|S],S).
verb(sing, thrd, [anhelara|S],S).
verb(plu, frst, [anhelaremos|S],S).
verb(plu, thrd, [anhelaran|S],S).
verb(sing, frst, [anhelaba|S],S).
verb(sing, thrd, [anhelaba|S],S).
verb(plu, frst, [anhelabamos|S],S).
verb(plu, thrd, [anhelaban|S],S).
verb(sing, frst, [anhelaria|S],S).
verb(sing, thrd, [anhelaria|S],S).
verb(plu, frst, [anhelariamos|S],S).
verb(plu, thrd, [anhelarian|S],S).

verb(sing, frst, [ansio|S],S).
verb(sing, thrd, [ansia|S],S).
verb(plu, frst, [ansiamos|S],S).
verb(plu, thrd, [ansian|S],S).
verb(sing, frst, [ansiare|S],S).
verb(sing, thrd, [ansiara|S],S).
verb(plu, frst, [ansiaremos|S],S).
verb(plu, thrd, [ansiaran|S],S).
verb(sing, frst, [ansiaba|S],S).
verb(sing, thrd, [ansiaba|S],S).
verb(plu, frst, [ansiabamos|S],S).
verb(plu, thrd, [ansiaban|S],S).
verb(sing, frst, [ansiaria|S],S).
verb(sing, thrd, [ansiaria|S],S).
verb(plu, frst, [ansiariamos|S],S).
verb(plu, thrd, [ansiarian|S],S).

verb(sing, frst, [apetezco|S],S).
verb(sing, thrd, [apetece|S],S).
verb(plu, frst, [apetecemos|S],S).
verb(plu, thrd, [apetecen|S],S).
verb(sing, frst, [apetecere|S],S).
verb(sing, thrd, [apetecera|S],S).
verb(plu, frst, [apeteceremos|S],S).
verb(plu, thrd, [apeteceran|S],S).
verb(sing, frst, [apetecia|S],S).
verb(sing, thrd, [apetecia|S],S).
verb(plu, frst, [apeteciamos|S],S).
verb(plu, thrd, [apetecian|S],S).
verb(sing, frst, [apeteceria|S],S).
verb(sing, thrd, [apeteceria|S],S).
verb(plu, frst, [apeteceriamos|S],S).
verb(plu, thrd, [apetecerian|S],S).

verb(sing, frst, [aspiro|S],S).
verb(sing, thrd, [aspira|S],S).
verb(plu, frst, [aspiramos|S],S).
verb(plu, thrd, [aspiran|S],S).
verb(sing, frst, [aspirare|S],S).
verb(sing, thrd, [aspirara|S],S).
verb(plu, frst, [aspiraremos|S],S).
verb(plu, thrd, [aspiraran|S],S).
verb(sing, frst, [aspiraba|S],S).
verb(sing, thrd, [aspiraba|S],S).
verb(plu, frst, [aspirabamos|S],S).
verb(plu, thrd, [aspiraban|S],S).
verb(sing, frst, [aspiraria|S],S).
verb(sing, thrd, [aspiraria|S],S).
verb(plu, frst, [aspirariamos|S],S).
verb(plu, thrd, [aspirarian|S],S).

verb(sing, frst, [busco|S],S).
verb(sing, thrd, [busca|S],S).
verb(plu, frst, [buscamos|S],S).
verb(plu, thrd, [buscan|S],S).
verb(sing, frst, [buscare|S],S).
verb(sing, thrd, [buscara|S],S).
verb(plu, frst, [buscaremos|S],S).
verb(plu, thrd, [buscaran|S],S).
verb(sing, frst, [buscaba|S],S).
verb(sing, thrd, [buscaba|S],S).
verb(plu, frst, [buscabamos|S],S).
verb(plu, thrd, [buscaban|S],S).
verb(sing, frst, [buscaria|S],S).
verb(sing, thrd, [buscaria|S],S).
verb(plu, frst, [buscariamos|S],S).
verb(plu, thrd, [buscarian|S],S).

verb(sing, frst, [como|S],S).
verb(sing, thrd, [come|S],S).
verb(plu, frst, [comemos|S],S).
verb(plu, thrd, [comen|S],S).
verb(sing, frst, [comere|S],S).
verb(sing, thrd, [comera|S],S).
verb(plu, frst, [comeremos|S],S).
verb(plu, thrd, [comeran|S],S).
verb(sing, frst, [comia|S],S).
verb(sing, thrd, [comia|S],S).
verb(plu, frst, [comiamos|S],S).
verb(plu, thrd, [comian|S],S).
verb(sing, frst, [comeria|S],S).
verb(sing, thrd, [comeria|S],S).
verb(plu, frst, [comeriamos|S],S).
verb(plu, thrd, [comerian|S],S).

verb(sing, frst, [compro|S],S).
verb(sing, thrd, [compra|S],S).
verb(plu, frst, [compramos|S],S).
verb(plu, thrd, [compran|S],S).
verb(sing, frst, [comprare|S],S).
verb(sing, thrd, [comprara|S],S).
verb(plu, frst, [compraremos|S],S).
verb(plu, thrd, [compraran|S],S).
verb(sing, frst, [compraba|S],S).
verb(sing, thrd, [compraba|S],S).
verb(plu, frst, [comprabamos|S],S).
verb(plu, thrd, [compraban|S],S).
verb(sing, frst, [compraria|S],S).
verb(sing, thrd, [compraria|S],S).
verb(plu, frst, [comprariamos|S],S).
verb(plu, thrd, [comprarian|S],S).

verb(sing, frst, [demando|S],S).
verb(sing, thrd, [demanda|S],S).
verb(plu, frst, [demandamos|S],S).
verb(plu, thrd, [demandan|S],S).
verb(sing, frst, [demandare|S],S).
verb(sing, thrd, [demandara|S],S).
verb(plu, frst, [demandaremos|S],S).
verb(plu, thrd, [demandaran|S],S).
verb(sing, frst, [demandaba|S],S).
verb(sing, thrd, [demandaba|S],S).
verb(plu, frst, [demandabamos|S],S).
verb(plu, thrd, [demandaban|S],S).
verb(sing, frst, [demandaria|S],S).
verb(sing, thrd, [demandaria|S],S).
verb(plu, frst, [demandariamos|S],S).
verb(plu, thrd, [demandarian|S],S).

verb(sing, frst, [deseo|S],S).
verb(sing, thrd, [desea|S],S).
verb(plu, frst, [deseamos|S],S).
verb(plu, thrd, [desean|S],S).
verb(sing, frst, [deseare|S],S).
verb(sing, thrd, [desara|S],S).
verb(plu, frst, [desearemos|S],S).
verb(plu, thrd, [desearan|S],S).
verb(sing, frst, [deseaba|S],S).
verb(sing, thrd, [deseaba|S],S).
verb(plu, frst, [deseabamos|S],S).
verb(plu, thrd, [deseaban|S],S).
verb(sing, frst, [desearia|S],S).
verb(sing, thrd, [desearia|S],S).
verb(plu, frst, [deseariamos|S],S).
verb(plu, thrd, [desearian|S],S).

verb(sing, frst, [disfruto|S],S).
verb(sing, thrd, [disfruta|S],S).
verb(plu, frst, [disfrutamos|S],S).
verb(plu, thrd, [disfrutan|S],S).
verb(sing, frst, [disfrutare|S],S).
verb(sing, thrd, [disfrutara|S],S).
verb(plu, frst, [disfrutaremos|S],S).
verb(plu, thrd, [disfrutaran|S],S).
verb(sing, frst, [disfrutaba|S],S).
verb(sing, thrd, [disfrutaba|S],S).
verb(plu, frst, [disfrutabamos|S],S).
verb(plu, thrd, [disfrutaban|S],S).
verb(sing, frst, [disfrutaria|S],S).
verb(sing, thrd, [disfrutaria|S],S).
verb(plu, frst, [disfrutariamos|S],S).
verb(plu, thrd, [disfrutarian|S],S).

verb(sing, frst, [espero|S],S).
verb(sing, thrd, [espera|S],S).
verb(plu, frst, [esperamos|S],S).
verb(plu, thrd, [esperan|S],S).
verb(sing, frst, [esperare|S],S).
verb(sing, thrd, [esperara|S],S).
verb(plu, frst, [esperaremos|S],S).
verb(plu, thrd, [esperaran|S],S).
verb(sing, frst, [esperaba|S],S).
verb(sing, thrd, [esperaba|S],S).
verb(plu, frst, [esperabamos|S],S).
verb(plu, thrd, [esperaban|S],S).
verb(sing, frst, [esperaria|S],S).
verb(sing, thrd, [esperaria|S],S).
verb(plu, frst, [esperariamos|S],S).
verb(plu, thrd, [esperarian|S],S).

verb(sing, frst, [exijo|S],S).
verb(sing, thrd, [exige|S],S).
verb(plu, frst, [exigimos|S],S).
verb(plu, thrd, [exigen|S],S).
verb(sing, frst, [exigire|S],S).
verb(sing, thrd, [exigira|S],S).
verb(plu, frst, [exigiremos|S],S).
verb(plu, thrd, [exigiran|S],S).
verb(sing, frst, [exigia|S],S).
verb(sing, thrd, [exigia|S],S).
verb(plu, frst, [exigiamos|S],S).
verb(plu, thrd, [exigian|S],S).
verb(sing, frst, [exigiria|S],S).
verb(sing, thrd, [exigiria|S],S).
verb(plu, frst, [exigiriamos|S],S).
verb(plu, thrd, [exigirian|S],S).

verb(sing, frst, [necesito|S],S).
verb(sing, thrd, [necesita|S],S).
verb(plu, frst, [necesitamos|S],S).
verb(plu, thrd, [necesitan|S],S).
verb(sing, frst, [necesitare|S],S).
verb(sing, thrd, [necesitara|S],S).
verb(plu, frst, [necesitaremos|S],S).
verb(plu, thrd, [necesitaran|S],S).
verb(sing, frst, [necesitaba|S],S).
verb(sing, thrd, [necesitaba|S],S).
verb(plu, frst, [necesitabamos|S],S).
verb(plu, thrd, [necesitaban|S],S).
verb(sing, frst, [necesitaria|S],S).
verb(sing, thrd, [necesitaria|S],S).
verb(plu, frst, [necesitariamos|S],S).
verb(plu, thrd, [necesitarian|S],S).

verb(sing, frst, [ocupo|S],S).
verb(sing, thrd, [ocupa|S],S).
verb(plu, frst, [ocupamos|S],S).
verb(plu, thrd, [ocupan|S],S).
verb(sing, frst, [ocupare|S],S).
verb(sing, thrd, [ocupara|S],S).
verb(plu, frst, [ocuparemos|S],S).
verb(plu, thrd, [ocuparan|S],S).
verb(sing, frst, [ocupaba|S],S).
verb(sing, thrd, [ocupaba|S],S).
verb(plu, frst, [ocupabamos|S],S).
verb(plu, thrd, [ocupaban|S],S).
verb(sing, frst, [ocuparia|S],S).
verb(sing, thrd, [ocuparia|S],S).
verb(plu, frst, [ocupariamos|S],S).
verb(plu, thrd, [ocuparian|S],S).

verb(sing, frst, [ordeno|S],S).
verb(sing, thrd, [ordena|S],S).
verb(plu, frst, [ordenamos|S],S).
verb(plu, thrd, [ordenan|S],S).
verb(sing, frst, [ordenare|S],S).
verb(sing, thrd, [ordenara|S],S).
verb(plu, frst, [ordenaremos|S],S).
verb(plu, thrd, [ordenaran|S],S).
verb(sing, frst, [ordenaba|S],S).
verb(sing, thrd, [ordenaba|S],S).
verb(plu, frst, [ordenabamos|S],S).
verb(plu, thrd, [ordenaban|S],S).
verb(sing, frst, [ordenaria|S],S).
verb(sing, thrd, [ordenaria|S],S).
verb(plu, frst, [ordenariamos|S],S).
verb(plu, thrd, [ordenarian|S],S).

verb(sing, frst, [pido|S],S).
verb(sing, thrd, [pide|S],S).
verb(plu, frst, [pedimos|S],S).
verb(plu, thrd, [piden|S],S).
verb(sing, frst, [pedire|S],S).
verb(sing, thrd, [pedira|S],S).
verb(plu, frst, [pediremos|S],S).
verb(plu, thrd, [pediran|S],S).
verb(sing, frst, [pedia|S],S).
verb(sing, thrd, [pedia|S],S).
verb(plu, frst, [pediamos|S],S).
verb(plu, thrd, [pedian|S],S).
verb(sing, frst, [pediria|S],S).
verb(sing, thrd, [pediria|S],S).
verb(plu, frst, [pediriamos|S],S).
verb(plu, thrd, [pedirian|S],S).

verb(sing, frst, [prefiero|S],S).
verb(sing, thrd, [prefiere|S],S).
verb(plu, frst, [preferimos|S],S).
verb(plu, thrd, [prefieren|S],S).
verb(sing, frst, [preferire|S],S).
verb(sing, thrd, [preferira|S],S).
verb(plu, frst, [preferiremos|S],S).
verb(plu, thrd, [preferiran|S],S).
verb(sing, frst, [preferia|S],S).
verb(sing, thrd, [preferia|S],S).
verb(plu, frst, [preferiamos|S],S).
verb(plu, thrd, [preferian|S],S).
verb(sing, frst, [preferiria|S],S).
verb(sing, thrd, [preferiria|S],S).
verb(plu, frst, [prefeririamos|S],S).
verb(plu, thrd, [preferirian|S],S).

verb(sing, frst, [quiero|S],S).
verb(sing, thrd, [quiere|S],S).
verb(plu, frst, [queremos|S],S).
verb(plu, thrd, [quieren|S],S).
verb(sing, frst, [querre|S],S).
verb(sing, thrd, [querra|S],S).
verb(plu, frst, [querremos|S],S).
verb(plu, thrd, [querran|S],S).
verb(sing, frst, [queria|S],S).
verb(sing, thrd, [queria|S],S).
verb(plu, frst, [queriamos|S],S).
verb(plu, thrd, [querian|S],S).
verb(sing, frst, [querria|S],S).
verb(sing, thrd, [querria|S],S).
verb(plu, frst, [querriamos|S],S).
verb(plu, thrd, [querrian|S],S).


verb(sing, frst, [quiero, comer|S],S).
verb(sing, thrd, [quiere, comer|S],S).
verb(plu, frst, [queremos, comer|S],S).
verb(plu, thrd, [quieren, comer|S],S).
verb(sing, frst, [querre, comer|S],S).
verb(sing, thrd, [querra, comer|S],S).
verb(plu, frst, [querremos, comer|S],S).
verb(plu, thrd, [querran, comer|S],S).
verb(sing, frst, [queria, comer|S],S).
verb(sing, thrd, [queria, comer|S],S).
verb(plu, frst, [queriamos, comer|S],S).
verb(plu, thrd, [querian, comer|S],S).
verb(sing, frst, [querria, comer|S],S).
verb(sing, thrd, [querria, comer|S],S).
verb(plu, frst, [querriamos, comer|S],S).
verb(plu, thrd, [querrian, comer|S],S).

verb(sing, frst, [quiero, tomar|S],S).
verb(sing, thrd, [quiere, tomar|S],S).
verb(plu, frst, [queremos, tomar|S],S).
verb(plu, thrd, [quieren, tomar|S],S).
verb(sing, frst, [querre, tomar|S],S).
verb(sing, thrd, [querra, tomar|S],S).
verb(plu, frst, [querremos, tomar|S],S).
verb(plu, thrd, [querran, tomar|S],S).
verb(sing, frst, [queria, tomar|S],S).
verb(sing, thrd, [queria, tomar|S],S).
verb(plu, frst, [queriamos, tomar|S],S).
verb(plu, thrd, [querian, tomar|S],S).
verb(sing, frst, [querria, tomar|S],S).
verb(sing, thrd, [querria, tomar|S],S).
verb(plu, frst, [querriamos, tomar|S],S).
verb(plu, thrd, [querrian, tomar|S],S).


verb(sing, frst, [solicito|S],S).
verb(sing, thrd, [solicita|S],S).
verb(plu, frst, [solicitamos|S],S).
verb(plu, thrd, [solicitan|S],S).
verb(sing, frst, [solicitare|S],S).
verb(sing, thrd, [solicitara|S],S).
verb(plu, frst, [solicitaremos|S],S).
verb(plu, thrd, [solicitaran|S],S).
verb(sing, frst, [solicitaba|S],S).
verb(sing, thrd, [solicitaba|S],S).
verb(plu, frst, [solicitabamos|S],S).
verb(plu, thrd, [solicitaban|S],S).
verb(sing, frst, [solicitaria|S],S).
verb(sing, thrd, [solicitaria|S],S).
verb(plu, frst, [solicitariamos|S],S).
verb(plu, thrd, [solicitarian|S],S).

verb(sing, frst, [soy|S],S).
verb(sing, thrd, [es|S],S).
verb(plu, frst, [somos|S],S).
verb(plu, thrd, [son|S],S).
verb(sing, frst, [sere|S],S).
verb(sing, thrd, [sera|S],S).
verb(plu, frst, [seremos|S],S).
verb(plu, thrd, [seran|S],S).
verb(sing, frst, [era|S],S).
verb(sing, thrd, [era|S],S).
verb(plu, frst, [eramos|S],S).
verb(plu, thrd, [eran|S],S).
verb(sing, frst, [seria|S],S).
verb(sing, thrd, [seria|S],S).
verb(plu, frst, [seriamos|S],S).
verb(plu, thrd, [serian|S],S).


verb(sing, frst, [tomo|S],S).
verb(sing, thrd, [toma|S],S).
verb(plu, frst, [tomamos|S],S).
verb(plu, thrd, [toman|S],S).
verb(sing, frst, [tomare|S],S).
verb(sing, thrd, [tomara|S],S).
verb(plu, frst, [tomaremos|S],S).
verb(plu, thrd, [tomaran|S],S).
verb(sing, frst, [tomaba|S],S).
verb(sing, thrd, [tomaba|S],S).
verb(plu, frst, [tomabamos|S],S).
verb(plu, thrd, [tomaban|S],S).
verb(sing, frst, [tomaria|S],S).
verb(sing, thrd, [tomaria|S],S).
verb(plu, frst, [tomariamos|S],S).
verb(plu, thrd, [tomarian|S],S).

verb(sing, frst, [voy|S],S).
verb(sing, thrd, [va|S],S).
verb(plu, frst, [vamos|S],S).
verb(plu, thrd, [van|S],S).
verb(sing, frst, [ire|S],S).
verb(sing, thrd, [ira|S],S).
verb(plu, frst, [iremos|S],S).
verb(plu, thrd, [iran|S],S).
verb(sing, frst, [iba|S],S).
verb(sing, thrd, [iba|S],S).
verb(plu, frst, [ibamos|S],S).
verb(plu, thrd, [iban|S],S).
verb(sing, frst, [iria|S],S).
verb(sing, thrd, [iria|S],S).
verb(plu, frst, [iriamos|S],S).
verb(plu, thrd, [irian|S],S).

verb(sing, frst, [voy, a, comer|S],S).
verb(sing, thrd, [va, a, comer|S],S).
verb(plu, frst, [vamos, a, comer|S],S).
verb(plu, thrd, [van, a, comer|S],S).
verb(sing, frst, [ire, a, comer|S],S).
verb(sing, thrd, [ira, a, comer|S],S).
verb(plu, frst, [iremos, a, comer|S],S).
verb(plu, thrd, [iran, a, comer|S],S).
verb(sing, frst, [iba, a, comer|S],S).
verb(sing, thrd, [iba, a, comer|S],S).
verb(plu, frst, [ibamos, a, comer|S],S).
verb(plu, thrd, [iban, a, comer|S],S).
verb(sing, frst, [iria, a, comer|S],S).
verb(sing, thrd, [iria, a, comer|S],S).
verb(plu, frst, [iriamos, a, comer|S],S).
verb(plu, thrd, [irian, a, comer|S],S).

verb(sing, frst, [voy, a, tomar|S],S).
verb(sing, thrd, [va, a, tomar|S],S).
verb(plu, frst, [vamos, a, tomar|S],S).
verb(plu, thrd, [van, a, tomar|S],S).
verb(sing, frst, [ire, a, tomar|S],S).
verb(sing, thrd, [ira, a, tomar|S],S).
verb(plu, frst, [iremos, a, tomar|S],S).
verb(plu, thrd, [iran, a, tomar|S],S).
verb(sing, frst, [iba, a, tomar|S],S).
verb(sing, thrd, [iba, a, tomar|S],S).
verb(plu, frst, [ibamos, a, tomar|S],S).
verb(plu, thrd, [iban, a, tomar|S],S).
verb(sing, frst, [iria, a, tomar|S],S).
verb(sing, thrd, [iria, a, tomar|S],S).
verb(plu, frst, [iriamos, a, tomar|S],S).
verb(plu, thrd, [irian, a, tomar|S],S).

% question verbs

verb(plu, thrd, [disponen|S],S).
verb(plu, thrd, [hay|S],S).
verb(plu, thrd, [ofrecen|S],S).
verb(sing, thrd, [ofrece|S],S).
verb(sing, thrd, [recomienda|S],S).
verb(plu, thrd, [recomiendan|S],S).
verb(plu, thrd, [tienen|S],S).
verb(sing, thrd, [tiene|S],S).




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

pronoun(sing, thrd, ['Oscar'|S], S).
pronoun(sing, thrd, ['Sebastian'|S], S).
pronoun(sing, thrd, ['Valerie'|S], S).
pronoun(sing, thrd, ['Marco'|S], S).
pronoun(sing, thrd, [el| S], S).
pronoun(sing, thrd, [ella| S], S).
pronoun(plu, thrd, [ellos|S], S).
pronoun(plu, thrd, [ellas|S], S).
pronoun(plu, frst, [nosotros|S], S).
pronoun(sing, frst, [yo|S], S).


% <><><><><><><><> prepositional phrase <><><><><><><><><>

/*
    Validates or generates a valid prepositional phrase
    @param    S0:  list of words
    @param     S:  list of words remaining after the prepositional phrase
*/
prepositional_phrase(S0, S) :-
    adverb(S0, S1),
    preposition(S1, S2),
    noun(_, _, S2, S).


% <><><><><><><><> adjectival phrase <><><><><><><><><>

/*
    Validates or generates a valid adjectival phrase
    @param   Num:  number form (singular or plural)
    @param   Gen:  the genre (masculin of feminine)
    @param    S0:  list of words
    @param     S:  list of words remaining after the adjectival phrase
*/
adjectival_phrase(Num, Gen, S0, S) :-
    adjective(Num, Gen, S0, S).


% <><><><><><><><> name complement <><><><><><><><><>

/*
    Validates or generates a valid name complement
    @param   Num:  number form (singular or plural)
    @param   Gen:  the genre (masculin of feminine)
    @param    S0:  list of words
    @param     S:  list of words remaining after the name complement
*/
name_complement(Num, Gen,S0, S) :-
    prepositional_phrase(S0, S).



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
    adverb(S0, S1),
    verb(Num, Prsn, S1, S2),
    noun_phrase(_, _, _, S2, S).


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
    noun(Num, Gen, S1, S).

noun_phrase(Num, Gen, Prsn, S0, S) :-
    determinant(Num, Gen, Prsn, S0, S1),
    noun(Num, Gen, S1, S2),
    name_complement(Num, Gen, S2, S).

noun_phrase(Num, Gen, Prsn, S0, S) :-
    noun(Num, Gen, S0, S1),
    name_complement(Num, Gen, S1, S).

noun_phrase(Num, Gen, Prsn, S0, S) :-
    prepositional_phrase(S0, S).

noun_phrase(Num, Gen, Prsn, S0, S) :-
    determinant(Num, Gen, Prsn, S0, S1),
    noun(Num, Gen, S1, S2),
    conjunction(S2, S3),
    determinant(Num2, Gen2, Prsn2, S3, S4),
    noun(Num2, Gen2, S4, S).

noun_phrase(Num, Gen, Prsn, S0, S) :-
    noun(_, _, S0, S).

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
    verb_phrase(Num, Gen, Prsn, S1, S2),
    sign(S2, S).

sentence(S0,S):-
    pronoun(Num, Prsn, S0, S1),
    verb_phrase(Num, Gen, Prsn, S1, S2),
    sign(S2, S).

sentence(S0,S):-
    verb_phrase(Num, Gen, Prsn, S0, S1),
    sign(S1, S).

% Questions

sentence(S0,S):-
    verb_phrase(Num, Gen, Prsn, S0, S1),
    question_sign(S1, S).

sentence(S0,S):-
    question(S0, S1),
    noun_phrase(Num, Gen, Prsn, S1, S2),
    verb(_, _, S2, S3),
    question_sign(S3, S).



/*
    Validates a sentence. If the sentence isnt valid, ask the user for another input.
    Also checks if the user wants to close the program
    @param   S:  list of words forming the sentence
    @param   V:  Valid sentence
*/
valid_sentence(S,V):-sentence(S, []),V=S.

% Checks if the user wants to close the program
valid_sentence(S,V):-is_end(S,Val),(Val ==1 ->halt()).

valid_sentence(S,V):-
    writeln('"No comprendo su solicitud. Por favor, intente escribirla de otra forma."'),
    readln(S2),
    valid_sentence(S2,V).



/*
    Checks if the user is asking for help / or close the program / or if the the list command is empty
    @param  [] :  empty list / or user command / or end of list
    @param   Z :  a value depending of the user command
*/
is_end([],Z):- Z=0.
is_end([H|_],Z):-(H=='adios' -> Z=1,!;H=='Ayuda' -> z=1,!).
is_end([_|N],Z):- is_end(N,Z).

% :- initialization(test).

test:-
    writeln('**************************************************'),
    writeln('***************    RestauranTEC    ***************'),
    writeln('**************************************************'),
    writeln("Inserte una oracion para saber si esta es valida"),
    readln(Ans), valid_sentence(Ans, V).
