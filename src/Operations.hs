{-
-- EPITECH PROJECT, 2023
-- Rush1
-- File description:
-- Operations
-}

module Operations
  ( doSa,
    doSb,
    doSc,
    doPa,
    doPb,
    doRa,
    doRb,
    doRr,
    doRra,
    doRrb,
    doRrr,
  )
where

doSa :: [String] -> [String] -> ([String], [String])
doSa [] listB = ([], listB)
doSa [a] listB = ([a], listB)
doSa (x : xs) listB = (head xs : x : tail xs, listB)

doSb :: [String] -> [String] -> ([String], [String])
doSb listA [] = (listA, [])
doSb listA [a] = (listA, [a])
doSb listA (x : xs) = (listA, head xs : x : tail xs)

doSc :: [String] -> [String] -> ([String], [String])
doSc listA listB = (fst (doSa listA listB), snd (doSb listA listB))

doPa :: [String] -> [String] -> ([String], [String])
doPa listA [] = (listA, [])
doPa listA (x : xs) = (x : listA, xs)

doPb :: [String] -> [String] -> ([String], [String])
doPb [] listB = ([], listB)
doPb (x : xs) listB = (xs, x : listB)

doRa :: [String] -> [String] -> ([String], [String])
doRa [] listB = ([], listB)
doRa (x : xs) listB = (xs <> [x], listB)

doRb :: [String] -> [String] -> ([String], [String])
doRb listA [] = (listA, [])
doRb listA (x : xs) = (listA, xs <> [x])

doRr :: [String] -> [String] -> ([String], [String])
doRr listA listB = (fst (doRa listA listB), snd (doRb listA listB))

doRra :: [String] -> [String] -> ([String], [String])
doRra [] listB = ([], listB)
doRra listA listB = (last listA : init listA, listB)

doRrb :: [String] -> [String] -> ([String], [String])
doRrb listA [] = (listA, [])
doRrb listA listB = (listA, last listB : init listB)

doRrr :: [String] -> [String] -> ([String], [String])
doRrr listA listB = (fst (doRra listA listB), snd (doRrb listA listB))
