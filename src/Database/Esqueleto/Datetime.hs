{-# LANGUAGE MultiParamTypeClasses, OverloadedStrings #-}

module Database.Esqueleto.Datetime (dateTrunc, dateTruncM, extractEpoch, generateSeries) where

import Data.Time (UTCTime)
import Database.Esqueleto (SqlExpr, SqlString, SqlQuery, Value)
import Database.Esqueleto.Internal.Internal (unsafeSqlBinOp, unsafeSqlCastAs, unsafeSqlFunction, val)

dateTrunc :: (SqlString a)
           => SqlExpr (Value a) -> SqlExpr (Value UTCTime) -> SqlExpr (Value UTCTime)
dateTrunc a b = unsafeSqlFunction "date_trunc" (a, b)
infixl 2 `dateTrunc`

dateTruncM :: (SqlString a)
           => SqlExpr (Value a) -> SqlExpr (Value (Maybe UTCTime))
           -> SqlExpr (Value (Maybe UTCTime))
dateTruncM a b = unsafeSqlFunction "date_trunc" (a, b)
infixl 2 `dateTruncM`

extractEpoch :: SqlExpr (Value UTCTime) -> SqlExpr (Value Int)
extractEpoch t = unsafeSqlFunction "extract" (unsafeSqlBinOp " from " (val "epoch") t)

generateSeries ::(SqlString a) =>  SqlExpr (Value UTCTime) -> SqlExpr (Value UTCTime)
               -> SqlExpr (Value a) -> SqlQuery (SqlExpr (Value UTCTime))
generateSeries begin end interval = 
    pure $ unsafeSqlFunction "generate_series" (begin, end, unsafeSqlCastAs "INTERVAL" interval)
