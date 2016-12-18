module Mathbox.Class.Operator.Clamp where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type ClampG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , source               :: a T.Select
  }

type Clamp = ClampG Field MaybeField

type JsClamp =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , source               :: Field T.JsSelect
  }

mkClamp :: Clamp
mkClamp =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , source               : Val $ T.mkSelect0
  }

clampToJs :: Clamp -> JsClamp
clampToJs c =
  { id                   : toNullable c.id
  , classes              : map T.classesToJs c.classes
  , source               : map T.selectToJs c.source
  }
