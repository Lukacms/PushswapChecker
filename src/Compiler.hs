{-
-- EPITECH PROJECT, 2023
-- $PROJECT NAME
-- File description:
-- $Description
-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use :" #-}
{-# HLINT ignore "Use foldr" #-}

module Compiler
  ( compiler,
    toListInt,
    readInt,
    isNumber,
    doAction,
    treeSort,
  )
where

import Control.Exception (throw)
import GHC.IO.Exception (ExitCode (ExitFailure))
import Operations
  ( doPa,
    doPb,
    doRa,
    doRb,
    doRr,
    doRra,
    doRrb,
    doRrr,
    doSa,
    doSb,
    doSc,
  )
import Sort (treeSort)

doAction :: ([String], [String]) -> [String] -> [String]
doAction (x, y) ("sa" : xs) = doAction (doSa x y) xs
doAction (x, y) ("sb" : xs) = doAction (doSb x y) xs
doAction (x, y) ("sc" : xs) = doAction (doSc x y) xs
doAction (x, y) ("pa" : xs) = doAction (doPa x y) xs
doAction (x, y) ("pb" : xs) = doAction (doPb x y) xs
doAction (x, y) ("ra" : xs) = doAction (doRa x y) xs
doAction (x, y) ("rb" : xs) = doAction (doRb x y) xs
doAction (x, y) ("rr" : xs) = doAction (doRr x y) xs
doAction (x, y) ("rra" : xs) = doAction (doRra x y) xs
doAction (x, y) ("rrb" : xs) = doAction (doRrb x y) xs
doAction (x, y) ("rrr" : xs) = doAction (doRrr x y) xs
doAction (x, _) [] = x
doAction _ _ = []

isNumber :: [Char] -> Bool -> Bool
isNumber [] isNeg = True
isNumber ('-' : xs) False = isNumber xs True
isNumber (x : xs) isNeg
  | x <= '9' && x >= '0' = isNumber xs isNeg
  | otherwise = False

readInt :: [Char] -> Int
readInt c
  | isNumber c False = read c
  | otherwise = 0

toListInt :: [String] -> [Int]
toListInt [] = []
toListInt (x : xs) = [readInt x] ++ toListInt xs

compiler :: Maybe ([String], [String], [String]) -> IO ()
compiler Nothing = throw $ ExitFailure 84
compiler (Just (lA, lB, command))
  | toListInt (doAction (lA, lB) command) == treeSort (toListInt lA) =
    putStrLn "OK"
  | otherwise = putStrLn "KO"
