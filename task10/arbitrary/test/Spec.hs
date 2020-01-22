import Test.Hspec
import Test.QuickCheck
import Test.QuickCheck.Gen
main :: IO ()
main = hspec $ let n = 100 in
  do
    describe ("10.4: Generally Constrained:" ++ "The generated arbitrary instance for a derivative of Distinct'") $ do
      it "should only generate valid `Distinct' Bool`s." $ property $
        withMaxSuccess n (\ {- Fill in arguments. -} -> (x::Bool) /= y)
      it "should only generate valid`Distinct'Integer`s." $ property $
        withMaxSuccess n (\ {- Fill in arguments. -} -> (x::Integer) /= y)
