module Lib
    ( Cart,
      Article,
      Bio,
      AppleKind,
      CheeseKind,
      Amount,
      price
    ) where

import Text.Printf

data Cart = Empty | Bought Article Amount Cart

data Article = Apple AppleKind | Eggs | Cheese CheeseKind | Tofu | Hummus | Milk Bio
data Bio = NonBio | Bio
data AppleKind = Boskop | CoxOrange | GrannySmith
data CheeseKind = Gouda | Appenzeller
data Amount = Piece Int | Gram Int | Litre Double

cart_full :: Article -> Amount -> Cart -> Cart
cart_full art am c = Bought art am c

price :: Article -> Amount -> Double
price article (Piece amount) = fromIntegral (article_price article) / 100 * fromIntegral amount
price article (Gram amount) = (fromIntegral (article_price article) / 100) * (fromIntegral amount / 100)
price article (Litre amount) = fromIntegral (article_price article) /100 * amount

article_price :: Article -> Int
article_price article = case article of
  Apple Boskop -> 55
  Apple CoxOrange -> 60
  Apple GrannySmith -> 50
  Eggs -> 20
  Cheese Gouda -> 145
  Cheese Appenzeller -> 227
  Tofu -> 199
  Hummus -> 159
  Milk Bio -> 119
  Milk NonBio -> 69

instance Show Article where
  show article = case article of
    Apple Boskop -> "Apfel Boskop"
    Apple CoxOrange -> "Apfel Cox Orange"
    Apple GrannySmith -> "Apfel Granny Smith"
    Eggs -> "Eggs"
    Cheese Gouda -> "Cheese Gouda"
    Cheese Appenzeller -> "Cheese Appenzeller"
    Tofu -> "Tofu"
    Hummus -> "Hummus"
    Milk Bio -> "Milk Bio"
    Milk NonBio -> "Milk NonBio"

instance Show Amount where
  show amount = case amount of
    Piece n -> printf "%d %s" n "pc"
    Gram n -> printf "%d %s" n "g"
    Litre n -> printf "%f %s" n "l"

receipt_article :: Article -> Amount -> String
receipt_article article amount = printf "%s\t%s\t%f€" (show article) (show amount) (price article amount)

receipt_header :: String
receipt_header = printf "%s\t%s\t%s" "Article" "Amount" "Price"

receipt_sum :: Cart -> Double
receipt_sum  cart = help' cart 0 where
  help' foo n = case foo of
    Bought article amount cart -> help' cart (n + price article amount)
    Empty -> n

receipt_footer :: Double -> String
receipt_footer sum = printf "Sum:\t\t\t%f€" sum

receipt_delim :: String
receipt_delim = "============================================"


instance Show Cart where
  show cart = receipt_header ++ "\n" ++ receipt_delim ++ receipt_articles cart ++ "\n" ++ receipt_delim ++ "\n" ++ receipt_footer (receipt_sum cart) ++ "\n"

receipt_articles :: Cart -> String
receipt_articles cart = print' cart "" where
  print' :: Cart -> String -> String
  print' cart text = case cart of
    Empty -> text
    Bought article amount cart -> print' cart (text ++ "\n" ++ (receipt_article article amount))









  
