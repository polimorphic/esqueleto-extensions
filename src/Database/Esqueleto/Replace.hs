{-# LANGUAGE MultiParamTypeClasses, OverloadedStrings #-}

module Database.Esqueleto.Replace (regexpReplace) where

import Database.Esqueleto (SqlExpr, SqlString, Value)
import Database.Esqueleto.Internal.Internal (unsafeSqlFunction)

regexpReplace :: (SqlString s)
              => SqlExpr (Value s) -> SqlExpr (Value s) -> SqlExpr (Value s) -> SqlExpr (Value s)
              -> SqlExpr (Value s)
regexpReplace a b c d = unsafeSqlFunction "regexp_replace" (a, b, c, d)
