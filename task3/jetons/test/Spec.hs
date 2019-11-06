import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

import Lib (value, Jeton(Red, Green, Blue, Silver, Gold), payoff, count, buy,)

main :: IO ()
main = hspec $ do
  describe "Prelude.head" $ do
    it "tests the value of red jetons" $ do
      (value Red) `shouldBe` 1
    it "tests the value of green jetons" $ do
      (value Green) `shouldBe` 5
    it "tests the value of blue jetons" $ do
      (value Blue) `shouldBe` 10
    it "tests the value of silver jetons" $ do
      (value Silver) `shouldBe` 50
    it "tests the value of gold jetons" $ do
      (value Gold) `shouldBe` 100
    it "tests the result of combination of jetons in euro" $ do
      (payoff [Red, Green, Blue, Gold]) `shouldBe` 116
    it "tests the amount of jetons" $ do
      (count [Red, Green, Blue, Green, Green]) `shouldBe` 5
    it "tests the list of buyable jetons" $ do
      (buy 15) `shouldBe` [Green, Blue]
    it "tests the list of buyable jetons with invalid values" $ do
      (buy (-14)) `shouldBe` []
