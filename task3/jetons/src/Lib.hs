module Lib
    ( value,
      Jeton(Red, Green, Blue, Silver, Gold),
      payoff,
      count,
      buy,
    ) where

data Jeton = Red | Green | Blue | Silver | Gold
  deriving (Show, Enum, Eq, Ord)

type Jetons = [Jeton]

value :: Jeton -> Int
value Red = 1
value Green = 5
value Blue = 10
value Silver = 50
value Gold = 100

payoff :: Jetons -> Int
payoff jetons = jetons' jetons 0 where
  jetons' :: Jetons -> Int -> Int
  jetons' [] n = n
  jetons' (x:xs) n = jetons' xs (value x + n)

count :: Jetons -> Int
count jetons = length jetons

buy :: Int -> Jetons
buy currency = buy' currency [] where
  buy' :: Int -> Jetons -> Jetons
  buy' 0 jetons = jetons
  buy' n jetons
    | n `quot` 100 > 0 = buy' (n - 100) (Gold: jetons)
    | n `quot` 50 > 0 = buy' (n -50) (Silver: jetons)
    | n `quot` 10 > 0 = buy' (n - 10) (Blue: jetons)
    | n `quot` 5 > 0 = buy' (n - 5) (Green: jetons)
    | n `quot` 1 > 0 = buy' (n - 1) (Red: jetons)
    | otherwise = buy' 0 jetons
