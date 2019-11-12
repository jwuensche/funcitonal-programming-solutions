module Lib
    ( splitAtFoo,
      splitAtMultiple,
    ) where

splitAtFoo :: Int -> String -> (String, String)
splitAtFoo num word = splitAt' num word [] where
  splitAt' :: Int -> String -> String -> (String, String)
  splitAt' 0 remain split = (reverse split, remain)
  splitAt' cur_num (letter:cur_word) split
    | num >= 0 = splitAt' (cur_num - 1) cur_word (letter:split)
    | otherwise = ("", cur_word)

splitAtMultiple :: [Int] -> String -> [String]
splitAtMultiple poss word = splitAtMultiple' poss word [] where
  splitAtMultiple' (num:positions) cur_word acc = splitAtMultiple' (map (\curr -> curr - num ) positions) (snd (splitAtFoo num cur_word)) (fst (splitAtFoo num cur_word):acc)
  splitAtMultiple' [] cur_word acc = reverse acc ++ [cur_word]
