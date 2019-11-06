import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

import Lib (date_parse, Date, date)

main :: IO ()
main = hspec $ do
  describe "Prelude.head" $ do
    it "tests creation of a date" $ do
      case date_parse 1 1 1970 of
        Just dateJust -> dateJust `shouldBe` date 1 1 1970
        Nothing -> True `shouldBe` False
    it "tests show of date" $ do
      date 1 1 1970
