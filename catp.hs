{-
Nicolau Pereira Alff - 00243667
CATP 03
-}

{-    == QUESTÃO 01 ==
Elabore a função 'pertenceLst', que receba um número e uma lista de números. Usando recursão, a função devolve 'true' se o número encontra-se na lista ou 'false' se ele não se encontra nela.

-}

{-
pertenceLst ListaNum Num -> Booleano

A funcao retorna True se o número existir na lista

pertenceLst [1,2,3,4,5,9,15,19,17] 17 => True
pertenceLst [1,2,3,4,5,9,15,19,17] 39 => False
pertenceLst [1,2,3,4,5,9,15,19,17] 19.0 => True
pertenceLst [1,2,3,4,5,9,15,19,17] 19.1 => False

pertenceLst [1,2,3,4.5] 4.5 => True
pertenceLst [1,2,3,4.5] 3.0 => True
pertenceLst [1,2,3,4.5] 4.2 => False

-}

pertenceLst [] n = False
pertenceLst (h:t) n = if h == n
                      then True
                      else pertenceLst t n




{-    == QUESTÃO 02 ==
Elabore a função denominada 'ocorrencias', que recebe um número e uma lista de números. Usando recursção, a função devolve o número de ocorrências (i.e., quantidade) do número na lista. 

-}

{-
ocorrencias Num ListaNum -> Num

A função devolve o número de ocorrências (i.e., quantidade) do número na lista.

ocorrencias 2 [1,2,3,4,2,2,2] => 4
ocorrencias 19 [1,2,3] => 0
ocorrencias 19.0 [19,2,3,19] => 2
ocorrencias 19 [19,19.0,19.1,19.2] => 2
-}
ocorrencias n [] = 0
ocorrencias n (h:t) = if n==h
                      then 1+ocorrencias n t
                      else ocorrencias n t




{-    == QUESTÃO 03 ==
Usando 'foldl' ou 'foldr', elabore a função 'somatorio', que recebe uma lista de números reais e devolve a soma dos números da lista. 

P.ex.: somatorio[1.0, 2.2, 4.0] --> 7.2

-}

{-
somatorio ListaNum -> Num

 recebe uma lista de números reais e devolve a soma dos números da lista. 

somatorio [1.0, 2.2, 4.0] => 7.2
somatorio [1,5,8,9,19] => 42
somatorio [1,5,8,9.5,19.5] => 43.0
somatorio [15.3,19.25,14.3,25.3] => 74.15
-}

somatorio lst = foldr (+) 0 lst


{-    == QUESTÃO 04 ==
Usando Guards ou Case Expressions, defina uma função que recebe dois números: 'e' e 'n'. O primeiro ('e') representa um elemento a ser repetido. O segundo representa a quantidade ('n') de repetições. A função deve devolver uma lista com 'n' replicas de 'e'. 

Detalhe: para funcionar, a lista deve usar guards ou case.

Por exemplo: replica 2 10 -> [2,2,2,2,2,2,2,2,2,2]

-}

{-
replica Num Num -> ListaNum

Recebe dois números, respectivamente, 'e' e 'n' e retorna uma lista contendo n posições de 'e'

replica 2 10 => [2,2,2,2,2,2,2,2,2,2]
replica 4 2 => [4, 4]
replica 3.5 3 => [3.5, 3.5, 3.5]

-}

replica e n
  | n < 1 = [] -- utilizado para evitar casos decimais de repeticoes 
  | otherwise = e:(replica e (n-1))


{-    == QUESTÃO 05 ==
Usando funções de ordem superior ('map', 'fold'...) e lambda (i.e., não nomeadas), elabore uma função que receba uma lista de números reais (representando um vetor Euclidiano) e calcule a norma de tal vetor, conforme a descrição seguinte (tal definição leva em conta que os valores do vetor estão normalizados entre 0.0 e 1.0): 

<IMAGEM FALTANDO>

norma = raiz_quadrada(somatório dos quadrados dos elementos)

Ou seja, o somatório dos quadrados dos números presentes em tal lista.

P.ex.: norma [0.1, 0.2, 0.3, 0.4] --> 0.547722557505

-}

{-
norma ListaNumReais -> NumReal

Cálculo da norma de um vetor 
norma = raiz_quadrada(somatório dos quadrados dos elementos)

norma [0.1, 0.2, 0.3, 0.4] => 0.547722557505
norma [1.5,2.3,1.4,2.3,1.3,0.8] => 4.137632173
norma [1,2,3,4] => 5.477225575
norma [3,4] => 5
-}

norma lst = sqrt $ foldr (+) 0 (map (\x -> x*x) lst)

{-    == QUESTÃO 06 ==
Usando funções de ordem superior ('map', 'fold'...), elabore uma função que receba duas listas de números reais (representando vetores Euclidianos) e calcule o produto interno entre esses vetores, conforme a descrição seguinte (tal definição leva em conta que os valores dos vetores estão normalizados entre 0.0 e 1.0): 

<IMAGEM FALTANDO>

P.ex.: prod_int [0.1, 0.4, 0.9] [0.2, 0.4, 0.5] --> 0.63

Dica: a grande maioria das funções de ordem superior só trabalha com 1 lista (então a dica é tentar agrupar várias listas em uma só, por exemplo, em uma lista de pares ordenados).

Opcional: se desejar aumentar o grau de complexidade, utilize também uma função anônima (recursiva)!

-}

{-
prod_int ListNum ListaNum -> Num

Calculo do produto interno dos vetores
somatório dos produtos de Ai por Bi, onde i é index do vetor

prod_int [0.1, 0.4, 0.9] [0.2, 0.4, 0.5] => 0.63
prod_int [1,3,5] [2,5,3] => 32
prod_int [1.7,1.8,1.2,2.7] [1.9,1.6,1.1,0.6] => 9.05

-}

prod_int lst1 lst2 = foldr (+) 0 $ map (\(x,y) -> x*y) (zip lst1 lst2)





{-    == QUESTÃO 07 ==
Os motores de busca (como Google, Yahoo, Bing e outros) são baseados em teorias, algoritmos e métodos desenvolvidos em uma área chamada de Recuperação de Informações (Information Retrieval). Nessa área, diversos modelos de representação de documentos foram desenvolvidas. Um dos modelos mais conhecidos é o modelo Espaço-Vetorial, de Gerald Salton.

Nesse modelo, os documentos (ou páginas Web) são representados como pontos em um espaço Euclidiano. As dimensões desse espaço são dadas pelas palavras presentes em todos os documentos (i.e., cada palavra da coleção de documentos é considerada uma dimensão). A representação dos documentos no espaço é feita, portanto, através de um vetor de n dimensões, onde cada dimensão é uma palavra com posição fixa no vetor. Todos os vetores possuem a mesma quantidade de dimensões, cada uma com sua posição (normalmente em ordem alfabética):

[palavra1, palavra2, palavra3, ... palavra_n] 

Para representar um documento, cada dimensão representa a força (ou peso) da palavra naquele documento. Caso a palavra não se encontre no documento, ela recebe o peso 0.0. Caso ela esteja presente, pode-se utilizar uma fórmula de medição de peso. Existem muitas equações que podem ser utilizadas para calcular o peso (ver tf-idf e suas variações), sendo uma das mais simples a frequência relativa (i.e., o número de ocorrências da palavra no documento dividido pelo número de palavras do documento). 

Usando funções elaboradas nos exercícios anteriores (norma e produto interno), elabore uma função que receba duas listas de números reais (representando os vetores de palavras dos documentos) e calcule a similaridade entre esses dois documentos, conforme a descrição seguinte (tal definição leva em conta que os valores dos vetores estão normalizados entre 0.0 e 1.0): 

<IMAGEM FALTANDO>

Perceba que a definição leva em conta o cálculo do cosseno entre os dois vetores (detalhes em: http://en.wikipedia.org/wiki/Cosine_similarity). 

-}


{-
sim ListaNumNorm ListaNumNomr -> Num

A função similaridade recebe duas listas normalizadas de 0.0 a 1.0, onde 0.0 representa a não existencia de uma palavra num documento.

o calculo é realizado pela divisão do produto interno das listas pelo produto das normas.

sim [0.1, 0.4, 0.9] [0.2, 0.4, 0.5] => 0.948683298050514
sim [0.3,0.58,0.12] [0.0,0.15,0.98] => 0.9987204448430085
sim [1.0,1.0,0.96] [0.97,0.86,0.9] => 0.9987204448430085
sim [0.02,0.0,0.06,0.07] [0.02,0.2,0.04,0.08] => 0.4047264632751556
sim [0.0,0.001,0.0025] [0.006,0.0,0.0011] => 0.1674302229465222

-}

sim lstA lstB = (prod_int lstA lstB) / ((norma lstA) * (norma lstB))


{-    == QUESTÃO 08 ==
Utilizando listas infinitas (streams), elabore uma função que retorne uma lista dos n primeiros números que são potências de 2 (i.e.: 2, 4, 8, 16...) 

-}

{-
potenciasDe2 Num -> ListaNum

A função retorna as N primeiras potências de 2
A função inicia a partir de 2^0 = 1.

potenciasDe2 2 => [1,2]
potenciasDe2 10 => [1,2,4,8,16,32,64,128,256,512]
potenciasDe2 8 => [1,2,4,8,16,32,64,128]
potenciasDe2 14 => [1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192]

-}


potenciasDe2 n = take n pot2 where pot2 = 1:map (*2) pot2



{-    == QUESTÃO 09 ==
Utilizando listas infinitas (streams), elabore uma função que retorne a lista dos n primeiros números da sequência de Fibonacci. 

Se não lembrar da sequência, veja o artigo sobre ela na Wikipedia.

-}

{-
fibonacciN Num -> ListaNum

A função recebe um número inteiro positivo e retorna uma lista com os N primeiros números da sequencia de Fibonacci, i.e 0,1,1,2,3,5,8,...

fibonacciN 5 => [0,1,1,2,3]
fibonacciN 3 => [0,1,1]
fibonacciN 15 => [0,1,1,2,3,5,8,13,21,34,55,89,144,233,377]
fibonacciN 19 => [0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584]

-}


fibonacciN n = take n seqf where seqf = 0:1:map (\(x,y) -> x+y) (zip seqf (tail seqf))


fibo 0 = 0
fibo 1 = 1
fibo n = (fibo (n-1) + fibo (n-2)) 

geraFibo quantidade = [fibo x | x <- [1..quantidade]]


dec n = n-1

fib 0 _ _ = []
fib n x y = (x):(fib (dec n) y (x+y))

fibonacci n = take n fibonacci where fibonacci = fib n 0 1