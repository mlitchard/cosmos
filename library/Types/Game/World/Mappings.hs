module Types.Game.World.Mappings
  () where

import ClassyPrelude

import qualified Data.Map.Strict as M

import           Types.Game.Common.Atomic
import           Types.Game.World.Objects

newtype SpaceMap = SpaceMap (M.Map SPID OuterSpace)

newtype ShipMap = ShipMap M.Map SID Ship

newtype CelestialMap = CelestialMap CID Celestial

data CelestialObjectID 
  = InteractivesCEL Interactives
  | LocationCEL LID

data Interactives 
  = ShipINT SID
    
data LocationMap = LocationMap LID Location

-- data OuterSpace 
--  = LocationSP (Octree SpaceObjectID)
--  | ObjectMapSP (M.Map SpaceObjectID SpaceObject) 

