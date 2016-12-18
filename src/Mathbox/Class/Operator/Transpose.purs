module Mathbox.Class.Operator.Transpose where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type TransposeG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , source               :: a T.Select
  , order                :: a T.Transpose
  }

type Transpose = TransposeG Field MaybeField

type JsTranspose =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , source               :: Field T.JsSelect
  , order                :: Field T.JsTranspose
  }

mkTranspose :: Transpose
mkTranspose =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , source               : Val $ T.mkSelect0
  , order                : Val $ T.mkTranspose0
  }

transposeToJs :: Transpose -> JsTranspose
transposeToJs t =
  { id                   : toNullable t.id
  , classes              : map T.classesToJs t.classes
  , source               : map T.selectToJs t.source
  , order                : map T.transposeToJs t.order
  }
