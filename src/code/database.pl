% La informacion individual del restaurante tiene el siguiente formato:
% [([nombre del restaurante]), (tipo de comida), ([provincia, canton]),
% (direccion), ([menu disponible]),(capacidad),(disposiciones)]
%
%
% restaurante([[],"",[],"",[],"",""]).

% En cartago:
restaurante([
    [mcDonalds,'McDonalds'],
    "rapida",
    ['Cartago','Caballo Blanco'],
    "150 m sur del walmart de caballo blanco",
    ['BigMac','Cuarto de libra','Pollo Bacon','Papas fritas'],
     "30",
     "Este es un restaurante familiar por lo que se debe tener un comportamiento acorde"]).

restaurante([
    [subway,'Subway'],
    "saludable",
    ['Cartago','Cartago'],
    '500m oeste de la entrada principal del ITCR',
    ['Jamon de pavo','Pollo teriyaki','Italiano B.M.T.','Desayuno completo'],
    "20",
    "Pregunta por el sub del dia, un delicioso sandwich a buen precio"]).

/*
restaurante([[laTortilleria,'La Tortilleria'] , tipica ,['Cartago','Cartago'],'175m oeste de la Basilica de Los Angeles',['Pintortilla con cafe','Torticasado','Tortilla de Queso','Chorreadas']]).
restaurante([[balconCriollo,'Balcon Criollo'] ,tipica
,['Cartago','Cartago'],'Costado este de la municipalidad enavenida
central de Cartago',['Chifrijo','Casados','Olla de
carne','Hamburguesas']]).*/




% La informacion de que restaurantes tienen ciertas comidas tiene el
% siguiente formato:
% [(categoria),[(comidas disponibles)], [(nombre de los restaurantes
% que ofrecen)]]
%
% comida("",[],[]).



comida("rapida",["hamburguesa","papas fritas","sandwich"],[mcDonalds,subway]).
comida("tipica",["torilla de queso","olla de carne"],[balconCriollo,laTortilleria]).

/*menu(['hamburguesa',[mcDonalds, balconCriollo]]).
menu(['hamburguesas',[mcDonalds, balconCriollo]]).
menu(['tortilla',[laTortilleria, balconCriollo]]).
menu(['tortillas',[laTortilleria, balconCriollo]]).
menu(['sandwich',[subway, balconCriollo]]).*/




% La informacion sobre restaurantes que tienen ciertas bebidas tiene el
% siguiente formato:
% [(categoria),[(bebidas disponibles)], [(nombre de los restaurantes
% disponibles)]]
%
% bebida("",[],[]).


bebida("natural",["cas","fresa"],[balconCriollo,laTortilleria]).
bebida("caliente",["café","chocolate","agua dulce"],[balconCriollo , laTortilleria]).
bebida("gaseosa",["coca cola","sprite","fanta"],[mcDonalds,subway]).
bebida("coctel",["piña colada","margarita"],[balconCriollo]).
bebida("cerveza",["nacional","corona"],[balconCriollo]).




/*bebida(['coca cola',[mcDonalds, subway]]).
bebida(['natural',[laTortilleria, balconCriollo]]).
bebida(['cafe',[laTortilleria, balconCriollo, subway, mcDonalds]]).
bebida(['agua dulce',[laTortilleria, balconCriollo]]).
bebida(['cerveza',[balconCriollo]]).*/
