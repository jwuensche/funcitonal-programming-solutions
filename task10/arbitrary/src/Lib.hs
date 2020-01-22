{-# LANGUAGE FlexibleInstances #-}
module Lib
    ( Constrained,
      Distinct',
    ) where

import Test.QuickCheck.Arbitrary

class Constrained a where
  valid :: a -> Bool

instance (Arbitrary a, Constrained a) => Arbitrary (Constrained a) where
  arbitrary = let foo = arbitrary :: a in
    if valid foo then return foo else arbitrary


newtype Distinct' a = Distinct'(a, a) deriving Show

instance (Arbitrary a) => Arbitrary (Distinct' a) where
  --`= arbitrary >>= return . Distinct`would be equal.
  arbitrary = Distinct' <$> arbitrary

instance (Eq a) => Constrained(Distinct' a) where
  valid Distinct'(l, r) = l /= r
