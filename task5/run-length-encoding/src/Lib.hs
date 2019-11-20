module Lib
    ( rle,
      look_and_say
    ) where

import Data.List (iterate', group)

rle :: Eq a => [a] -> [(Int, a)]
rle uncompressed = map (\list -> (length list, snd (head list))) (group (map (\x -> (1, x)) uncompressed))

look_and_say :: [Int] -> [[Int]]
look_and_say = iterate' (concatMap (\(n, elem) -> [n, elem]) . rle)
