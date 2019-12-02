module Main where

import Data.Function (on)

groupBy :: (a -> a -> Bool) -> [a] -> [[a]]
groupBy _ [] = []
groupBy f (h:list) = reverse $ foldl (\(prev:acc) x -> case () of _
                                                                    | f (head prev) x -> (prev ++ [x]):acc
                                                                    | otherwise -> [x]:prev:acc
                                                               ) [[h]] list

groupby :: Eq b => (a -> b) -> [a] -> [(b, [a])]
groupby f = ((map (\x -> (fst $ head x, map (\(_, y) -> y) x))) . (groupBy ((==) `on` fst) . map (\x -> (f x, x))))

main :: IO()
main = do
  print "Foo"
