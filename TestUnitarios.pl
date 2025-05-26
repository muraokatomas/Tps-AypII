:- consult('TP_Prolog.pl').

:-begin_tests(ejercicio1).


test('TipoArbusto') :- 
    sonDeTipoArbusto(rose).

test('NOEsTipoArbusto',fail) :- 
    sonDeTipoArbusto(lily).

test('TipoArbustoInversible',  set(Planta == [rose])) :- 
     sonDeTipoArbusto(Planta).

test('FloreceEnPrimavera', nondet):-
    florecenEnPrimavera(rose).

test('NoFloreceEnPrimavera',fail):-
    florecenEnPrimavera(lily).

test('FloreceEnPrimaveraInversible',  set(Planta == [rose, tulip, orchid])) :- 
    florecenEnPrimavera(Planta).

test('NoesColorNegro',fail):-
    tieneColorEspecifico(lily, negro).

test('ColorRojo'):-
    tieneColorEspecifico(rose,rojo).

test('tieneColorEspecifico - Inversible por planta',  set(Planta == [rose, lily, tulip, sunflower, cactus, fern, orchid, bamboo, ivy])) :- 
    tieneColorEspecifico(Planta, _).

test('tieneColorEspecifico - inversible por color', set(Color == [rojo, blanco, amarillo, verdes, purple])):-
    tieneColorEspecifico(_, Color).

:-end_tests(ejercicio1).

:- begin_tests(ejercicio2).

test('NoTieneRiegoEspecial', fail) :- 
    planta(_,riego(especial)). 

test('AtraeInsectosBeneficos', nondet):-
    planta(rose, atraeInsectos(beneficiosos)).

test('NoAtraeInsectosBeneficos', fail):-
    planta(lily, atraeInsectos(beneficiosos)).

test('AtraenInsectosBeneficos', set(Planta == [rose, tulip, sunflower])):-
    planta(Planta, atraeInsectos(beneficiosos)).

test('EsConsideradaAlta', nondet):-
    planta(cactus, alturaAlta(alta)).

test('NoEsConsideradaAlta', fail):-
    planta(orchid, alturaAlta(alta)).

test('consideradaAlta - Inversible', set(Planta == [rose, cactus, fern, bamboo, ivy])) :- 
    planta(Planta, alturaAlta(alta)).

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

test('Esarbol_rojo') :-
    tieneTodaslasCaracteristicas(rose, arbol_rojo).

test('NoEsarbol_rojo', fail) :-
    tieneTodaslasCaracteristicas(lily, arbol_rojo).

test('PlantasConTodasLasPistasDe_arbol_rojo') :-
    tieneTodaslasCaracteristicas(rose, arbol_rojo).

:- end_tests(ejercicio4).

:- begin_tests(ejercicio5).

test('TieneMasVisitasQueCompanera', nondet) :-
    masVisitasCompanera(rose).

test('PlantasConMasVisitasQueSuCompanera', set(Planta == [fern, ivy, rose])) :-
    masVisitasCompanera(Planta).

:- end_tests(ejercicio5).
