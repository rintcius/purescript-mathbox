module Mathbox.Class.Present.Present where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type PresentG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , index                :: a Int
  , directed             :: a T.Bool
  , length               :: a Number
  }

type Present = PresentG Field MaybeField

type JsPresent =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , index                :: Field Int
  , directed             :: Field T.Bool
  , length               :: Field Number
  }

mkPresent :: Present
mkPresent =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , index                : Val $ 1
  , directed             : Val $ true
  , length               : Val $ 0.0
  }

presentToJs :: Present -> JsPresent
presentToJs p =
  { id                   : toNullable p.id
  , classes              : map T.classesToJs p.classes
  , index                : p.index
  , directed             : p.directed
  , length               : p.length
  }
