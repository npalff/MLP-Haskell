{-

(\x -> \y -> x+y) 2 3 => 5

porém pode-se fazer uma função intermediaria

let f = (\x -> \y -> x+y) 2
a partir desse ponto x já está definido como 2; a partir desse ponto pode-se utilizar < f Num > para fazer essa soma

f 2 => 4
f 4 => 6

let g =(\y -> \x -> x/y) 2  -> g se transformou numa divisão por 2

(\(x,y) -> x/y) (2,4) => 0.5
Atenção que é uma tupla não 2 elementos!

== CONSTRUTURES DE LISTAS ==
: ->      elemento mais a direita DEVE ser uma lista
          elementos a esquerda devem ser elementos
    1:2:3:[1,2,3] => [1,2,3,1,2,3]
    'a':['b'] => "ab"

    Num:<...>:ListaNum

++  -> APPEND de LISTAS
      <Lista> ++ <Lista>

      [2,3,6]++[4,7,8] => [2,3,6,4,7,8]
      ['a','m']++['a'] => "ama"
      ['a','m']++"a" => "ama"
      "ama"++"nha" => "amanha"

==== END =====

Para agrupar comando na linha de comando usar { } 

{ fatorial 0 = 1 ; fatorial n = n * fatorial (n-1) } 
  fatorial 5 => 120
  fatorial 3 => 6
  fatorial 19 => 121645100408832000

{ lstvezes [] _ = [] ; lstvezes (h:t) n = (h*n):(lstvezes t n)}
  lstvezes [1,2,3] 5 => [5,10,15]


-}