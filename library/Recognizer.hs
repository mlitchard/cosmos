{-# LANGUAGE RecursiveDo #-}

module Recognizer (imperative) where

import           ClassyPrelude

import qualified Data.HashSet as HS
import           Text.Earley

import           Types.Parser.Types
import           Data

imperative :: Grammar r (Prod r Text Text Imperative)
imperative = mdo
  noun       <- rule $ satisfy (`HS.member` nouns)
                    <?> (pack "noun")

  verb       <- rule $ satisfy (`HS.member` verbs)
                    <?> (pack "verb")

  determiner <- rule $ satisfy (`HS.member` determiners) 
                    <?> (pack "determiner")

  adjective   <- rule $ satisfy (`HS.member` adjectives) 
                     <?> (pack "adjective" )

  preposition <- rule $ satisfy (`HS.member` prepositions) 
                     <?> (pack "preposition")

  number      <- rule $ satisfy (`HS.member` numbers) 
                     <?> (pack "number")

  nounPhrase <- rule $  NounPhrase1 <$> determiner <*> nounPhrase
                    <|> NounPhrase2 <$> determiner <*> adjPhrase <*> nounPhrase
                    <|> NounPhrase3 <$> number <*> noun
                    <|> Noun <$> noun
                    <?> (pack "noun phrase")
  verbPhrase <- rule $  VerbPhrase1 <$> verb <*> nounPhrase
                    <|> Verb <$> verb
                    <?> (pack "verb phrase")
  prepPhrase <- rule $ PrepPhrase <$> preposition <*> nounPhrase
                    <|> Preposition <$> preposition
                    <?> (pack "prep phrase")
  adjPhrase <- rule $ Adjective <$> adjective
                   <?> (pack "adjective")
  
  return $ Type1    <$> verbPhrase <*> nounPhrase
        <|> Type2   <$> verbPhrase <*> prepPhrase
        <|> Type3   <$> verbPhrase <*> nounPhrase <*> prepPhrase
        <|> ImperativeClause <$> verb
