
-- punto 1
-- Cada robot tiene un identificador (nombre), un nivel de experiencia, una cantidad de energía y un conjunto de programas (software).
-- A través de estos programas, un robot puede modificar las capacidades de otros robots.

data Robot = Robot {
    nombre::String,
    xp::Int,
    energia::Int,
    programas::[Programa]    
} deriving Show

-- recargarBateria: Este programa recibe un robot y lo recarga, aumentando su energía en una cantidad variable.
recargarBateria::Int -> Robot -> Robot
recargarBateria  recarga robot = robot { energia = energia robot + recarga }

-- descargaElectrica: Este programa causa una reducción de energía al robot objetivo: si su energía es mayor a 10, le quita 10 puntos;
--  en caso contrario, reduce su energía a la mitad.
descargaElectrica :: Robot -> Robot
descargaElectrica robot
                         | energia robot > 10 = robot { energia = energia robot - 10 }
                         | otherwise          = robot { energia = energia robot `div` 2 }


-- olvidarProgramas: Hace que el robot que lo recibe olvide los primeros N programas que conoce.
olvidarProgramas::   Robot ->Int -> Robot
olvidarProgramas robot n  = robot {programas = drop n (programas robot) }

-- autoAtaque: El robot objetivo se ataca a sí mismo usando su primer programa registrado. Lanzar error si no tiene ningún programa.
autoAtaque::Programa
autoAtaque  robot  


-- punto 2 (2)
poder :: Robot -> Int
-- Calcula la fuerza de un robot sumando su energía más el producto de su nivel de experiencia por la cantidad de programas que tiene.

daño :: Robot -> Programa -> Int
-- Calcula cuánta energía se pierde o gana al aplicar un programa a un robot. La ganancia se indica con un número negativo. La función retorna 0 si no hay cambio.

diferenciaDePoder :: Robot -> Robot -> Int
-- La diferencia absoluta en poder entre dos robots

-- punto 3
type Academia = [Robot]

-- Representa un conjunto de robots en una organización.
-- ¿Existe en la academia algún robot llamado "Atlas" que actualmente no tenga programas en su software?
-- ¿Todos los robots viejos (con experiencia mayor a 16) son considerados "obstinados", esto es, que tengan más programas que el triple de su nivel de experiencia?

-- punto 4 
-- f x [y] = y
-- f x (y1:y2:ys)
--       | x y1 >= x y2 = f x (y1:ys)
--      | otherwise = f x (y2 : ys)
-- Explica brevemente cuál es su propósito, define su tipo y presenta una versión que sea más expresiva en el paradigma funcional.
-- Sin definir funciones auxiliares, construye las siguientes:

mejorProgramaContra :: Robot -> Robot -> Programa
--Elige el programa del segundo robot que cause mayor reducción de energía al primero.

mejorOponente :: Robot -> Academia -> Robot
-- Encuentra el robot con la mayor diferencia de poder respecto al robot recibido.




-- punto 5
-- Implementación sin recursividad:
-- Implementa la función
noPuedeDerrotarle :: Robot -> Robot -> Bool
--La condición es que, tras aplicar todos los programas que conoce al segundo robot, la energía del primero quede igual que antes, sin necesidad de usar recursividad.