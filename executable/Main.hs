module Main where

import Text.Earley
import Types.Parser.Types
import Data
import Recognizer

main :: IO ()
main = do
  let p = fullParses (parser sentence) . words
  print $ p "plant the pot plant in the plant pot"
  
  
