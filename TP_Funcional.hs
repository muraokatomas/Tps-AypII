
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
olvidarProgramas robot programasOlvidado  = robot {programas = drop programasOlvidado (programas robot) }

-- autoAtaque: El robot objetivo se ataca a sí mismo usando su primer programa registrado. Lanzar error si no tiene ningún programa.
autoAtaque::Programa
autoAtaque robot = head (programas robot) robot
-- punto 2 (2)
-- Calcula la fuerza de un robot sumando su energía más el producto de su nivel de experiencia por la cantidad de programas que tiene.
poder :: Robot -> Int
poder robot = energia robot + xp robot * length (programas robot)

-- Calcula cuánta energía se pierde o gana al aplicar un programa a un robot. La ganancia se indica con un número negativo. La función retorna 0 si no hay cambio.
daño :: Robot -> Programa -> Int
daño robot programa = energia robot - energia (programa robot)

-- La diferencia absoluta en poder entre dos robots
diferenciaDePoder :: Robot -> Robot -> Int
diferenciaDePoder robot1 robot2 = abs (poder robot1 - poder robot2)

-- punto 3
type Academia = [Robot]

-- Representa un conjunto de robots en una organización.
-- ¿Existe en la academia algún robot llamado "Atlas" que actualmente no tenga programas en su software?
atlasSinProgramas :: Academia -> Bool
atlasSinProgramas academia = any (\robot -> length (programas robot) == 0 && nombre robot == "Atlas") academia
-- ¿Todos los robots viejos (con experiencia mayor a 16) son considerados "obstinados", esto es, que tengan más programas que el triple de su nivel de experiencia?
robotViejo :: Robot -> Bool
robotViejo robot = xp robot > 16

robotObstinado :: Robot -> Bool
robotObstinado robot = length (programas robot) > 3 * xp robot

robotsViejosObstinados :: Academia -> Bool
robotsViejosObstinados academia = all robotObstinado (filter robotViejo academia)

-- punto 4 
-- f x [y] = y
-- f x (y1:y2:ys)
--       | x y1 >= x y2 = f x (y1:ys)
--      | otherwise = f x (y2 : ys)
-- Explica brevemente cuál es su propósito, define su tipo y presenta una versión que sea más expresiva en el paradigma funcional.
-- Sin definir funciones auxiliares, construye las siguientes:

{- Esta función sirve para encontrar el elemento mayor según una función de comparación.
Por ejemplo, f length ["a", "abc", "ab"] devuelve "abc" porque tiene más letras.
Podemos mejorar los nombres para mayor claridad. -}

mayorSegun :: Ord b => (a -> b) -> [a] -> a
mayorSegun fComparacion [x] = x
mayorSegun fComparacion (x1:x2:xs)
  | fComparacion x1 >= fComparacion x2 = mayorSegun fComparacion (x1:xs)
  | otherwise                          = mayorSegun fComparacion (x2:xs)



--Elige el programa del segundo robot que cause mayor reducción de energía al primero.
mejorProgramaContra :: Robot -> Robot -> Programa
mejorProgramaContra victima atacante = mayorSegun (daño victima) (programas atacante)


-- Encuentra el robot con la mayor diferencia de poder respecto al robot recibido.
mejorOponente :: Robot -> Academia -> Robot
mejorOponente robot academia = mayorSegun (diferenciaDePoder robot) academia


-- punto 5
-- Implementación sin recursividad:
-- Implementa la función
noPuedeDerrotarle :: Robot -> Robot -> Bool
--La condición es que, tras aplicar todos los programas que conoce al segundo robot, la energía del primero quede igual que antes, sin necesidad de usar recursividad.
