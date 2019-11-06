module Lib
    ( date_parse,
      Date(..),
      date,
      iso8601
    ) where

import Text.Printf

data Date = Date {
  day :: Int,
  month :: Int,
  year :: Int } deriving (Eq)

date :: Int -> Int -> Int -> Date
date d m y = Date d m y

iso8601 :: Date -> String
iso8601 date_val = printf "%04d-%02d-%02d" (year date_val) (month date_val) (day date_val)

instance Show Date where
  show date_val = printf "%02d.%02d.%04d" (day date_val) (month date_val) (year date_val)

instance Ord Date where
  compare date1 date2 =
    if (year date1) <= (year date2)
    then
      if (month date1) <= (month date2)
      then
        if (day date1) <= (day date2)
        then
          if (day date1) == (day date2)
          then EQ
          else LT
        else GT
      else GT
    else GT

date_parse :: Int -> Int -> Int -> Maybe Date
date_parse d m y
  | (m == 2 && d <= 28) || (m == 2 && d <= 29 && (y `mod` 4 == 0 && (y `mod` 100 /= 0 || y `mod` 400 == 0))) = Just $ Date d m y
  | m <= 7 && (m `mod` 2 == 1 && d <= 31 || m /= 2 && d <= 30) = Just $ Date d m y
  | m >= 8 && ((m `mod` 2 == 0 && d <= 31) || d <= 30) = Just $ Date d m y
  | otherwise = Nothing
