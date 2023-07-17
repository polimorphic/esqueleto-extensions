{-# LANGUAGE MultiParamTypeClasses, OverloadedStrings #-}

module Database.Esqueleto.Vector ((<#>)) where

import Database.Esqueleto (SqlExpr, Value)
import Database.Esqueleto.Internal.Internal (unsafeSqlBinOp)
import Database.Persist.Vector (PgVector)

(<#>) :: SqlExpr (Value (PgVector n)) -> SqlExpr (Value (PgVector n)) -> SqlExpr (Value Double)
(<#>) a = unsafeSqlBinOp "<->" a
infixl 7 <#>
