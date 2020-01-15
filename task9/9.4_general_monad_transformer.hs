module Main where
import Control.Monad.Trans.Class
import Control.Monad (ap)
data MyEither a b = Left a | Right b

instance Monad (MyEither e) where
        return = Main.Right
        Main.Right m >>= k = k m
        Main.Left e  >>= _ = Main.Left e

instance Applicative (MyEither e) where
    pure = Main.Right
    a <*> b = do x <- a; y <- b; return (x y)

instance Functor (MyEither e) where
    fmap _ (Main.Left a) = Main.Left a
    fmap f (Main.Right a) = Main.Right (f a)

instance (Monad m) => Applicative (EitherTransformer a m) where
    pure = return
    (<*>) = ap

newtype EitherTransformer a m b=
  EitherTransformer { runEitherTransformer :: m (MyEither a b) }

instance (Monad m) => Functor (EitherTransformer a m) where
    fmap f (EitherTransformer monad) = EitherTransformer $ monad >>= apply 
        where 
            apply (Main.Left s) = return $ Main.Left s
            apply (Main.Right a) = return $ Main.Right $ f a

instance (Monad m) => Monad (EitherTransformer a m) where
  -- Immplement typeclass functions.
  return dat = EitherTransformer (return $ Main.Right dat)
  ---
  (EitherTransformer monad) >>= f = EitherTransformer $ monad >>= apply where
    apply (Main.Right dat) = runEitherTransformer $ f dat
    apply (Main.Left err) = return $ Main.Left err
  ---

instance MonadTrans (EitherTransformer a) where
  -- Implement typeclass functions.
  lift monad = EitherTransformer $ monad >>= may where
    may dat = return $ Main.Right dat

main :: IO()
main = do
  putStrLn $ "empty test"
