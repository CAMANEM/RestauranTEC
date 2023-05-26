% La informacion individual del restaurante tiene el siguiente formato:
% [([nombre del restaurante]), (tipo de comida), ([provincia, canton]),
% (direccion), ([menu disponible])]

% En cartago:
restaurante([[mcDonalds,'McDonalds'], rapida, ['Cartago','Caballo Blanco'],'150 m sur del walmart de caballo blanco',['BigMac','Cuarto de libra','Pollo Bacon','Papas fritas']]).
restaurante([[subway,'Subway'], rapida,['Cartago','Oriental'],'500m oeste de la entrada principal del ITCR',['Jamon de pavo','Pollo teriyaki','Italiano B.M.T.','Desayuno completo']]).
restaurante([[laTortilleria,'La Tortilleria'] , tipica ,['Cartago','Cartago'],'175m oeste de la Basilica de Los Angeles',['Pintortilla con cafe','Torticasado','Tortilla de Queso','Chorreadas']]).
restaurante([[balconCriollo,'Balcon Criollo'] ,tipica ,['Cartago','Cartago'],'Costado este de la municipalidad enavenida central de Cartago',['Chifrijo','Casados','Olla de carne','Hamburguesas']]).




% La informacion de que restaurantes tienen ciertas comidas tiene el
% siguiente formato:
% [(tipo de comida), [(nombre de los restaurantes disponibles)]]


menu(['hamburguesa',[mcDonalds, balconCriollo]]).
menu(['hamburguesas',[mcDonalds, balconCriollo]]).
menu(['tortilla',[laTortilleria, balconCriollo]]).
menu(['tortillas',[laTortilleria, balconCriollo]]).
menu(['sandwich',[subway, balconCriollo]]).




% La informacion de que restaurantes tienen ciertas bebidas tiene el
% siguiente formato:
% [(bebida), [(nombre de los restaurantes disponibles)]]

bebida(['coca cola',[mcDonalds, subway]]).
bebida(['natural',[laTortilleria, balconCriollo]]).
bebida(['cafe',[laTortilleria, balconCriollo, subway, mcDonalds]]).
bebida(['agua dulce',[laTortilleria, balconCriollo]]).
bebida(['cerveza',[balconCriollo]]).
