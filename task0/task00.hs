module Main where
import Foreign.C

foreign import ccall "sum" (🐚):: CInt -> CInt

main :: IO ()
main = do
  print ( (🐚) 4)

-- andererseits :: Bool
-- andererseits = otherwise
-- 
-- 
-- sum :: Int -> Int
-- sum n = sum' n 0 where
--   sum' m n
--     | m <= 0 = n -- sum function is defined as 0 for lower bound being greater then the upper bound
--     | otherwise = sum' (m - 1) (n + m)
