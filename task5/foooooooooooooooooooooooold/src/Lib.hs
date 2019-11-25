module Lib
  ( product',
      noneIsEven,
      sumLengths,
      xSquaredPlusThreeXPlusFive,
      getByKey,
      partialSums,
      toSameLength,
      sortByLength,
      sortByLengthRememberingIndex,
      innerOuterMap,
    ) where

import Data.List (scanl, maximum, sortOn)

product' :: [Int] -> Int
product' = foldl (*) 1

noneIsEven :: [Int] -> Bool
noneIsEven = foldl (\acc x -> if x `mod` 2 == 0 then False else acc) True

sumLengths :: [String] -> Int
sumLengths = foldl (\acc x -> acc + (length x)) 0

xSquaredPlusThreeXPlusFive :: [(Integer, Integer)]
xSquaredPlusThreeXPlusFive = map (\x ->  (x , x * x + 3 * x + 5)) [0..150]

getByKey :: [(String, Int)] -> String -> [Int]
getByKey list key = ((map (\(_, x) -> x)) . (filter (\(x, _) -> if key == x then True else False))) list

----

partialSums :: Num a => [a] -> [a]
partialSums = scanl (+) 0

toSameLength :: [String] -> [String]
toSameLength list = let max = (maximum . map length) list in
  map (\x -> x ++ (replicate (max - (length x)) ' ')) list

sortByLength :: [[a]] -> [[a]]
sortByLength = sortOn length

sortByLengthRememberingIndex :: [[a]] -> [(Int, [a])]
sortByLengthRememberingIndex = sortOn (length . snd) . zip [0..]

innerOuterMap :: (a -> b) -> ([b] -> c) -> [[a]] -> [c]
innerOuterMap f1 f2 = map (f2 . map f1)
