% La informacion individual del restaurante tiene el siguiente formato:
% [([nombre del restaurante]), (tipo de comida), ([provincia, canton]),
% (direccion), ([menu disponible]),(capacidad),(disposiciones)]
%
%
% restaurante([[],'','','',[],'','']).

% En cartago:
restaurante([
    'McDonalds',
    'rapida',
    'gaseosa',
    'Cartago',
    '150 m sur del walmart de caballo blanco',
    ['Hamburguesa','Desayuno','Postre','Papas'],
     '30',
     'Este es un restaurante para toda la familia, area de juego para niños']).


restaurante([
     'Balcon Criollo',
     'tipica',
     'caliente',
     'Cartago',
     'Diagonal a esquina Noroeste del Parque Central de Cartago',
     ['Casado','Prensada','Mondongo','Tortilla'],
     '18',
     'Verdadera comida costarricense, los esperamos']).

restaurante([
    'KFC',
    'rapida',
    'gaseosa',
    'Cartago',
    'diagonal al mercado central, Av. 6',
    ['Hamburguesa','Desayuno','Postre','Papas'],
    '12',
    'El mejor pollo al mejor precio, aproveche']).

restaurante([
     'Il Palio',
     'italiana',
     'coctel',
     'Cartago',
     '100 metros sur de la Basílica de los ángeles',
     ['Pizza','Spaghetti ','Lasagna','Gelato'],
     '10',
     '¡Coma sano, coma Italiano!']).
restaurante([
    'Wing Shun',
    'china',
    'gaseosa',
    'Cartago',
    'Se encuentra en la avenida 3',
    ['Gyozas','Dumplings','Cantones','Tofu'],
    '25',
    'Somos una empresa familiar que busca ofrecer comida asiática de calidad y un buen servicio.']).


% En Heredia:

restaurante([
    'Subway',
    'saludable',
    'natural',
    'Heredia',
    '500m oeste de la entrada principal del ITCR',
    ['Sandwich','Ensalada','Pasta','Falafel'],
    '20',
    'Pregunta por el sub del dia, un delicioso sandwich a buen precio']).

restaurante([
    'KFC',
    'rapida',
    'gaseosa',
    'Heredia',
    'diagonal al mercado central, Av. 6',
    ['Hamburguesa','Desayuno','Postre','Papas'],
    '12',
    'El mejor pollo al mejor precio, aproveche']).


restaurante([
     'La Dolce Vita',
     'italiana',
     'coctel',
     'Heredia',
     '25 m. Este de la Casa Regional ANDE',
     ['Pizza','Spaghetti ','Lasagna','Gelato'],
     '10',
     'La mas autentica comida italiana a su alcance']).

restaurante([
     'Ragu',
     'italiana',
     'coctel',
     'Heredia',
     '25 m. Este de la esquina Sureste de la Iglesia Catolica de Alajuela',
     ['Pizza','Spaghetti ','Lasagna','Gelato'],
     '12',
     'La mas famosa comida italiana para su deleite']).



% San Jose

restaurante([
     'Balcon Criollo',
     'tipica',
     'caliente',
     'SanJose',
     'Diagonal a esquina Noroeste del Parque La Sabana',
     ['Casado','Prensada','Mondongo','Tortilla'],
     '15',
     'Verdadera comida costarricense, los esperamos']).


restaurante([
    'Cuchara Oriental',
    'china',
    'gaseosa',
    'SanJose',
    'entre Av 16 y 14 sobre calle 11 Avenida Cleto González Víquez',
    ['Gyozas','Dumplings','Cantones','Tofu'],
    '35',
    'Le traemos los platillos mas exquisitos oriente hasta su mesa']).

restaurante([
    'Yong Xing',
    'china',
    'gaseosa',
    'SanJose',
    '100 mts oeste del Super Kion',
    ['Gyozas','Dumplings','Cantones','Tofu'],
    '20',
    'El sabor y legado de oriente traido hasta su mesa']).


restaurante([
    'Samadhi',
    'saludable',
    'natural',
    'SanJose',
    'Calle 35, entre ave 5 Y 7, Barrio Escalante',
    ['Sandwich','Ensalada','Pasta','Falafel'],
    '11',
    'La mejor comida vegana de todo el pais']).


restaurante([
    'KFC',
    'rapida',
    'gaseosa',
    'SanJose',
    'diagonal al mercado central, Av. 6',
    ['Hamburguesa','Desayuno','Postre','Papas'],
    '12',
    'El mejor pollo al mejor precio, aproveche']).

restaurante([
     'Rancho Los Coyotes',
     'tipica',
     'caliente',
     'SanJose',
     '1.6 km al oeste, 100 m al sur del Parque Republica del Peru',
     ['Casado','Prensada','Mondongo','Tortilla'],
     '6',
     'Verdadera comida guanacasteca, los esperamos']).


% La informacion de que restaurantes tienen ciertas comidas tiene el
% siguiente formato:
% [(categoria),[(comidas disponibles)], [(nombre de los restaurantes
% que ofrecen)]]
%
% comida(['',[],[]]).



comida(['rapida',['hamburguesa','papas','sandwich','postre'],['McDonalds', 'KFC']]).
comida(['tipica',['casado','prensada','mondongo','tortilla'],['Balcon Criollo', 'Rancho Los Coyotes']]).
comida(['saludable',['sandwich','ensalada','pasta','falafel'],['Samadhi', 'Subway']]).
comida(['italiana',['pizza','spaghetti ','lasagna','gelato'],['La Dolce Vita', 'Ragu']]).
comida(['china',['gyozas','dumplings','cantones','tofu'],['Cuchara Oriental', 'Yong Xing']]).




% La informacion sobre restaurantes que tienen ciertas bebidas tiene el
% siguiente formato:
% [(categoria),[(bebidas disponibles)], [(nombre de los restaurantes
% disponibles)]]
%
% bebida(['',[],[]]).


bebida(['natural',['cas','fresa'],['Balcon Criollo', 'Rancho Los Coyotes', 'Samadhi', 'Subway', 'Cuchara Oriental', 'Yong Xing', 'La Dolce Vita', 'Ragu']]).
bebida(['caliente',['café','chocolate','agua dulce'],['Balcon Criollo', 'Rancho Los Coyotes', 'Cuchara Oriental', 'Yong Xing']]).
bebida(['gaseosa',['cocacola','sprite','fanta'],['McDonalds', 'KFC', 'Cuchara Oriental', 'Yong Xing', 'La Dolce Vita', 'Ragu']]).
bebida(['coctel',['piñacolada','margarita'],['Balcon Criollo', 'Rancho Los Coyotes', 'La Dolce Vita', 'Ragu']]).
bebida(['cerveza',['nacional','corona'],['Balcon Criollo', 'Rancho Los Coyotes']]).





lugar(['Cartago',['cartago'],['McDonalds', 'Balcon Criollo', 'KFC']]).
%lugar(['cartago',['McDonalds', 'Balcon Criollo', 'KFC']]).
lugar(['SanJose',['sanjose'],['Balcon Criollo', 'Cuchara Oriental', 'Yong Xing', 'Samadhi', 'KFC', 'Rancho Los Coyotes']]).
% lugar(['sanjose',['Balcon Criollo', 'Cuchara Oriental', 'Yong Xing',
% 'Samadhi', 'KFC', 'Rancho Los Coyotes']]).
lugar(['Heredia',['heredia'],['Subway', 'KFC', 'La Dolce Vita', 'Ragu']]).
%lugar([,['Subway', 'KFC', 'La Dolce Vita', 'Ragu']]).

