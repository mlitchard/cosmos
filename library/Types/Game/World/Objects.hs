module Types.Game.World.Objects
  ( --OuterSpace     (..)
    Celestial      (..)
  , CelestialSpace (..)
--  , Location       (..)
  , PPOI           (..)
  , RefuelingDepot (..)
  , ShipRepair     (..)
  , ShipStore      (..)
  , Cantina        (..)
  ) where

import ClassyPrelude

import qualified Data.Map.Strict as M
import           Data.Octree
import           Types.Game.Common.Atomic

data SpaceObjectID
  = ShipSPID SID
  | CelestialID CID

data Celestial = Celestial
  { landings         :: [(Orbit,PPOI)]
  , players_in_orbit :: [(Orbit,AID)]
  , residents        :: [(AID,PPOI)]
  , neighbors        :: [PlanetName]
--  , map              :: LocationMap
  }

data CelestialSpace = CelestialSpace
  { agentsCS        :: [AID]
--  , locations     :: LocationMap
  , agent_history :: M.Map AID Timer
  }

-- data Location = Location
--  { agentsLOC       :: [AID]
--  , mobiles      :: [MID]
--  , description  :: Text
--  , interactives :: [IID]
--  }

data PPOI 
  = RF_Depot RefuelingDepot
  | SR ShipRepair
  | SS ShipStore
  | CAN Cantina

data RefuelingDepot = RefuelingDepot
  { desc_rd :: Text
  , fuel    :: PInt
--  , timer   :: RefuelTimer
  } deriving Show

data ShipRepair = ShipRepair
  { desc_sr  :: Text
  , services :: [(Service,Price)]
  } deriving Show

data ShipStore = ShipStore
  { desc_ss       :: Text
  , resource_name :: [(ResourceName,Price)]
  } deriving Show

data Cantina = Cantina
  { desc_can :: Text
  , menu     :: [(Menu,Price)]
  }

