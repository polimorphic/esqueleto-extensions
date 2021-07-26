{-# LANGUAGE MultiParamTypeClasses, OverloadedStrings #-}

module Database.Esqueleto.Datetime (dateTrunc) where

import Data.Time (UTCTime)
import Database.Esqueleto (SqlExpr, SqlString, Value)
import Database.Esqueleto.Internal.Sql (unsafeSqlFunction)

dateTrunc :: (SqlString a)
           => SqlExpr (Value a) -> SqlExpr (Value UTCTime) -> SqlExpr (Value UTCTime)
dateTrunc a b = unsafeSqlFunction "date_trunc" (a, b)
infixl 2 `dateTrunc`
