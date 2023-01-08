{-
-- EPITECH PROJECT, 2023
-- Rush1
-- File description:
-- Main
-}

module Main where

import Compiler (compiler)
import Control.Exception.Base (throw)
import GHC.IO.Exception (ExitCode (ExitFailure))
import Parser.ErrorHandling (lexer)
import System.Directory.Internal.Prelude (getArgs)

launch :: [String] -> IO ()
launch tab = getLine >>= compiler . lexer tab

main :: IO ()
main = getArgs >>= launch
