module Mathbox.Class.Base.Unit where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type UnitG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , scale                :: b Number
  , fov                  :: b Number
  , focus                :: b Number
  }

type Unit = UnitG Field MaybeField

type JsUnit =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , scale                :: Nullable (Field Number)
  , fov                  :: Nullable (Field Number)
  , focus                :: Nullable (Field Number)
  }

mkUnit :: Unit
mkUnit =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , scale                : Nothing
  , fov                  : Nothing
  , focus                : Nothing
  }

unitToJs :: Unit -> JsUnit
unitToJs u =
  { id                   : toNullable u.id
  , classes              : map T.classesToJs u.classes
  , scale                : toNullable u.scale
  , fov                  : toNullable u.fov
  , focus                : toNullable u.focus
  }
