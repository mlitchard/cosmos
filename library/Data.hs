module Data 
  ( nouns
  , verbs
  , determiners
  , prepositions
  , adjectives
  , actors
  ) where

import qualified Data.HashSet as HS
import Data.Semigroup ((<>))

nouns, verbs, determiners, adjectives :: HS.HashSet String

nouns        = HS.fromList (planets <> ships <> resources <> misc)
planets      = ["mongo", "vulcan","tatooine"]
ships        = ["corsair","freighter","barge"]
resources    = ["finest green","Baby blue", "Special D"]
misc         = []

verbs        = HS.fromList ["move","shoot","report","buy","sell","refuel","cloak"]

determiners  = HS.fromList ["that","this","the", "a","my","me"]

prepositions = HS.fromList ["with","in","when","under","over","above"]

adjectives   = HS.fromList ["blue","red","great","long","old","drunk","plant","pot"]

actors       = HS.fromList ["Ford","William"]
