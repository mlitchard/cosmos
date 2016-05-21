{-# LANGUAGE OverloadedStrings #-}
module Types.Game.Common.Atomic
  ( Orbit
  , makeOrbit
  , PlanetName     (..)
  , PInt
  , toPInt
  , fromPInt
  , AID
  , makeAID            
  , SID
  , makeSID
  , CID
  , makeCID
  , SPID
  , makeSPID         
  , Service        (..)
  , Price
  , Menu           (..)
  , ResourceName   (..)
  , RefuelTimer    (..)
  , ToPlanetName   (..)
  , FromPlanetName (..)
  , WarpSpeed      (..)
  , Weapon         (..)
  , Engine         (..)
  , ShieldSize     (..)
  , Hull           (..)
  , CargoSize      (..)
  ) where

import ClassyPrelude
import Control.Applicative (Const (..))

data PlanetName 
  = Vulcan
  | Mongo
  | Arrakis
  | Dantooine
  | Tatooine
  | VoidlessVoid
  deriving (Ord,Eq,Enum,Bounded)

newtype ToPlanetName   = ToPlanetName PlanetName deriving (Ord,Eq,Show)

newtype FromPlanetName = FromPlanetName PlanetName deriving (Ord,Eq,Show)

instance Show PlanetName where
  show Vulcan       = "vulcan"
  show Mongo        = "mongo"
  show Arrakis      = "arrakis"
  show Dantooine    = "dantooine"
  show Tatooine     = "tatooine"
  show VoidlessVoid = "voidless_void"

newtype Orbit = Orbit (Int,Int,Int) deriving Show

makeOrbit :: (Int, Int, Int) -> Either Text Orbit
makeOrbit (x,y,z)
  | xChecks && yChecks && zChecks = Right $ Orbit (x,y,z)
  | otherwise                     = Left errMSG
  where
    xChecks = (x == -1 || x == 0 || x == 1)
    yChecks = (y == -1 || y == 0 || y == 1)
    zChecks = (z == -1 || z == 0 || z == 1)
    errMSG  = "Each value must be either -1, 0 or 1"

data Timer
  = Bool
  | Countdown PInt
  deriving Show

newtype AgentIdentifier b = AgentIdentifier (Const PInt b) 
  deriving (Eq, Ord)
type AID = AgentIdentifier PInt

makeAID :: PInt -> AID
makeAID p_int = AgentIdentifier (Const p_int)

newtype ShipIdentifier b = ShipIdentifier (Const PInt b) 
  deriving (Eq, Ord)
type SID = ShipIdentifier PInt

makeSID :: PInt -> SID
makeSID s_int = ShipIdentifier (Const s_int)

newtype CelestialIdentifier b = CelestialIdentifier (Const PInt b) 
  deriving (Eq, Ord)
type CID = CelestialIdentifier PInt

makeCID :: PInt -> CID
makeCID c_int = CelestialIdentifier (Const c_int)

newtype SpaceIdentifier b = SpaceIdentifier (Const PInt b)
  deriving (Eq, Ord)
type SPID = SpaceIdentifier PInt

makeSPID :: PInt -> SPID
makeSPID sp_int = SpaceIdentifier (Const sp_int)

data Service 
  = Shields
  | Engine
  | Hull
  deriving Show

type Price = PInt 

data Menu
  = PurpleHaze
  | Beer
    deriving Show

data WarpSpeed
  = Turtle
  | Grandpa
  | Chuggin
  | SpeedBuggy
  | ZoomZoomZoom
  deriving (Enum,Eq,Ord)

data ResourceName
  = FinestGreen
  | SubstanceD
  | BabyBlue
  | Melange
  | InterzoneSpecial
  deriving (Ord,Eq,Enum,Bounded)

instance Show ResourceName where
  show BabyBlue         = "baby_blue"
  show FinestGreen      = "finest_green"
  show SubstanceD       = "substance_d"
  show Melange          = "melange"
  show InterzoneSpecial = "interzone_special"


data Weapon
  = PEASHOOTER
  | HITCHSLAP
  | OKAYCANNON
  | DIRTYHARRY
  | KILLMACHINE
  deriving (Enum,Show)

data Engine
  = HAMSTERPOWER
  | HERBIEPOWER
  | PINTOPOWER
  | BIGHONKINGENGINE
  | ARNOLDPOWER
  deriving (Enum,Show)

data Hull
  = PaperPlates
  | TinFoil
  | StayFast
  | Elephunt
  | Rhinoceros
  deriving (Show,Enum)

data ShieldSize
  = GlowWorm
  | FlashLight
  | NotBad
  | ShallNotPass
  | NoYieldShield
  deriving (Enum,Show)

data CargoSize
  = ShoeBox
  | Closet
  | Trunk
  | Garage
  | AllTheThings
  deriving (Enum,Show)

data TankSize
  = DixieCup
  | MudPuddle
  | DayTrip
  | Tanker
  | NvrEmpty
  deriving (Enum,Show)

newtype PInt = PInt Int deriving (Read)

instance Num PInt where
  x - y = x `truncSub` y
            where
              truncSub (PInt x') (PInt y')
                | y' > x'     = PInt 0
                | otherwise = PInt (x' - y')

  x + y = PInt (fromPInt x + fromPInt y)

  x * y = PInt (fromPInt x * fromPInt y)

  abs x = x

  signum _ = 1

  fromInteger x = PInt (fromInteger x)

instance Eq PInt where
   x == y = fromPInt x == fromPInt y
   x /= y = fromPInt x /= fromPInt y

instance Ord PInt where
   x <= y = fromPInt x <= fromPInt y
   x < y         = fromPInt x < fromPInt y
   x > y         = fromPInt x > fromPInt y

instance Show PInt where
   show = show . fromPInt 

fromPInt :: PInt -> Int
fromPInt (PInt a) = a

toPInt :: Int -> PInt
toPInt x
  | x <= 0    = 0
  | otherwise = PInt x
