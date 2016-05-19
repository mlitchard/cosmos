{-# LANGUAGE RecursiveDo #-}
module Recognizer (imperative) where

import           Text.Earley

import           Control.Applicative
import qualified Data.HashSet as HS

import           Types.Parser.Types
import           Data

imperative :: Grammar r (Prod r String String Imperative)
imperative = mdo
  noun       <- rule $ satisfy (`HS.member` nouns)      <?> "noun"
  verb       <- rule $ satisfy (`HS.member` verbs)      <?> "verb"
  determiner  <- rule $ satisfy (`HS.member` determiners) <?> "determiner"
  adjective   <- rule $ satisfy (`HS.member` adjectives) <?> "adjective"
  preposition <- rule $ satisfy (`HS.member` prepositions) <?> "preposition"
  number      <- rule $ satisfy (`HS.member` numbers) <?> "number"
  nounPhrase <- rule $  NounPhrase1 <$> determiner <*> nounPhrase
                    <|> NounPhrase2 <$> determiner <*> adjPhrase <*> nounPhrase
                    <|> NounPhrase3 <$> number <*> noun
                    <|> Noun <$> noun
                    <?> "noun phrase"
  verbPhrase <- rule $  VerbPhrase1 <$> verb <*> nounPhrase
                    <|> Verb <$> verb
                    <?> "verb phrase"
  prepPhrase <- rule $ PrepPhrase <$> preposition <*> nounPhrase
                    <|> Preposition <$> preposition
                    <?> "prep phrase"
  adjPhrase <- rule $ Adjective <$> adjective
                   <?> "adjective"
  
  return $ Type1    <$> verbPhrase <*> nounPhrase
        <|> Type2   <$> verbPhrase <*> prepPhrase
        <|> Type3   <$> verbPhrase <*> nounPhrase <*> prepPhrase
        <|> ImperativeClause <$> verb
  

