{-# LANGUAGE MultiParamTypeClasses, OverloadedStrings #-}

module Database.Esqueleto.Conditional
    ( greatest_
    ) where

import Database.Esqueleto (SqlExpr, Value)
import Database.Esqueleto.Internal.Internal (unsafeSqlFunction)
import Database.Persist.Class (PersistField)

greatest_ :: (PersistField a) => [SqlExpr (Value a)] -> SqlExpr (Value a)
greatest_ = unsafeSqlFunction "GREATEST"
