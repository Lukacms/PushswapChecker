{-
-- EPITECH PROJECT, 2023
-- Rush1
-- File description:
-- Error Handling
-}
module Parser.ErrorHandling
  ( lexer,
    isStrNb,
    areArgsNbs,
    isCorrectOp,
    sortOpLine,
  )
where

import Data.Char (isNumber)
import GHC.IO.Exception (ExitCode (ExitFailure))

isStrNb :: String -> Bool
isStrNb [a] = isNumber a
isStrNb ('-' : xs) = isStrNb xs
isStrNb (x : xs)
  | not (isNumber x) = False
  | otherwise = isStrNb xs
isStrNb _ = False

areArgsNbs :: [String] -> Bool
areArgsNbs [] = False
areArgsNbs [a] = isStrNb a
areArgsNbs (x : xs)
  | not (isStrNb x) = False
  | otherwise = areArgsNbs xs

isCorrectOp :: [String] -> Bool
isCorrectOp [] = True
isCorrectOp (x : xs)
  | x `notElem`
    [ "sa", "sb", "sc", "pa", "pb", "pc", "ra", "rb", "rr",
      "rra", "rrb", "rrr"] = False
  | otherwise = isCorrectOp xs

sortOpLine :: String -> [String]
sortOpLine str
  | not (isCorrectOp (words str)) = [""]
  | otherwise = words str

lexer :: [String] -> String -> Maybe ([String], [String], [String])
lexer [] _ = Nothing
lexer tab line
  | not (areArgsNbs tab) = Nothing
  | sortOpLine line == [""] = Nothing
  | otherwise = Just (tab, [], sortOpLine line)
