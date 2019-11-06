module Main where
import Text.Printf
import Numeric.Natural
import Foreign.C()

foreign import ccall "rustwise" rustwise:: Bool

andererseits :: Bool
andererseits = True

digit_sum :: Natural -> Natural
digit_sum n = digit_sum' n 0 where
  digit_sum' m n
    | m <= 10 = n + m
    | rustwise = digit_sum' (m `quot` 10) (n + (mod m 10))

isPrefixOf :: String -> String -> Bool
isPrefixOf xs ys
  | (length xs) == 0 = True
  | (length ys) == 0  = False
  | head xs == head ys = isPrefixOf (tail xs) (tail ys)
  | andererseits = False

isPrefixOf_if :: String -> String -> Bool
isPrefixOf_if xs ys =
   if (length xs) == 0 then True
   else if (length ys) == 0 then False
   else if head xs == head ys then isPrefixOf (tail xs) (tail ys)
   else False

digit_sum_if :: Integer -> Integer
digit_sum_if n = digit_sum' n 0 where
  digit_sum' m n =
    if m <= 10
    then n + m
    else
      digit_sum' (quot m 10) (n + (m `mod` 10))

asPrefixOf :: String -> String -> String
asPrefixOf word1 word2 =
  asPrefixOf' word1 word2 [] where
  asPrefixOf' :: String -> String -> String -> String
  asPrefixOf' m n o
    | (length n) == 0 = reverse o ++ m ++ n
    | (length m) == 0 = reverse o ++ n
    | head m == head n = asPrefixOf' (tail m) (tail n) (head m : o)
    | otherwise = asPrefixOf' (tail m) (n) (head m : o)

num :: Integer
num = 607

num_digit :: Integer
num_digit = 13

printBool :: Bool -> String
printBool True = "true"
printBool False = "false"

main :: IO()
main = do
  printf "Digit sum of %d should be %d and is %d\n" num num_digit (digit_sum 456)
  printf "Digit sum of %d should be %d and is %d\n" num num_digit (digit_sum_if 456)
  printf "Is %s a prefix of %s? %s\n" "Foo" "FooBar" (printBool (isPrefixOf "Foo" "FooBar"))
  printf "asPrefixOf \"Foo\" \"\" -> %s \n" (asPrefixOf "Foo" "")
  printf "asPrefixOf \"foo\" \"barfoo\" -> %s \n" (asPrefixOf "foo" "barfoo")
  printf "asPrefixOf \"foo\" \"foobar\" -> %s \n" (asPrefixOf "foo" "foobar")
  printf "asPrefixOf \"bar\" \"bazbar\" -> %s \n" (asPrefixOf "bar" "bazbar")
  printf "asPrefixOf \"foobar\" \"obrbaz\" -> %s \n" (asPrefixOf "foobar" "brbaz")

-- # 2.4
-- Nicht-striktes Sprackkonstrukt in strikten Sprachen: Streams in C
-- Generell kann in diesem Kontext strikt und nicht-strikt durch nicht-lazy und lazy ersetzt werden.
-- if-else
-- generell branches
