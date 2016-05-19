{-# LANGUAGE RecursiveDo #-}

module Types.Parser.Types
  ( Imperative   (..)
  , VerbPhrase (..)
  , NounPhrase (..)
  , PrepPhrase (..)
  , AdjPhrase  (..)
  , Noun
  , Verb
  , Determiner
  , Preposition
  , Adjective
  ) where


data Imperative = Type1 VerbPhrase NounPhrase
                | Type2 VerbPhrase PrepPhrase
                | Type3 VerbPhrase NounPhrase PrepPhrase
                | ImperativeClause Verb
                  deriving Show

type Noun        = String
type Verb        = String
type Determiner  = String
type Preposition = String
type Adjective   = String
type Number      = String

data VerbPhrase = VerbPhrase1 Verb NounPhrase
                | Verb Verb
  deriving Show

data NounPhrase = NounPhrase1 Determiner NounPhrase
                | NounPhrase2 Determiner AdjPhrase NounPhrase
                | NounPhrase3 Number Noun
                | Noun Noun
                   deriving Show

data PrepPhrase = PrepPhrase Preposition NounPhrase
                | Preposition Preposition
                   deriving Show

data AdjPhrase = Adjective Adjective
                 deriving Show
