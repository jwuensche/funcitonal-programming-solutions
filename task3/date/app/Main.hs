module Main where

import Lib(date_parse, iso8601)
import Data.Maybe(fromJust)

main :: IO ()
main = do
  print (iso8601(fromJust (date_parse 1 1 19170)))
