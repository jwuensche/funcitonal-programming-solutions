module Lib
    ( splitAtFoo,
      splitAtMultiple,
    ) where

splitAtFoo :: Int -> String -> [String]
splitAtFoo num string = splitAt' num string [] where
  splitAt' :: Int -> String -> String -> [String]
  splitAt' num (head:string) split = splitAt' (num - 1) string (head:split)
  splitAt' 0 string split = [reverse split, string]

splitAtMultiple :: [Int] -> String -> [String]
splitAtMultiple positions word = splitAtMultiple' positions word [] where
  splitAtMultiple' (num:positions) word acc = splitAtMultiple' positions word (head (splitAtFoo num word):acc)
  splitAtMultiple' [] _ acc = acc
