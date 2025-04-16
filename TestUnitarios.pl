:- consult('TP_Prolog.pl').

:-begin_tests(ejercicio1).


test('TipoArbustoRose') :- 
    sonDeTipoArbusto(rose).

test('LilyNOEsTipoArbusto',fail) :- 
    sonDeTipoArbusto(lily).

test('TipoArbustoInversible',  set(Planta == [rose])) :- 
     sonDeTipoArbusto(Planta).

test('RoseFloreceEnPrimavera'):-
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

test('RoseAtraeInsectosBeneficos'):-
    atraenInsectosBeneficos(rose).

test('LilyNoAtraeInsectosBeneficos', fail):-
    atraenInsectosBeneficos(lily).

test('AtraenInsectosBeneficos', set(Planta == [rose, tulip, sunflower])):-
    atraenInsectosBeneficos(Planta).

test('cactusEsConsideradaAlta'):-
    consideradaAlta(cactus).

test('orchidNoEsConsideradaAlta', fail):-
    consideradaAlta(orchid).

test('consideradaAlta - Inversible', set(Planta == [rose, cactus, fern, bamboo, ivy])) :- 
    consideradaAlta(Planta).

:- end_tests(ejercicio2).

:-begin_tests(ejercicio3).

test('lilyEsPlantaFlorYCorta'):-
    conjuntoTipoFlorYCortas(Plantas), member(lily, Plantas).

test('roseNoEsPlantaFlorYCorta', fail):-
    conjuntoTipoFlorYCortas(Plantas), member(rose, Plantas).

test('conjuntoTipoFloryCortas - Inversible', true(Plantas == [lily, tulip, orchid])):-
    conjuntoTipoFlorYCortas(Plantas).

:-end_tests(ejercicio3).
