{-# LANGUAGE RecursiveDo #-}
module Recognizer (sentence) where

import           Text.Earley

import           Control.Applicative
import qualified Data.HashSet as HS

import           Types.Parser.Types
import           Data

sentence :: Grammar r (Prod r String String Sentence)
sentence = mdo
  noun       <- rule $ satisfy (`HS.member` nouns)      <?> "noun"
  verb       <- rule $ satisfy (`HS.member` verbs)      <?> "verb"
  determiner  <- rule $ satisfy (`HS.member` determiners) <?> "determiner"
  adjective   <- rule $ satisfy (`HS.member` adjectives) <?> "adjective"
  preposition <- rule $ satisfy (`HS.member` prepositions) <?> "preposition"
  nounPhrase <- rule $  NounPhrase1 <$> determiner <*> nounPhrase
                    <|> NounPhrase2 <$> determiner <*> adjPhrase <*> nounPhrase
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
  return $ Type1    <$> verbPhrase  <*> nounPhrase
        <|> Type2   <$> verbPhrase  <*> prepPhrase
        <|> Command <$> verb
  

