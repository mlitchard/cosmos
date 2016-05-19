{-# LANGUAGE OverloadedStrings #-}
module Types.Game.Atomic
  ( Orbit
  , makeOrbit
  , PlanetName  (..)
  , PInt
  , toPInt
  , fromPInt
  , AgentIdentifier
  , AID         
  , Service     (..)
  , Price
  , Menu        (..)
  , Inventory   (..)
  , RefuelTimer (..)     
  ) where

import Control.Applicative (Const (..))
import Data.Text           (Text)

data PlanetName 
  = Vulcan
  | Mongo
  | Arrakis
  | Dantooine
  | Tatooine
  | VoidlessVoid
  deriving (Ord,Eq,Enum,Bounded)

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

data RefuelTimer
  = Bool
  | Countdown PInt
  deriving Show

newtype AgentIdentifier a = AgentIdentifier (a -> Const a PInt) 
type AID = AgentIdentifier PInt

data Service 
  = Shields
  | Engine
  | Hull
  deriving Show

type Price = PInt 

data Inventory 
  = BabyBlue
  | FinestGreen
  | SpecialD

data Menu
  = PurpleHaze
  | Beer
    deriving Show

instance Show Inventory where
  show BabyBlue    = "baby_blue"
  show FinestGreen = "finest_green"
  show SpecialD    = "special_d"
             
newtype PInt = PInt Int deriving (Read)

instance Num PInt where
  x - y = x `truncSub` y
            where
              truncSub (PInt x) (PInt y)
                | y > x     = PInt 0
                | otherwise = PInt (x - y)

  x + y = PInt (fromPInt x + fromPInt y)

  x * y = PInt (fromPInt x * fromPInt y)

  abs x = x

  signum x = 1

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
