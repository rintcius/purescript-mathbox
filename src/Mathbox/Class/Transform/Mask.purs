module Mathbox.Class.Transform.Mask where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type MaskG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , shader               :: a T.Select
  }

type Mask = MaskG Field MaybeField

type JsMask =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , shader               :: Field T.JsSelect
  }

mkMask :: Mask
mkMask =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , shader               : Val $ T.mkSelect0
  }

maskToJs :: Mask -> JsMask
maskToJs m =
  { id                   : toNullable m.id
  , classes              : map T.classesToJs m.classes
  , shader               : map T.selectToJs m.shader
  }
