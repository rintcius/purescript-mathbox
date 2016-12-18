module Mathbox.Class.Base.Parent where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type ParentG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  }

type Parent = ParentG Field MaybeField

type JsParent =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  }

mkParent :: Parent
mkParent =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  }

parentToJs :: Parent -> JsParent
parentToJs p =
  { id                   : toNullable p.id
  , classes              : map T.classesToJs p.classes
  }
