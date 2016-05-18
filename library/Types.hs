module Types 
  ( Sentence         (..)
  , SentenceFragment (..)
  , NounPhrase       (..)
  , VerbPhrase       (..)
  , PrepPhrase       (..)
  , Noun,Actor,Verb,Determiner,Preposition,Adjective
  ) where

type Noun        = String
type Actor       = String
type Verb        = String
type Determiner  = String
type Preposition = String
type Adjective   = String

data Sentence = 
    Type1_S VerbPhrase SentenceFragment
  | Type2_S Actor VerbPhrase SentenceFragment
      deriving Show

data SentenceFragment =
    Type1_SF NounPhrase
  | Type2_SF PrepPhrase NounPhrase
      deriving Show

data VerbPhrase =
    VerbPhrase Verb NounPhrase    
  | Verb Verb 
      deriving Show

data NounPhrase = 
    Type1_NP Determiner NounPhrase
  | Type2_NP Adjective NounPhrase
  | Type3_NP Noun
      deriving Show

data PrepPhrase = PrepPhrase Preposition NounPhrase deriving Show
                
                 




