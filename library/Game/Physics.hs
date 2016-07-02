{- |
   Module     : Game.Physics
   Copyright  : Copyright (c) 2016 Michael Litchard
   License    : MIT
 
   Maintainer : Michael Litchard
   Stability  : experimental
   Portability: not portable
                            
   This module provides the functions describing the physics.
                                                
-}

module Game.Physics 
  ( Speed
  , direction
  , position
  , Position (..)
  , Target   (..)
  , ) where

import           Data.Vector.V3
import           Data.Vector.Class
type Speed = Scalar

newtype Target = Target Vector3 deriving Show

newtype Position = Position Vector3 deriving Show

newtype Direction = Direction Vector3 deriving Show

direction :: Position -> Target -> Direction
direction (Position pos) (Target tar) =
  Direction $ vnormalise $ tar - pos

position :: Position -> Direction -> Scalar -> Position
position (Position position) (Direction direction) speed =
  Position $ velocity + position
  where
    velocity = direction |* speed

