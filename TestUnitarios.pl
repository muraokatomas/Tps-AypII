:- consult('TP_Prolog.pl').

:-begin_tests(ejercicio1).


test('TipoArbustoRose') :- 
    sonDeTipoArbusto(rose).

test('NOEsTipoArbusto',fail) :- 
    sonDeTipoArbusto(lily).

test('TipoArbustoInversible',  set(Planta == [rose])) :- 
     sonDeTipoArbusto(Planta).

test('PlanteQueFloreceEnPrimavera', nondet):-
    florecenEnPrimavera(rose).

test('NoFloreceEnPrimavera',fail):-
    florecenEnPrimavera(lily).

test('FloreceEnPrimaveraInversible',  set(Planta == [rose, tulip, orchid])) :- 
    florecenEnPrimavera(Planta).

test('NoEsColorNegro',fail):-
    tieneColorEspecifico(lily, negro).

test('PlantaColorRojo'):-
    tieneColorEspecifico(rose,rojo).

test('tieneColorEspecifico - Inversible por planta',  set(Planta == [rose, lily, tulip, sunflower, cactus, fern, orchid, bamboo, ivy])) :- 
    tieneColorEspecifico(Planta, _).

test('tieneColorEspecifico - inversible por color', set(Color == [rojo, blanco, amarillo, verdes, purple])):-
    tieneColorEspecifico(_, Color).

:-end_tests(ejercicio1).

:- begin_tests(ejercicio2).

test('TieneRiegoEspecial', fail) :- 
    riegoEspecial(_). 

test('PlantaQueAtraeInsectosBeneficos', nondet):-
    atraenInsectosBeneficos(rose).

test('PlantaQueNoAtraeInsectosBeneficos', fail):-
    atraenInsectosBeneficos(lily).

test('AtraenInsectosBeneficos', set(Planta == [rose, tulip, sunflower])):-
    atraenInsectosBeneficos(Planta).

test('PlantaQueEsConsideradaAlta', nondet):-
    consideradaAlta(cactus).

test('PlantaQueNoEsConsideradaAlta', fail):-
    consideradaAlta(orchid).

test('consideradaAlta - Inversible', set(Planta == [rose, cactus, fern, bamboo, ivy])) :- 
    consideradaAlta(Planta).

:- end_tests(ejercicio2).

:-begin_tests(ejercicio3).

test('EsPlantaFlorYCorta', nondet):-
    conjuntoTipoFlorYCortas(Plantas), member(lily, Plantas).

test('NoEsPlantaFlorYCorta', fail):-
    conjuntoTipoFlorYCortas(Plantas), member(rose, Plantas).

test('conjuntoTipoFloryCortas - Inversible', true(Plantas == [lily, tulip, orchid])):-
    conjuntoTipoFlorYCortas(Plantas).

:-end_tests(ejercicio3).

:- begin_tests(ejercicio4).

test('PlantaQueTieneTodasLasCaracteristicas') :-
    tieneTodaslasCaracteristicas(rose, arbol_rojo).

test('PlantaQueNoTieneTodasLasCaracteristicas', fail) :-
    tieneTodaslasCaracteristicas(lily, arbol_rojo).

:- end_tests(ejercicio4).

:- begin_tests(ejercicio5).

test('PlantaQueTieneMasVisitasQueCompanera', nondet) :-
    masVisitasCompanera(rose).

test('PlantasConMasVisitasQueSuCompaneraInversible', set(Planta == [fern, ivy, rose])) :-
    masVisitasCompanera(Planta).

:- end_tests(ejercicio5).
