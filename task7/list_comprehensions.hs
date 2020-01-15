module Main where

import Data.List (nub)

inits :: [a] -> [[a]]
inits foo = []:[take (fst i) foo| i <- (zip [1..] foo)]

tails :: [a] -> [[a]]
tails foo = [j | i <- (zip [0..] foo), let j = drop (fst i) foo] ++ [[]]

partition :: (a -> Bool) -> [a] -> ([a], [a])
partition f bar =
  (
    [ j | j <- bar, f j ],
    [k | k <- bar, not (f k)]
  )

groupby :: Eq b => [a] -> (a -> b) -> [(b, [a])]
groupby foo f = [(key_compare, values) |
                 key_compare <- (nub [ key | i <- foo, let key = f i]),
                 let values = [value | value <- foo, f value == key_compare]
                ]

fib :: [Int]
fib = 0:1:[a + b | (a,b) <- zip (tail fib) (fib) ]

prime :: [Int]
prime = primes [2..]

primes :: [Int] -> [Int]
primes foo = head foo : primes [p | p <- (tail foo), p `mod` (head foo) /= 0]

main :: IO()
main = do
  putStrLn $ "Foo"
