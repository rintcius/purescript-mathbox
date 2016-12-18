module Mathbox.Class.Operator.Join where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type JoinG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , source               :: a T.Select
  , order                :: a T.Transpose
  , axis                 :: b T.Axis
  , overlap              :: a Int
  }

type Join = JoinG Field MaybeField

type JsJoin =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , source               :: Field T.JsSelect
  , order                :: Field T.JsTranspose
  , axis                 :: Nullable (Field T.JsAxis)
  , overlap              :: Field Int
  }

mkJoin :: Join
mkJoin =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , source               : Val $ T.mkSelect0
  , order                : Val $ T.mkTranspose T.wxyz
  , axis                 : Nothing
  , overlap              : Val $ 0
  }

joinToJs :: Join -> JsJoin
joinToJs j =
  { id                   : toNullable j.id
  , classes              : map T.classesToJs j.classes
  , source               : map T.selectToJs j.source
  , order                : map T.transposeToJs j.order
  , axis                 : maybeToNullable T.axisToJs j.axis
  , overlap              : j.overlap
  }
