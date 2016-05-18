{-# LANGUAGE RecursiveDo #-}

module Types.Parser.Types
  ( Sentence   (..)
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


data Sentence = Type1 VerbPhrase NounPhrase
              | Type2 VerbPhrase PrepPhrase
              | Command Verb
                 deriving Show

type Noun        = String
type Verb        = String
type Determiner  = String
type Preposition = String
type Adjective   = String

data VerbPhrase = VerbPhrase1 Verb NounPhrase
                | Verb Verb
  deriving Show

data NounPhrase = NounPhrase1 Determiner NounPhrase
                | NounPhrase2 Determiner AdjPhrase NounPhrase
                | Noun Noun
                   deriving Show

data PrepPhrase = PrepPhrase Preposition NounPhrase
                | Preposition Preposition
                   deriving Show

data AdjPhrase = Adjective Adjective
                 deriving Show
