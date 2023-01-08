{-
-- EPITECH PROJECT, 2023
-- Rush1
-- File description:
-- Test Compiler
-}

module TestCompiler (testCompile) where

import Compiler (compiler, doAction, isNumber, readInt, toListInt, treeSort)
import Control.Exception (throw)
import Data.Bool (Bool (False))
import Data.Maybe (Maybe (Nothing))
import Test.Hspec (Spec, anyException, describe, it, shouldBe, shouldThrow)

testCompile :: Spec
testCompile =
  testErrorCompileDoAction >> testErrortoListToNb
    >> testErrorIsNbReadInt
    >> testErrorToListInt
    >> testBasicCompile
    >> testBasicDoAction
    >> testBasicSort

testErrortoListToNb :: Spec
testErrortoListToNb =
  describe "Errors test" $
    it
      "Should test toListInt for empty array"
      (toListInt [] `shouldBe` [])
      >> it
        "Should test isNumber for empty"
        (isNumber [] False `shouldBe` True)

testErrorCompileDoAction :: Spec
testErrorCompileDoAction =
  describe "Errors test" $
    it
      "Should throw 84 if Nothing is recieved by compiler"
      (compiler Nothing `shouldThrow` anyException)
      >> it
        "Should return empty tab on doAction"
        (doAction ([], []) [] `shouldBe` [])

testErrorIsNbReadInt :: Spec
testErrorIsNbReadInt =
  describe "Errors test" $
    it
      "Should test custom isNumber"
      (isNumber "JL" False `shouldBe` False)
      >> it
        "Should test readInt with not an Int"
        (readInt "notanint" `shouldBe` 0)

testErrorToListInt :: Spec
testErrorToListInt =
  describe "Errors test" $
    it
      "Should test toListInt with empty tab"
      (toListInt [] `shouldBe` [])

testBasicCompile :: Spec
testBasicCompile =
  describe "Basic tests for Compiler" $
    it
      "Should test toListInt for rigth array"
      (toListInt ["8", "7", "-9"] `shouldBe` [8, 7, -9])
      >> it
        "Should test toListInt for array with NaN values"
        (toListInt ["8", "k", "1"] `shouldBe` [8, 0, 1])

testBasicDoAction :: Spec
testBasicDoAction =
  describe "Basic tests for Compiler" $
    it
      "Should test basic isNumber"
      (isNumber "78" True `shouldBe` True)
      >> it
        "Should test basic doAction"
        ( doAction (["1", "9", "-7"], ["8"]) ["sa", "pb", "rrr", "pa"]
            `shouldBe` ["8", "-7", "1"]
        )

testBasicSort :: Spec
testBasicSort =
  describe "Basic tests for Compiler" $
    it
      "Should test treeSort"
      (treeSort ["1", "2", "3"] `shouldBe` ["1", "2", "3"])
      >> it
        "Should test basic doAction"
        ( doAction (["1", "9", "-7"], ["8"]) ["sa", "pb", "rrr", "pa"]
            `shouldBe` ["8", "-7", "1"]
        )
