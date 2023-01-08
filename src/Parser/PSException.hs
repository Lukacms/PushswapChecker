{-
-- EPITECH PROJECT, 2023
-- Rush1
-- File description:
-- PSExceptions
-}

module Parser.PSException
  ( PException (..),
    exceptionHandler,
  )
where

import Control.Exception (Exception)
import System.Exit (ExitCode (ExitFailure), exitSuccess, exitWith)

data PException = OpException String | ArgException String

instance Show PException where
  show (OpException a) = "Exception op: " <> a
  show (ArgException a) = "Exception arg: " <> a

instance Exception PException

epiSuccess :: IO ()
epiSuccess = exitSuccess

epiFailure :: IO ()
epiFailure = exitWith $ ExitFailure 84

exceptionHandler :: PException -> IO ()
exceptionHandler (OpException a) = print ("Exception op: " <> a) >> epiFailure
exceptionHandler (ArgException a) =
  print ("Exception arg: " <> a)
    >> epiFailure
