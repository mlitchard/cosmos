module Data 
  ( nouns
  , verbs
  , determiners
  , prepositions
  , adjectives
  , actors
  , numbers
  ) where

import qualified Data.HashSet as HS
import Data.Semigroup ((<>))

nouns, verbs, determiners, adjectives, numbers :: HS.HashSet String

nouns        = HS.fromList (planets <> ships <> resources <> misc)
planets      = ["mongo", "vulcan","tatooine","arrakis","dantooine","tatooine",
                "voidless_void"]
ships        = ["ship","corsair","freighter","barge"]
resources    = ["finest_green","baby_blue", "special_d"]
misc         = []

verbs        = HS.fromList ["move","shoot","report","buy","sell","refuel","cloak"]

determiners  = HS.fromList ["that","this","the", "a","my","me"]

prepositions = HS.fromList ["to","with","in","when","under","over","above"]

adjectives   = HS.fromList ["blue","red","great","long","old","drunk","plant","pot"]

numbers      = HS.fromList $ map show [1 .. 5000]
actors       = HS.fromList ["Ford","William"]
