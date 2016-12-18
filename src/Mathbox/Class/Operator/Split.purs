module Mathbox.Class.Operator.Split where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type SplitG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , source               :: a T.Select
  , order                :: a T.Transpose
  , axis                 :: b T.Axis
  , length               :: a Int
  , overlap              :: a Int
  }

type Split = SplitG Field MaybeField

type JsSplit =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , source               :: Field T.JsSelect
  , order                :: Field T.JsTranspose
  , axis                 :: Nullable (Field T.JsAxis)
  , length               :: Field Int
  , overlap              :: Field Int
  }

mkSplit :: Split
mkSplit =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , source               : Val $ T.mkSelect0
  , order                : Val $ T.mkTranspose T.wxyz
  , axis                 : Nothing
  , length               : Val $ 1
  , overlap              : Val $ 0
  }

splitToJs :: Split -> JsSplit
splitToJs s =
  { id                   : toNullable s.id
  , classes              : map T.classesToJs s.classes
  , source               : map T.selectToJs s.source
  , order                : map T.transposeToJs s.order
  , axis                 : maybeToNullable T.axisToJs s.axis
  , length               : s.length
  , overlap              : s.overlap
  }
