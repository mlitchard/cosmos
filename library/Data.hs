{-# LANGUAGE OverloadedStrings #-}
module Data 
  ( nouns
  , verbs
  , determiners
  , prepositions
  , adjectives
  , actors
  , numbers
  ) where

import ClassyPrelude

import qualified Data.HashSet as HS

nouns, verbs, prepositions, determiners, adjectives, numbers,actors :: HS.HashSet Text

planets, ships, resources, misc :: [Text]

nouns        = HS.fromList (planets <> ships <> resources <> misc)
planets      = ["mongo", "vulcan","tatooine","arrakis","dantooine","tatooine",
                "voidless_void"] :: [Text]
ships        = ["ship","corsair","freighter","barge"] :: [Text]
resources    = ["finest_green","baby_blue", "special_d"] :: [Text]
misc         = []

verbs        = 
  HS.fromList  
  (["look","move","shoot","report","buy","sell","refuel","cloak"] :: [Text])

determiners  = HS.fromList (["that","this","the", "a","my","me"] :: [Text])

prepositions = 
  HS.fromList (["to","with","in","when","under","over","above"] :: [Text])

adjectives   =
  HS.fromList
  (["blue","red","great","long","old","drunk","plant","pot"] :: [Text])

numbers      = HS.fromList $ map (pack .show) ([1 .. 5000] :: [Int])
actors       = HS.fromList (["Ford","William"] :: [Text])
