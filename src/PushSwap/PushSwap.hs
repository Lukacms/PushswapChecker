{-
-- EPITECH PROJECT, 2023
-- Rush01 [WSL: Manjaro]
-- File description:
-- PushSwap
-}

module PushSwap (
                pushSwap,
                )
                where

import Control.Exception (throw)
import GHC.IO.Exception (ExitCode(ExitFailure))

displayOperations :: ([Int], [Int], String) -> IO ()
displayOperations (a, b, c) = putStrLn(init c)

pushSwap :: ([Int], [Int], String) -> IO ()
pushSwap ([], b, c) = throw (ExitFailure 84)
pushSwap (a,b,c)
    = displayOperations(handleRight(handleLeft(a,b,c) (minimum a)))

handleRight :: ([Int], [Int], String) -> ([Int], [Int], String)
handleRight (a, [], str) = (a, [], str)
handleRight (a, (x:xs), str) = handleRight(fst(doPa a (x:xs)), snd(doPa a (x:xs)), str <> "pa ")

handleLeft :: ([Int], [Int], String) -> Int -> ([Int], [Int], String)
handleLeft ([], b, str) min = ([], b, str)
handleLeft ((x:xs) , b, str) min
    | x /= min = handleLeft(fst(doRa (x:xs) b), b , str <> "ra ") min
    | x == min = handleLeft(fst(doPb (x:xs) b), snd(doPb (x:xs) b), str <> "pb ") (minimum xs)

doRa :: [Int] -> [Int] -> ([Int], [Int])
doRa [] listB = ([], listB)
doRa (x : xs) listB = (xs <> [x], listB)

doPa :: [Int] -> [Int] -> ([Int], [Int])
doPa listA [] = (listA, [])
doPa listA (x : xs) = (x : listA, xs)

doPb :: [Int] -> [Int] -> ([Int], [Int])
doPb [] listB = ([], listB)
doPb (x : xs) listB = (xs, x : listB)


