{-# LANGUAGE MultiParamTypeClasses, OverloadedStrings #-}

module Database.Esqueleto.Unaccent (unaccent) where

import Database.Esqueleto (SqlExpr, SqlString, Value)
import Database.Esqueleto.Internal.Sql (unsafeSqlFunction)

unaccent :: SqlString a => SqlExpr (Value a) -> SqlExpr (Value a)
unaccent a = unsafeSqlFunction "unaccent" a