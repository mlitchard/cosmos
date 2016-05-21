{-# LANGUAGE OverloadedStrings #-}
module Main where

import ClassyPrelude
import Text.Earley
import Recognizer

main :: IO ()
main = do
  let p = allParses (parser imperative) . words
  print $ p "refuel ship"
  print $ p "move ship to mongo"
  print $ p "buy 100 finest_green"
  print $ p "buy shizzle"
  
  
