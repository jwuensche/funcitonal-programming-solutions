module Main where

import Control.Monad.Trans.Class

newtype EitherTransformer a m b=
  EitherTransformer { runEitherTransformer :: m (Either a b) }

instance (Monad m) => Monad (EitherTransformer a m) where
  -- Immplement typeclass functions.
  return dat = EitherTransformer (return $ Right dat)
  ---
  (EitherTransformer monad) >>= f = EitherTransformer $ monad >>= apply where
    apply (Right dat) = runEitherTransformer $ f dat
    apply (Left err) = return $ Left err
  ---

instance MonadTrans (EitherTransformer a) where
  -- Implement typeclass functions.
  lift monad = EitherTransformer $ monad >>= may where
    may dat = return $ Right dat

main :: IO()
main = do
  putStrLn $ "empty test"
