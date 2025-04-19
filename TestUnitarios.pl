:- consult('TP_Prolog.pl').

:-begin_tests(ejercicio1).


test('TipoArbustoRose') :- 
    sonDeTipoArbusto(rose).

test('LilyNOEsTipoArbusto',fail) :- 
    sonDeTipoArbusto(lily).

test('TipoArbustoInversible',  set(Planta == [rose])) :- 
     sonDeTipoArbusto(Planta).

test('RoseFloreceEnPrimavera', nondet):-
    florecenEnPrimavera(rose).

test('LilyNoFloreceEnPrimavera',fail):-
    florecenEnPrimavera(lily).

test('FloreceEnPrimaveraInversible',  set(Planta == [rose, tulip, orchid])) :- 
    florecenEnPrimavera(Planta).

test('LilynoesColorNegro',fail):-
    tieneColorEspecifico(lily, negro).

test('RoseColorRojo'):-
    tieneColorEspecifico(rose,rojo).

test('tieneColorEspecifico - Inversible por planta',  set(Planta == [rose, lily, tulip, sunflower, cactus, fern, orchid, bamboo, ivy])) :- 
    tieneColorEspecifico(Planta, _).

test('tieneColorEspecifico - inversible por color', set(Color == [rojo, blanco, amarillo, verdes, purple])):-
    tieneColorEspecifico(_, Color).

:-end_tests(ejercicio1).

:- begin_tests(ejercicio2).

test('TieneRiegoEspecial', fail) :- 
    riegoEspecial(_). 

test('RoseAtraeInsectosBeneficos', nondet):-
    atraenInsectosBeneficos(rose).

test('LilyNoAtraeInsectosBeneficos', fail):-
    atraenInsectosBeneficos(lily).

test('AtraenInsectosBeneficos', set(Planta == [rose, tulip, sunflower])):-
    atraenInsectosBeneficos(Planta).

test('cactusEsConsideradaAlta', nondet):-
    consideradaAlta(cactus).

test('orchidNoEsConsideradaAlta', fail):-
    consideradaAlta(orchid).

test('consideradaAlta - Inversible', set(Planta == [rose, cactus, fern, bamboo, ivy])) :- 
    consideradaAlta(Planta).

:- end_tests(ejercicio2).

:-begin_tests(ejercicio3).

test('lilyEsPlantaFlorYCorta', nondet):-
    conjuntoTipoFlorYCortas(Plantas), member(lily, Plantas).

test('roseNoEsPlantaFlorYCorta', fail):-
    conjuntoTipoFlorYCortas(Plantas), member(rose, Plantas).

test('conjuntoTipoFloryCortas - Inversible', true(Plantas == [lily, tulip, orchid])):-
    conjuntoTipoFlorYCortas(Plantas).

:-end_tests(ejercicio3).

:- begin_tests(ejercicio4).

test('arbol_rojoEsRose') :-
    tieneTodaslasCaracteristicas(rose, arbol_rojo).

test('arbol_rojoNoEsLily', fail) :-
    tieneTodaslasCaracteristicas(lily, arbol_rojo).

test('PlantasConTodasLasPistasDe_arbol_rojo') :-
    tieneTodaslasCaracteristicas(rose, arbol_rojo).

:- end_tests(ejercicio4).

:- begin_tests(ejercicio5).

test('RoseTieneMasVisitasQueBamboo', nondet) :-
    masVisitasCompanera(rose).

test('PlantasConMasVisitasQueSuCompanera', set(Planta == [fern, ivy, rose])) :-
    masVisitasCompanera(Planta).

:- end_tests(ejercicio5).
