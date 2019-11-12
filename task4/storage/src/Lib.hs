module Lib
    ( Article,
      contains,
      Product,
      Storage,
      store,
      remove,
      ingredients_available,
      remove_product,
      produce,
    ) where

import Numeric.Natural

data Article a = Article a Natural deriving(Show)
type Storage a = [Article a]
data Product a b = Product {name::b, ingredients::[Article a]} deriving(Show)

contains :: Eq a => Storage a -> a -> Natural
contains storage item = foldl (\acc curr -> case curr of
                                  Article bar n -> if bar == item then acc + n else acc
                                  ) 0 storage

store :: Eq a => Storage a -> a -> Natural -> Storage a
store storage item amount =
  if storage `contains` item > 0
  then map (\curr -> case curr of
               Article bar n -> if bar == item then Article bar (amount + n) else Article bar n
           ) storage else (Article item amount):storage

remove :: Eq a => Storage a -> a -> Natural -> Storage a
remove storage item amount =
  filter (\curr -> case curr of
             Article _ 0 -> False
             Article _ _ -> True
         ) (map (\curr -> case curr of
          Article bar n -> if bar == item then Article bar (n - amount) else Article bar n
      ) storage)

ingredients_available :: (Eq a, Eq b) => Product a b -> Storage a -> Bool
ingredients_available prod storage = ingredients' (ingredients prod) where
  ingredients' ((Article foo amount):ingred)
    | (contains storage foo) >= amount = ingredients' ingred
    | otherwise = False
  ingredients' [] = True

remove_product :: (Eq a, Eq b) => Product a b -> Storage a -> Storage a
remove_product prod storage = remove_product' (ingredients prod) storage where
  remove_product' ((Article foo amount):ingreds) storing = remove_product' ingreds (remove storing foo amount)
  remove_product' [] storing = storing

produce :: (Eq a, Eq b) => [Product a b] -> Storage a -> Storage a
produce (prod:prods) storage
  | ingredients_available prod storage = produce prods (remove_product prod storage)
  | otherwise = produce prods storage
produce [] storage = storage
