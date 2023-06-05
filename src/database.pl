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
    ['gaseosa','caliente'],
    'Cartago',
    '150 m sur del walmart de Caballo Blanco',
    ['Hamburguesa','Desayuno','Postre','Papas','Pollo'],
     '30',
     'Este es un restaurante para toda la familia, area de juego para ninnos']).


restaurante([
     'Balcon Criollo',
     'tipica',
     ['caliente','coctel','cerveza','natural'],
     'Cartago',
     'Diagonal a esquina Noroeste del Parque Central',
     ['Casado','Prensada','Mondongo','Tortilla'],
     '18',
     'Verdadera comida costarricense, los esperamos']).

restaurante([
    'KFC',
    'rapida',
    ['gaseosa','caliente'],
    'Cartago',
    'Diagonal al mercado central, Av. 6',
    ['Hamburguesa','Desayuno','Postre','Papas','Pollo'],
    '12',
    'El mejor pollo al mejor precio, aproveche']).

restaurante([
     'Il Palio',
     'italiana',
     ['coctel','gaseosa','natural'],
     'Cartago',
     '100 metros sur de la Basilica de los Angeles',
     ['Pizza','Spaghetti ','Lasagna','Gelato'],
     '10',
     'Coma sano, coma Italiano!']).
restaurante([
    'Wing Shun',
    'china',
    ['gaseosa','natural'],
    'Cartago',
    'Se encuentra en la avenida 3',
    ['Gyozas','Dumplings','Cantones','Tofu'],
    '25',
    'Somos una empresa familiar que busca ofrecer comida asiatica de calidad y un buen servicio.']).


% En Heredia:

restaurante([
    'Subway',
    'saludable',
    ['natural','caliente','gaseosa'],
    'Heredia',
    '500m oeste de la entrada principal del ITCR',
    ['Sandwich','Ensalada','Pasta','Falafel'],
    '20',
    'Pregunta por el sub del dia, un delicioso sandwich a buen precio']).

restaurante([
    'KFC',
    'rapida',
    ['gaseosa','caliente'],
    'Heredia',
    'Diagonal al mercado central, Av. 6',
    ['Hamburguesa','Desayuno','Postre','Papas','Pollo'],
    '12',
    'El mejor pollo al mejor precio, aproveche']).


restaurante([
     'La Dolce Vita',
     'italiana',
     ['coctel','gaseosa','natural'],
     'Heredia',
     '25 m. Este de la Casa Regional ANDE',
     ['Pizza','Spaghetti ','Lasagna','Gelato'],
     '10',
     'La mas autentica comida italiana a su alcance']).

restaurante([
     'Ragu',
     'italiana',
     ['caliente','gaseosa','natural'],
     'Heredia',
     '25 m. Este de la esquina Sureste de la Iglesia Catolica de Alajuela',
     ['Pizza','Spaghetti ','Lasagna','Gelato'],
     '12',
     'La mas famosa comida italiana para su deleite']).



% San Jose

restaurante([
     'Balcon Criollo',
     'tipica',
     ['caliente','coctel','cerveza','natural'],
     'Alajuela',
     'Diagonal a esquina Noroeste del Parque La Sabana',
     ['Casado','Prensada','Mondongo','Tortilla'],
     '15',
     'Verdadera comida costarricense, los esperamos']).


restaurante([
    'Cuchara Oriental',
    'china',
    ['gaseosa','natural'],
    'Alajuela',
    'Entre Av 16 y 14 sobre calle 11 Avenida Cleto Gonzalez Vazquez',
    ['Gyozas','Dumplings','Cantones','Tofu'],
    '35',
    'Le traemos los platillos mas exquisitos oriente hasta su mesa']).

restaurante([
    'Yong Xing',
    'china',
    ['gaseosa','cerveza'],
    'Alajuela',
    '100 mts oeste del Super Kion',
    ['Gyozas','Dumplings','Cantones','Tofu'],
    '20',
    'El sabor y legado de oriente traido hasta su mesa']).


restaurante([
    'Samadhi',
    'saludable',
    ['natural','caliente'],
    'Alajuela',
    'Calle 35, entre ave 5 Y 7, Barrio Escalante',
    ['Sandwich','Ensalada','Pasta','Falafel'],
    '11',
    'La mejor comida vegana de todo el pais']).


restaurante([
    'KFC',
    'rapida',
    ['gaseosa','caliente'],
    'Alajuela',
    'Diagonal al city mall',
    ['Hamburguesa','Desayuno','Postre','Papas','Pollo'],
    '12',
    'El mejor pollo al mejor precio, aproveche']).

restaurante([
     'Rancho Los Coyotes',
     'tipica',
     ['caliente','coctel','cerveza','natural'],
     'Alajuela',
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



comida(['rapida',['hamburguesa','papas','sandwich','postre','pollo'],['McDonalds', 'KFC']]).
comida(['tipica',['casado','prensada','mondongo','tortilla','chifrijo'],['Balcon Criollo', 'Rancho Los Coyotes']]).
comida(['saludable',['sandwich','ensalada','pasta','falafel'],['Samadhi', 'Subway']]).
comida(['italiana',['pizza','spaghetti ','lasagna','gelato','calzone'],['La Dolce Vita', 'Ragu','il palio']]).
comida(['china',['gyozas','dumplings','cantones','tofu'],['Wing Shun','Cuchara Oriental', 'Yong Xing']]).




% La informacion sobre restaurantes que tienen ciertas bebidas tiene el
% siguiente formato:
% [(categoria),[(bebidas disponibles)], [(nombre de los restaurantes disponibles)]]
%
% bebida(['',[],[]]).


bebida(['natural',['cas','fresa','limon','sandia'],['Balcon Criollo', 'Rancho Los Coyotes', 'Samadhi', 'Subway', 'Cuchara Oriental', 'Yong Xing', 'La Dolce Vita', 'Ragu']]).
bebida(['caliente',['cafe','chocolate','capuchino'],['Balcon Criollo', 'Rancho Los Coyotes', 'Cuchara Oriental', 'Yong Xing']]).
bebida(['gaseosa',['cocacola','sprite','fanta','fresca'],['McDonalds', 'KFC', 'Cuchara Oriental', 'Yong Xing', 'La Dolce Vita', 'Ragu']]).
bebida(['coctel',['martini','margarita','chilliguaro','mojito'],['Balcon Criollo', 'Rancho Los Coyotes', 'La Dolce Vita', 'Ragu']]).
bebida(['cerveza',['nacional','corona','heineken','guiness'],['Balcon Criollo', 'Rancho Los Coyotes']]).


% La informacion sobre los lugares disponibles en la base de datos
% siguiente formato:
% [(Lugar),[(Lugar en minuscula)], [(nombre de los restaurantes disponibles)]]

lugar(['Cartago',['cartago'],['McDonalds', 'Balcon Criollo', 'KFC']]).
lugar(['Alajuela',['alajuela'],['Balcon Criollo', 'Cuchara Oriental', 'Yong Xing', 'Samadhi', 'KFC', 'Rancho Los Coyotes']]).
lugar(['Heredia',['heredia'],['Subway', 'KFC', 'La Dolce Vita', 'Ragu']]).


