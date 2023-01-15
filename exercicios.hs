{-
Nicolau Pereira Alff - 00243667
Exercicios slides - Inaugural ERE

check com correcao -  if( == ) then "TA CERTO" else "TA ERRADO"
-}

{-
lstvezes LstNum Num -> LstNum

A função multiplica todos os elementos da lista de entrada pelo numero de entrada

lstvezes [1,2,3] 2 => [2,4,6]
lstvezes [1,2,3,6,19,43] 2 => [2,4,6,12,38,86]

-}

-- Forma1
lstvezes [] n = []
lstvezes lst n = (head lst) *n : (lstvezes (tail lst) n)

-- Forma2 Resolucao prof
lsvezes [] _ = []
lsvezes (h:t) n = h*n:lsvezes t n


{-
popLast Lista -> Lista

Retira o ultimo elemento de uma Lista

popLast [1,2,3] => [1,2]
popLast ['A','B','C'] => "AB" ; não retorna ['A','B']
popLast ["Ana", "Pedro", "Ze"] => ["Ana", "Pedro"]

-}

popLast [] = []

popLast (h:t) = if length t >= 1
              then h:popLast t
              else popLast t 

{-
invertelst Lista -> Lista

A funcao retorna a lista invertida

invertelst [1,2,3] => [3,2,1]
invertelst ["Ana", "Pedro", "Ze"] => ["Ze", "Pedro", "Ana"]
invertelst ['A','B','C'] => "CBA"  // ['C','B','A']
-}

invertelst [] = []
invertelst lst = last lst: invertelst (popLast lst)

-- Opcao 2 - resoluçao com append
invertels [] = []
invertels (h:t) = invertels t ++ [h]

{-
powlst ListaNum Num -> ListaNum

retorna uma lista com os elementos da lista original elevados ao numero recebido

powlst [1,2,3] 2 => [1,4,9]
powlst [5,8,7,9] 3 => [125,512,343,729]

powlstf [0.5,1,2.5,3.6] 2 => [0.25,1.0,6.25,12.96]
powlstf [5,8.5,7.3,9] 3 => [125.0,614.125,389.017,729.0]
-}

--INTEIRO--
powlst [] n = []
powlst (h:t) n = h^n:powlst t n

--FLOAT--
powlstf [] n = []
powlstf (h:t) n = h**n:powlstf t n

--Resolucao prof
powls [] _ = []
powls (h:t) x = h ^ x:powls t x