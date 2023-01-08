{-
-- EPITECH PROJECT, 2023
-- Rush1
-- File description:
-- Tests on ErrorHandling
-}

module TestErrorHandling (testLexer) where

import Data.Maybe (Maybe (Nothing))
import Parser.ErrorHandling (areArgsNbs, isCorrectOp, isStrNb, lexer, sortOpLine)
import Test.Hspec (Spec, describe, hspec, it, shouldBe)

testLexer :: Spec
testLexer = testNothingLexer >> testBasic >> testBasicNb

testNothingLexer :: Spec
testNothingLexer =
  describe "Lexer tests" $
    it "Should test for no arguments" (lexer [] "str" `shouldBe` Nothing)
      >> it
        "Should test for no arg number"
        (lexer ["JH", "7", "kj"] "pa pa" `shouldBe` Nothing)
      >> testInvalidLexer

testInvalidLexer :: Spec
testInvalidLexer =
  describe "Lexer tests" $
    it
      "Should test for invalid operation string"
      (lexer ["1", "8", "9"] "pnn" `shouldBe` Nothing)
      >> it
        "Should test isStrNb for empty string"
        (isStrNb "" `shouldBe` False)
      >> testErrorArgStrNb

testErrorArgStrNb :: Spec
testErrorArgStrNb =
  describe "Lexer tests" $
    it "Should test isStrNb for not a nb" (isStrNb "jyg" `shouldBe` False)
      >> it
        "Should test areArgsNb for empty tab"
        (areArgsNbs [] `shouldBe` False)
      >> it
        "Should test areArgsNb for simple not nb tab"
        (areArgsNbs ["gyh"] `shouldBe` False)
      >> testErrorOp

testErrorOp :: Spec
testErrorOp =
  describe "Lexer tests" $
    it
      "Should test areArgsNb for numerous not nb tab"
      (areArgsNbs ["1", "-97", "gyh", "98"] `shouldBe` False)
      >> it
        "Should test that simple Op is wrong"
        (isCorrectOp ["kjf"] `shouldBe` False)
      >> testErrorOpLine

testErrorOpLine :: Spec
testErrorOpLine =
  describe "Lexer tests" $
    it
      "Should test that numerous Op is wrong"
      (isCorrectOp ["pa", "pb", "sa", "gh", "pb"] `shouldBe` False)
      >> it
        "Should test simple Op is wrong (in string)"
        (sortOpLine "pan" `shouldBe` [""])

testBasic :: Spec
testBasic =
  describe "Basic lexer test" $
    it
      "Should test for negative number"
      ( lexer ["-1", "-8"] "pa pa"
          `shouldBe` Just (["-1", "-8"], [], ["pa", "pa"])
      )
      >> it
        "Should test lexer for empty string"
        (lexer ["1", "7"] "" `shouldBe` Just (["1", "7"], [], []))

testBasicNb :: Spec
testBasicNb =
  describe "Basic lexer test" $
    it
      "Should test lexer for most basic thing"
      (lexer ["1", "2"] "sa" `shouldBe` Just (["1", "2"], [], ["sa"]))
      >> it
        "Should test isStrNb with positive nb"
        (isStrNb "98" `shouldBe` True)
      >> testBasicStrNb

testBasicStrNb :: Spec
testBasicStrNb =
  describe "Basic lexer test" $
    it "Should test isStrNb with negative nb" (isStrNb "-98" `shouldBe` True)
      >> testBasicCorrectOp

testBasicCorrectOp :: Spec
testBasicCorrectOp =
  describe "Basic lexer test" $
    it
      "Should test areArgsNb with various nb"
      (areArgsNbs ["1", "-986", "0"] `shouldBe` True)
      >> it
        "Should test isCorrectOp with various op"
        (isCorrectOp ["pa", "pa", "sa", "rra"] `shouldBe` True)
      >> testBasicOpLine

testBasicOpLine :: Spec
testBasicOpLine =
  describe "Basic lexer test" $
    it
      "Should test sortOpLine with basic op"
      (sortOpLine "pa pa sb rrr" `shouldBe` ["pa", "pa", "sb", "rrr"])
