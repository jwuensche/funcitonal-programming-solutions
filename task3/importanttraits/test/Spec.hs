import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

import Lib (List)

main :: IO ()
main = hspec $ do
  describe "Prelude.head" $ do
    it "tests the value of red jetons" $ do
      (List 1(List 2(List 3))) `shouldBe` 1
