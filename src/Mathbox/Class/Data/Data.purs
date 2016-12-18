module Mathbox.Class.Data.Data where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type DataG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , data                 :: b T.Data
  , expr                 :: b T.Emitter
  , bind                 :: b T.Func
  , live                 :: a T.Bool
  , active               :: a T.Bool
  }

type Data = DataG Field MaybeField

type JsData =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , data                 :: Nullable (Field T.Data)
  , expr                 :: Nullable (Field T.Emitter)
  , bind                 :: Nullable (Field T.Func)
  , live                 :: Field T.Bool
  , active               :: Field T.Bool
  }

mkData :: Data
mkData =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , data                 : Nothing
  , expr                 : Nothing
  , bind                 : Nothing
  , live                 : Val $ true
  , active               : Val $ true
  }

dataToJs :: Data -> JsData
dataToJs d =
  { id                   : toNullable d.id
  , classes              : map T.classesToJs d.classes
  , data                 : toNullable d.data
  , expr                 : toNullable d.expr
  , bind                 : toNullable d.bind
  , live                 : d.live
  , active               : d.active
  }
