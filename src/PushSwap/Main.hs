{-
-- EPITECH PROJECT, 2023
-- Rush01 [WSL: Manjaro]
-- File description:
-- PushSwap
-}

module Main where

import PushSwap (pushSwap)
import System.Directory.Internal.Prelude (getArgs)

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

launch :: [String] -> IO ()
launch nb = pushSwap (toListInt nb, [], [])

main :: IO ()
main = getArgs >>= launch
