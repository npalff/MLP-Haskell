{-
==== Pattern Matching ====
Permitem sobrecarga (overload) de funções
  fat 0 = 1
  fat 1 = 1
  fat n = n * fat (n-1)



-}
fat 0 = 1
fat 1 = 1 -- Definições superiores BEM especificas
fat n = n * fat (n-1) -- o mais genérico sendo o último para evitar de rodar essa função antes das outras

past "run" = "ran"
past "swim" = "swam"
past "hit"= "hit"
past word = word++"ed"

-- Padrões sintáticos --
tamLst [] = 0 -- [] lista vazia
tamLst (_:t) = 1 + (tamLst t) -- Máscara -> _ , ocupa uma posição da variavel q não vai ser utilizada

{-
==== Guards ====
Guarda -> |

É o "Switch-case" do Haskell
-}

tipoletra l
  | l >= 'a' && l <= 'z' = "minuscula" -- Deve ser identado!!!
  | l >= 'A' && l <= 'Z' = "maiuscula" -- ATENCAO PARA A IDENTACAO
  |otherwise             = "Nao eh ASCII!"


calcIMC peso altura
  | imc <= 18.5 = "Abaixo do peso  - IMC: " ++ show imc   -- Show usado para mostrar um Num em String
  | imc <= 25.0 = "Supostamente normal  - IMC: " ++ show imc
  | imc <= 30.0 = "Acima do peso  - IMC: " ++ show imc
  | otherwise = "Com problemas  - IMC: " ++ show imc
  where imc = peso / (altura^2) -- WHERE usado para calcular a variavel, sendo DEFINIDA neste ponto

{-
==== Case Expressions ====
-}
descreve lst = "a lista eh " ++ case lst of
  [] -> "vazia" -- CUIDAR IDENTACAO TAMBEM
  [x] -> "de um unico elemento"
  lst -> "de varios elementos"


{-
==== Currying ====
Transformar em função parciais

soma2 x y = x+y ---> soma2 = (\x -> (\y = x+y))

- a função é transformada em múltiplas funções parcialmente substituidas (uma para cada parametro).
- uma maneira de gerar funções intermediarias que aceitam parametros adicionais para completar um calculo

- REUSO de funções
- avaliação tardia
- funções como parametro



-}
soma2 x y = x+y
soma3 x = soma2 x 3
soma4 y = soma2 4 y

soma x y = x + y
inc = soma 1

{-
==== Funções de ordem superior ====

- Funções que recebem e manipulam funções

- Mais comuns:
  -- Aplicação multipla (apply to all)
      map -- aplica uma função a uma lista de elementos
          foo1 x = x * x
          folist = map foo1 [2,3,5]
                    => [foo1 2, foo1 3, foo1 5]
                    => [4,9,25]
      apply - Aplicar diversas funções a um mesmo parametro
          applyAll [] _ = [] --criterio de parada
          applyAll (f:xs) n = (f n):applyAll xs n
          resApAll = applyAll [f1,f2,f3,f4] 4
                            => [f1 4 ,f2 4 ,f3 4 ,f4 4]
                            => [8,16,16,256]
      sum*
      zip*
      
  -- Redução
    foldr/foldl - combinam 2 a 3 os elementos de uma lista
        foldr (+) 0 [1,2,3]
                => (3+(2+(1+0)))
                => 6
        foldl (+) 0 [1,2,3]
              => (1+(2+(3+0)))
              => 6
  
  -- Composição
  -- Construção

-}

-- =========  APLICAÇÃO MULTIPLA =================
--             (apply to all)
-- ======= MAP =======

foo1 x = x*x
folist lst = map foo1 lst

f1 x = x+x
f2 x = x*x
f3 x = x^2
f4 x = x^x

ls1 = [1,2,3,4]
ls2 = [3,2,4,5]
                    -- > Resultados obtidos a partir de ls1 [1,2,3,4]
rMap1 lst = map f1 lst -- > [2,4,6,8]
rMap2 lst = map f2 lst -- > [1,4,9,16]
rMap3 lst = map f3 lst -- > [1,4,9,16]
rMap4 lst = map f4 lst -- > [1,4,27,256]

fnSemNome = map (\x->x*x) [2,3,4] -- => [4,9,16]
-- map muito utilizado em situações com funções lambda

-- ======= APPLY ALL =======
-- applyAll ListaFunc <parametro> => Lista de Resultados 
applyAll [] _ = [] --criterio de parada
applyAll (f:xs) n = (f n):applyAll xs n

lsFn = [f1,f2,f3,f4]
rAppAll lstFn n = applyAll lstFn n --chamada em aberto para receber dados de usuario

-- rAppAll lsFn 5 => [10,25,25,3125]


resApAll = applyAll [f1,f2,f3,f4] 4 -- => [8,16,16,256]

-- ======= OUTRAS =======
{-
sum [1,2,3,4,5] => 15 ; sum retorna a soma da lista

=== ZIP ===
zip - combina 2 a 2 em pares ordenados
    - IMPORTANTE: as listas devem ter o mesmo tamanho
  zip [11,12,13,14] [21,22,23,24] => [(11,21),(12,22),(13,23),(14,24)]
    - Se não tiverem o algoritmo irá considerar o tamanho da menor 
  zip [11,12,13,14] [21,22,23] => [(11,21),(12,22),(13,23)]

Util para compactar:
map (\(x,y) -> x*y) (zip [1,2,3,4][1,2,3,4])  => [1,4,9,16]
map (\(x,y) -> 2*x*y) (zip [1,2,3,4][1,2,3,4]) => [2,8,18,32]

produto cartesiano:
sum (map (\(x,y) -> x*y) (zip [1,2,3,4][1,2,3,4])) => 30

!!!! Cuidado com parentesis pois as funções são elementos de primeira ordem

$ -> aplicação da função da esquerda após o resultado a direita
-} 

{-
-- =========  REDUÇÃO =================
-- === FOLD ===
        -- R -> a direita
        -- L -> a esquerda
foldr (&&) True [False,True,5==5,4<5] -- > False

foldr max 1 [10,5,6,2]
foldr min 1000 [10,5,6,2]

-- CUIDADO com operações q a ordem importa
foldl (/) 1 [2,1] => 0.5
foldr (/) 1 [2,1] => 2.0

-}

-- Composição
-- Construção


{-
==== List Compreensions ====
Definem listas utilizando expressões matemáticas

[x*2 | x <- [1..10]] => [2,4,6,8,10,12,14,16,18,20]
[x*y | x <- [2,5,10], y <- [8,10,11] ] --multipl. de todos por todos
                                => [16,20,22,40,50,55,80,100,110]

Funcionam com filtros
[x*2 | x <- [1..10], x>5]=> [12,14,16,18,20]
[x*2 | x <- [1..10], x*2>5] => [6,8,10,12,14,16,18,20]

length' lst = sum [1 | _ <- lst]

-}

fnMaluca = [(x,y) | x <- [0..25] , y <- [(2*z)+3 | z <- [0..25]] , (2*x)+3 == y]

--fnMaluca => [(0,3),(1,5),(2,7),(3,9),(4,11),(5,13),(6,15),(7,17),(8,19),(9,21),(10,23),(11,25),(12,27),(13,29),(14,31),(15,33),(16,35),(17,37),(18,39),(19,41),(20,43),(21,45),(22,47),(23,49),(24,51),(25,53)]

fnMaluca2 = [(x,y) | x <- [0..25] , y <- [(2*z)+3 | z <- [0..25]] , (2*x)+3 == y, y >= 4 && y<=15]

-- fnMaluca2 => [(1,5),(2,7),(3,9),(4,11),(5,13),(6,15)]

fnMaluca3 = [x | x <- [0.1..2.1]] -- => [0.1,1.1,2.1]

tamanhoLista lst = sum [1 | _ <- lst]
-- => Cria uma lista de 1's do tamanho da lista original


-- JA DEFINIDA ls1 = [1,2,3,4]; ls2 = [3,2,4,5]

produto1 ls1 ls2 = sum [x*y| (x,y) <- zip ls1 ls2]
-- produto1 ls1 ls2 => [(1,3),(2,2),(3,4),(4,5)]
--                  => [1*3 , 2*2 , 3*4 , 4*5]
--                  => sum [3,4,12,20]
--                  => 39


{-
==== Infinite Streams ====
Técnica de definir funções enquanto eu precisar de um elemento ele calcula (com avaliação tardia)

-}

-- lista!!n recupera o elemento n da lista
-- a lista de pares é construida no WHERE
  -- -- inicia no 0 e vai construindo com a função map

--enésimo número par:
par n = pares!!n where pares = 0:map (+2) pares
-- par 15 => 30

-- take n-> retorna uma lista de tamanho neste
-- construida da mesma forma 


-- devolve os n primeiros num pares
par2 n = take n pares where pares = 0:map (+2) pares
-- pares 15 => [0,2,4,6,8,10,12,14,16,18,20,22,24,26,28]

pares = 0:map (+2) pares
par3 n k = if n == k
           then []
           else pares!!n:(par1 (n+1) k)