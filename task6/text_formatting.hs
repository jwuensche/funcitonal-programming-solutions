module Main where

data Format = Flushleft | Flushright | Centre | Justify deriving (Eq)

member_length :: [String] -> Int
member_length = foldl (\acc x -> acc + length x) 0

justify :: Format -> Int -> String -> String
justify format line_length = unlines . pad_to_space format line_length . reverse . map unwords . foldl (\acc x -> case () of _
                                                                                                                              | acc == [] -> [[x]]
                                                                                                                              | (member_length $ head acc) < (line_length - (length x)) -> ((head acc) ++ [x]):(tail acc)
                                                                                                                              | otherwise -> [x]:acc
                                                                                                      ) [] . words



pad_to_space :: Format -> Int -> [String] -> [String]
pad_to_space format max_space = map (\x -> case () of _
                                                        | format == Flushright -> (replicate (max_space - (length x)) ' ') ++ x
                                                        | format == Centre -> replicate ((max_space - (length x)) `quot` 2) ' ' ++ x ++ replicate ((max_space - (length x)) `quot` 2) ' '
                                                        | format == Flushleft -> x
                                    )

main :: IO()
main = do
  print "foo"
