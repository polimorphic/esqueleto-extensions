{-# LANGUAGE MultiParamTypeClasses, OverloadedStrings #-}

module Database.Esqueleto.Datetime (dateTrunc, dateTruncM, generateSeries) where

import Data.Time (UTCTime)
import Database.Esqueleto (SqlExpr, SqlString, SqlQuery, Value)
import Database.Esqueleto.Internal.Internal (unsafeSqlCastAs, unsafeSqlFunction)

dateTrunc :: (SqlString a)
           => SqlExpr (Value a) -> SqlExpr (Value UTCTime) -> SqlExpr (Value UTCTime)
dateTrunc a b = unsafeSqlFunction "date_trunc" (a, b)
infixl 2 `dateTrunc`

dateTruncM :: (SqlString a)
           => SqlExpr (Value a) -> SqlExpr (Value (Maybe UTCTime))
           -> SqlExpr (Value (Maybe UTCTime))
dateTruncM a b = unsafeSqlFunction "date_trunc" (a, b)
infixl 2 `dateTruncM`

generateSeries ::(SqlString a) =>  SqlExpr (Value UTCTime) -> SqlExpr (Value UTCTime)
               -> SqlExpr (Value a) -> SqlQuery (SqlExpr (Value UTCTime))
generateSeries begin end interval = 
    pure $ unsafeSqlFunction "generate_series" (begin, end, unsafeSqlCastAs "INTERVAL" interval)
