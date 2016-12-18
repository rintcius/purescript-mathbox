module Mathbox.Class.Time.Now where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type NowG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , now                  :: b T.Timestamp
  , seek                 :: b Number
  , pace                 :: a Number
  , speed                :: a Number
  }

type Now = NowG Field MaybeField

type JsNow =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , now                  :: Nullable (Field T.JsTimestamp)
  , seek                 :: Nullable (Field Number)
  , pace                 :: Field Number
  , speed                :: Field Number
  }

mkNow :: Now
mkNow =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , now                  : Nothing
  , seek                 : Nothing
  , pace                 : Val $ 1.0
  , speed                : Val $ 1.0
  }

nowToJs :: Now -> JsNow
nowToJs n =
  { id                   : toNullable n.id
  , classes              : map T.classesToJs n.classes
  , now                  : maybeToNullable T.timestampToJs n.now
  , seek                 : toNullable n.seek
  , pace                 : n.pace
  , speed                : n.speed
  }
