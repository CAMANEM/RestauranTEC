% La informacion individual del restaurante tiene el siguiente formato:
% [([nombre del restaurante]), (tipo de comida), ([provincia, canton]),
% (direccion), ([menu disponible]),(capacidad),(disposiciones)]
%
%
% restaurante([[],'','','',[],'','']).

% En cartago:
restaurante([
    ['mcdonalds','McDonalds'],
    'rapida',
    'Cartago',
    '150 m sur del walmart de caballo blanco',
    ['Hamburguesa','Desayuno','Postre','Papas fritas'],
     '30',
     'Este es un restaurante para toda la familia, area de juego para niños']).

restaurante([
    ['subway','Subway'],
    'saludable',
    ['Cartago','Cartago'],
    '500m oeste de la entrada principal del ITCR',
    ['Sandwich','Ensalada','Burrito','Desayuno'],
    '20',
    'Pregunta por el sub del dia, un delicioso sandwich a buen precio']).

/*

restaurante([[balconCriollo,'Balcon Criollo'] ,tipica
,['Cartago','Cartago'],'Costado este de la municipalidad enavenida
central de Cartago',['Chifrijo','Casados','Olla de
carne','Hamburguesas']]).*/

% En San Jose




% En Heredia






% La informacion de que restaurantes tienen ciertas comidas tiene el
% siguiente formato:
% [(categoria),[(comidas disponibles)], [(nombre de los restaurantes
% que ofrecen)]]
%
% comida(['',[],[]]).



comida(['rapida',['hamburguesa','papas fritas','sandwich'],[mcDonalds]]).
comida(['tipica',['torilla de queso','olla de carne'],[balconCriollo]]).
comida(['saludable',['',''],[]]).
comida(['italiana',[''],[]]).
comida(['china',[''],[]]).




% La informacion sobre restaurantes que tienen ciertas bebidas tiene el
% siguiente formato:
% [(categoria),[(bebidas disponibles)], [(nombre de los restaurantes
% disponibles)]]
%
% bebida(['',[],[]]).


bebida(['natural',['cas','fresa'],[balconCriollo]]).
bebida(['caliente',['café','chocolate','agua dulce'],[balconCriollo]]).
bebida(['gaseosa',['coca cola','sprite','fanta'],[mcDonalds,subway]]).
bebida(['coctel',['piña colada','margarita'],[balconCriollo]]).
bebida(['cerveza',['nacional','corona'],[balconCriollo]]).



/*
 *
 *
 *
 */



lugar(['Cartago',['']]).
lugar(['cartago',['']]).
lugar(['San Jose',['']]).
lugar(['san jose',['']]).

