{-
-- EPITECH PROJECT, 2023
-- Rush1
-- File description:
-- Test Operations
-}

module TestOperations (testOperation) where

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
import Test.Hspec (Spec, describe, it, shouldBe)

testOperation :: Spec
testOperation = testErrorSab >> testBasicSabc

testErrorSab :: Spec
testErrorSab =
  describe "Errors on Operations" $
    it "Should test error sa" (doSa [] [] `shouldBe` ([], []))
      >> it "Should test error sb" (doSb [] [] `shouldBe` ([], []))
      >> testErrorPab

testErrorPab :: Spec
testErrorPab =
  describe "Errors on Operations" $
    it "Should test error pa" (doPa [] [] `shouldBe` ([], []))
      >> it "Should test error pb" (doPb [] [] `shouldBe` ([], []))

testErrorRabr :: Spec
testErrorRabr =
  describe "Errors on Operations" $
    it "Should test error ra" (doRa [] [] `shouldBe` ([], []))
      >> it "Should test error rb" (doRb [] [] `shouldBe` ([], []))
      >> it "Should test error rra" (doRra [] [] `shouldBe` ([], []))
      >> it "Should test error rrb" (doRrb [] [] `shouldBe` ([], []))

testBasicSabc :: Spec
testBasicSabc =
  describe "Basic operations" $
    it "Should test basic sa" (doSa ["1", "3"] [] `shouldBe` (["3", "1"], []))
      >> it
        "Should test basic sb"
        (doSb [] ["1", "3"] `shouldBe` ([], ["3", "1"]))
      >> it
        "Should test basic sc"
        (doSc ["2", "98"] ["90", "-5"] `shouldBe` (["98", "2"], ["-5", "90"]))
      >> testBasicPab

testBasicPab :: Spec
testBasicPab =
  describe "Basic operations" $
    it "Should test basic pa" (doPa [] ["1", "3"] `shouldBe` (["1"], ["3"]))
      >> it
        "Should test basic pb"
        (doPb ["3", "1"] [] `shouldBe` (["1"], ["3"]))
      >> testBasicRab

testBasicRab :: Spec
testBasicRab =
  describe "Basic operations" $
    it
      "Should test basic ra"
      (doRa ["1", "2", "7"] [] `shouldBe` (["2", "7", "1"], []))
      >> it
        "Should test basic rb"
        (doRb [] ["1", "2", "7"] `shouldBe` ([], ["2", "7", "1"]))
      >> testBasicRr

testBasicRr :: Spec
testBasicRr =
  describe "Basic operations" $
    it
      "Should test basic rr"
      ( doRr ["8", "98", "67"] ["1", "2", "7"]
          `shouldBe` (["98", "67", "8"], ["2", "7", "1"])
      )
      >> testBasicRrab

testBasicRrab :: Spec
testBasicRrab =
  describe "Basic operations" $
    it
      "Should test basic rra"
      (doRra ["1", "2", "7"] [] `shouldBe` (["7", "1", "2"], []))
      >> it
        "Should test basic rrb"
        (doRrb [] ["1", "2", "7"] `shouldBe` ([], ["7", "1", "2"]))
      >> testBasicRrr

testBasicRrr :: Spec
testBasicRrr =
  describe "Basic operations" $
    it
      "Should test basic rrr"
      ( doRrr ["8", "98", "67"] ["1", "2", "7"]
          `shouldBe` (["67", "8", "98"], ["7", "1", "2"])
      )
