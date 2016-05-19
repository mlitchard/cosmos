module Types.Game.Composite
  ( Planet         (..)
  , PPOI           (..)
  , RefuelingDepot (..)
  , ShipStore      (..)
  , ShipRepair     (..)
  , Cantina        (..)
  ) where

import Types.Game.Atomic
import Data.Text

data Planet = Planet
  { landings         :: [(Orbit,PPOI)]
  , players_in_orbit :: [(Orbit,AID)]
  , residents        :: [(AID,PPOI)]
  , neighbors        :: [PlanetName]
  } 

data PPOI = RF_Depot RefuelingDepot
          | SR ShipRepair
          | SS ShipStore
          | CAN Cantina

data RefuelingDepot = RefuelingDepot
  { desc_rd :: Text
  , fuel    :: PInt
  , timer   :: RefuelTimer
  } deriving Show

data ShipRepair = ShipRepair
  { desc_sr  :: Text
  , services :: [(Service,Price)]
  } deriving Show

data ShipStore = ShipStore
  { desc_ss   :: Text
  , inventory :: [(Inventory,Price)]
  } deriving Show
    
data Cantina = Cantina
  { desc_can :: Text
  , menu     :: [(Menu,Price)]
  }
