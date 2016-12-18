module Mathbox.Class.Base.Group where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type GroupG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , visible              :: a T.Bool
  , active               :: a T.Bool
  }

type Group = GroupG Field MaybeField

type JsGroup =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , visible              :: Field T.Bool
  , active               :: Field T.Bool
  }

mkGroup :: Group
mkGroup =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , visible              : Val $ true
  , active               : Val $ true
  }

groupToJs :: Group -> JsGroup
groupToJs g =
  { id                   : toNullable g.id
  , classes              : map T.classesToJs g.classes
  , visible              : g.visible
  , active               : g.active
  }
