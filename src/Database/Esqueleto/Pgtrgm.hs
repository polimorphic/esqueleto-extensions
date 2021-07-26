{-# LANGUAGE MultiParamTypeClasses, OverloadedStrings #-}

module Database.Esqueleto.Pgtrgm (similarity, wordSimilarity) where

import Database.Esqueleto (SqlExpr, SqlString, Value)
import Database.Esqueleto.Internal.Sql (unsafeSqlFunction)

similarity :: (SqlString a, SqlString b)
           => SqlExpr (Value a) -> SqlExpr (Value b) -> SqlExpr (Value Double)
similarity a b = unsafeSqlFunction "similarity" (a, b)
infixl 2 `similarity`

wordSimilarity :: (SqlString a, SqlString b)
               => SqlExpr (Value a) -> SqlExpr (Value b) -> SqlExpr (Value Double)
wordSimilarity a b = unsafeSqlFunction "word_similarity" (a, b)
infixl 2 `wordSimilarity`
