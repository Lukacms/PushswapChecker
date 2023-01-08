{-
-- EPITECH PROJECT, 2023
-- Rush1
-- File description:
-- Main module for test
-}

module Main (main) where

import Test.Hspec (hspec)
import TestCompiler (testCompile)
import TestErrorHandling (testLexer)
import TestOperations (testOperation)

main :: IO ()
main = hspec $ testLexer >> testCompile >> testOperation
