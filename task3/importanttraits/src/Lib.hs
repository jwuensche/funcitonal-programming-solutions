module Lib
    ( List
    ) where

data List a = Nil | Cons a(List a)

instance Eq a => Eq (List a) where
  (==) list1 list2 = compare' list1 list2 where
    compare' :: Eq a => List a -> List a -> Bool
    compare' Nil (Cons _ (_)) = False
    compare' (Cons _ (_)) Nil = False
    compare' (Cons head1(list1)) (Cons head2(list2)) = if head1 == head2
      then compare' list1 list2
      else False
    compare' Nil Nil = True

  (/=) list1 list2 = not $ (==) list1 list2

instance Ord a => Ord (List a) where
  compare list1 list2 = compare' list1 list2 where
    compare' :: Ord a => List a -> List a -> Ordering
    compare' Nil (Cons _(_)) = GT
    compare' (Cons _(_)) Nil = LT
    compare' Nil Nil = EQ
    compare' (Cons head1(list1)) (Cons head2 (list2)) = if head1 == head2
      then compare' list1 list2
      else
        if head1 > head2
        then LT
        else GT

instance Num Bool where
  (*) True True = True
  (*) _ False = False
  (*) False _ = False

  (-) True False = True
  (-) False True = True
  (-) _ _ = False

  (+) True _ = True
  (+) _ True = True
  (+) _ _ = False

  abs a = True

  negate = not

  signum a = a

  fromInteger 0 = True
  fromInteger _ = False
