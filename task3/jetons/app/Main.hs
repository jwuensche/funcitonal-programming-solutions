module Main where
import Text.Printf
import Lib (value, Jeton(Red, Green, Blue, Silver, Gold), payoff,)



main :: IO ()
main = do
  printf "%d \n" (value Red)
  printf "%d \n" (payoff [Red,Green,Blue,Gold])
