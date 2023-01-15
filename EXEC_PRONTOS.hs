list = [1, 2, 3, 4, 6]

pertenceLst list number 
 | length list == 0 = "no"
 | head list == number = "yes"
 | otherwise = isInTail 
 where isInTail = pertenceLst (tail list) number

main :: IO ()
main = do
 print(pertenceLst list 5)

{-
#########################################################################################################################################################################################
-}

Formato 1:

list = [1, 2, 3, 4, 6, 1]

ocorrencias [] _ = 0
ocorrencias (he:ta) number
 | he == number = 1 + ocorrencias ta number
 | otherwise = 0 + ocorrencias ta number

main :: IO ()
main = do
 print(ocorrencias list 1)

------------------------------------------------------

Formato 2:

list = [1, 2, 3, 4, 6, 1]

contaOcorrencias list number nrOcor
 | length list == 0 = nrOcor
 | head list == number = sumAndGoTail
 | otherwise = goTail 
 where 
 goTail = contaOcorrencias (tail list) number nrOcor
 sumAndGoTail = contaOcorrencias (tail list) number (nrOcor + 1)

ocorrencias list number = contaOcorrencias list number 0

main :: IO ()
main = do
 print(ocorrencias list 1)
{-
#########################################################################################################################################################################################
-}

Versão Fold:

list = [1, 2, 3, 4, 5]

somatorio list = foldl (+) 0 list

main :: IO ()
main = do
 print(somatorio list)
 
-----------------------------------------------

Versão recursiva:

list = [1, 2, 3, 4]

fazSomatorio list result
 | length list == 0 = result 
 | otherwise = somaTail
 where somaTail = fazSomatorio (tail list) (result+(head list))

somatorio list = fazSomatorio list 0

main :: IO ()
main = do
 print(somatorio list)

{-
#########################################################################################################################################################################################
-}

Formato 1:

fazLista number times 
 | times == 0 = []
 | otherwise = number:fazLista number (times-1) 

main :: IO ()
main = do
 print(fazLista 3 5)
 
----------------------------------------
Formato 2:
 
fazLista number times list 
 | times == 0 = list
 | otherwise = fazProximo
 where fazProximo = fazLista number (times-1) (number:list)

replica number times = fazLista number times [] 

main :: IO ()
main = do
 print(replica 2 4)
{-
#########################################################################################################################################################################################
-}

list = [0.1, 0.2, 0.3, 0.4] 

somatorio array = foldl (+) 0 array
quadrado array = map (**2) array
raizq number = sqrt number
norma array = raizq (somatorio (quadrado array))

main :: IO ()
main = do
 print(norma list)

{-
#########################################################################################################################################################################################
-}
vetor1 = [0.1, 0.4, 0.9] 
vetor2 = [0.2, 0.4, 0.5]

somatorio vetor = foldl (+) 0 vetor
criaTuplas vetor1 vetor2 = zip vetor1 vetor2
multiplicaTuplaUnica (number1, number2) = number1*number2
multiplicaTuplas vetor = map (multiplicaTuplaUnica) vetor
prodInt vetor1 vetor2 = somatorio (multiplicaTuplas (criaTuplas vetor1 vetor2))

main :: IO ()
main = do
 print(prodInt vetor1 vetor2)
{-
#########################################################################################################################################################################################
-}

vetor1 = [0.1, 0.4, 0.9, 0.4, 0.7, 0.12, 0.7, 0.3] 
vetor2 = [0.12, 0.7, 0.3, 0.1, 0.4, 0.9, 0.4, 0.7] 

somatorio array = foldl (+) 0 array

quadrado array = map (**2) array
raizq number = sqrt number
norma array = raizq (somatorio (quadrado array))

criaTuplas vetor1 vetor2 = zip vetor1 vetor2
multiplicaTuplaUnica (number1, number2) = number1*number2
multiplicaTuplas vetor = map (multiplicaTuplaUnica) vetor
prodInt vetor1 vetor2 = somatorio (multiplicaTuplas (criaTuplas vetor1 vetor2))

similaridade vetor1 vetor2 = prodInt vetor1 vetor2 / ((norma vetor1) * (norma vetor2)) 

main :: IO ()
main = do
 print(similaridade vetor1 vetor2)
 print(similaridade vetor1 vetor1)
{-
#########################################################################################################################################################################################
-}
primeirasPotencias quantidade = [2**x | x <- [1..quantidade]]

main :: IO()
main = do
 print (primeirasPotencias 5)

{-
#########################################################################################################################################################################################
-}

fibo 0 = 0
fibo 1 = 1
fibo n = (fibo (n-1) + fibo (n-2)) 

geraFibo quantidade = [fibo x | x <- [1..quantidade]]

main :: IO()
main = do
 print (geraFibo 10)


 