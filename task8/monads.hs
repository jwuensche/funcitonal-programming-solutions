module Main where

import Control.Monad (ap, liftM)

instance Functor Identity where
  fmap = liftM

instance Applicative Identity where
  pure = return
  (<*>) = ap

instance Functor CountBinds where
  fmap = liftM

instance Applicative CountBinds where
  pure = return
  (<*>) = ap

data Identity a = Identity a deriving (Show)

instance Monad Identity where
  return val = Identity val
  (Identity val) >>= g = g val

data CountBinds a = CountBinds (Integer, a) deriving (Show)

instance Monad CountBinds where
  return foo = CountBinds (0, foo)
  (CountBinds (count, value)) >>= g =let CountBinds (count2, processed) = g value in
    CountBinds (count + count2 + 1, processed)

binds :: CountBinds a -> Integer
binds (CountBinds (c, _)) = c
-- Has to be equal to 2
two :: CountBinds Int
two = do
  x <- return 1
  y <- return 2
  return $ x + y

main = do
  let a = 0 :: Integer
      k = (\x -> Identity (x + 1))
      m = Identity (0 :: Integer)
      h = (\x -> Identity (x - 1))
    in
    do
      putStr $ show (return a >>= k)
      putStr " = "
      putStr $ show (k a)
      putStr "\n"
      putStr $ show (m >>= return)
      putStr " = "
      putStr $ show (m)
      putStr "\n"
      putStr $ show (m >>= (\x -> k x >>= h))
      putStr " = "
      putStr $ show ((m >>= k) >>= h)
      putStr "\n"
  let a = 0 :: Integer
      k = (\x -> CountBinds (42, x + 1))
      m = CountBinds (0, 0)
      h = (\x -> CountBinds (5, x - 1))
    in
    do
      putStr $ show (return a >>= k)
      putStr " = "
      putStr $ show (k a)
      putStr "\n"
      putStr $ show (m >>= return)
      putStr " = "
      putStr $ show (m)
      putStr "\n"
      putStr $ show (m >>= (\x -> k x >>= h))
      putStr " = "
      putStr $ show ((m >>= k) >>= h)
      putStr "\n"
