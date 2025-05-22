planta(rose, color(rojo)).
planta(rose, altura(media)).
planta(rose, epoca(floracion, primavera)).
planta(rose, tipo(arbusto)).
planta(lily, color(blanco)).
planta(lily, altura(corta)).
planta(lily, epoca(floracion, verano)).
planta(lily, tipo(flor)).
planta(tulip, color(amarillo)).
planta(tulip, altura(corta)).
planta(tulip, epoca(floracion, primavera)).
planta(tulip, tipo(flor)).
planta(sunflower, color(amarillo)).
planta(sunflower, altura(alta)).
planta(sunflower, epoca(floracion, verano)).
planta(sunflower, tipo(flor)).
planta(cactus, color(verdes)).
planta(cactus, altura(baja)).
planta(cactus, epoca(floracion, verano)).
planta(cactus, tipo(suculenta)).
planta(fern, color(verdes)).
planta(fern, altura(media)).
planta(fern, epoca(floracion, todo_el_ano)).
planta(fern, tipo(helecho)).
planta(orchid, color(purple)).
planta(orchid, altura(corta)).
planta(orchid, epoca(floracion, primavera)).
planta(orchid, tipo(flor)).
planta(bamboo, color(verdes)).
planta(bamboo, altura(alta)).
planta(bamboo, epoca(floracion, todo_el_ano)).
planta(bamboo, tipo(pasto)).
planta(ivy, color(verdes)).
planta(ivy, altura(media)).
planta(ivy, epoca(floracion, todo_el_ano)).
planta(ivy, tipo(plantas_enredaderas)).
plantas_companeras(rose, lily).
plantas_companeras(lily, rose).
plantas_companeras(tulip, sunflower).
plantas_companeras(sunflower, tulip).
plantas_companeras(cactus, fern).
plantas_companeras(fern, cactus).
plantas_companeras(orchid, ivy).
plantas_companeras(ivy, orchid).
plantas_companeras(bamboo, rose).
plantas_companeras(rose, bamboo).



/*
1) Queremos poder preguntar sobre nuestras plantas si:
1) Queremos poder preguntar sobre nuestras plantas si:
a. Son de tipo arbusto.
b. Florecen en primavera.
c. Tienen un color específico.
*/ 
sonDeTipoArbusto(Planta):-planta(Planta,tipo(arbusto)).
florecenEnPrimavera(Planta):-planta(Planta,epoca(floracion,primavera)).
florecenEnPrimavera(Planta):-planta(Planta,epoca(floracion,primavera)).
tieneColorEspecifico(Planta,Color):-planta(Planta,color(Color)).
/*
2) Sabemos que: 
2) Sabemos que: 
a. Las plantas que son arbustos y florecen en verano deben tener un sistema de riego especial. 
b. Las plantas rojas o amarillas atraen más insectos benéficos. 
c. Las plantas que no son de tipo flor son consideradas altas.
*/
riegoEspecial(Planta):-planta(Planta,epoca(floracion,verano)), planta(Planta, tipo(arbusto)).
atraenInsectosBeneficos(Planta):- planta(Planta,color(rojo)).
atraenInsectosBeneficos(Planta):- planta(Planta,color(amarillo)).
consideradaAlta(Planta):-planta(Planta,_),
not(planta(Planta,tipo(flor))).

/*
3) Se necesita conocer el conjunto de todas las plantas que son cortas y de tipo flor.
*/
conjuntoTipoFlorYCortas(Plantas):-
   planta(Planta,_),
    findall(Planta,
    ((planta(Planta,tipo(flor))),planta(Planta, altura(corta))),
    Plantas).
    
/*
4) Ahora debemos agregar las pistas obtenidas durante las observaciones. Por ejemplo:
Queremos relacionar una planta y un observador solo si todas las pistas que tiene el observador son características de la planta. 
En este punto no se puede usar findall.
*/
pista(arbol_rojo, tipo(arbusto)).
pista(arbol_rojo, altura(media)).

tieneTodaslasCaracteristicas(Planta,Observador):-    
    forall(pista(Observador,Caracteristica),planta(Planta,Caracteristica)).

/*
5) Finalmente, queremos saber si una planta está atrayendo más visitas que su compañera. 
Para ello, la cantidad de pistas que cumple debe ser mayor que la de las plantas compañeras.
*/

cantidadPistas(Planta, Cantidad) :-
    findall(Caracteristica, (pista(_, Caracteristica), planta(Planta, Caracteristica)), ListaCaracteristica),
    length(ListaCaracteristica, Cantidad).

masVisitasCompanera(Planta) :-
    plantas_companeras(Planta, Companera),
    cantidadPistas(Planta, Cant1),
    cantidadPistas(Companera, Cant2),
    Cant1>Cant2.

    /* Integrantes 
     Muraoka Tomas
     Franco  Rojas 
     Franco Manasserian 
     jonathan Cubilla
    */ 
