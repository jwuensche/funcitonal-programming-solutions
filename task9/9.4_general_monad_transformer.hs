module Main where

import Control.Monad.Trans.Class

newtype EitherTransformer m a =
  EitherTransformer { runEitherTransformer :: m (Either String a) }

instance (Monad m) => Monad (EitherTransformer m) where
  -- Immplement typeclass functions.
  return dat = EitherTransformer (return $ Right dat)
  ---
  (EitherTransformer monad) >>= f = EitherTransformer $ monad >>= apply where
    apply (Right dat) = runEitherTransformer $ f dat
    apply (Left err) = return $ Left err
  ---

instance MonadTrans EitherTransformer where
  -- Implement typeclass functions.
  lift monad = EitherTransformer $ monad >>= may where
    may dat = return $ Right dat

main :: IO()
main = do
  putStrLn $ "empty test"
