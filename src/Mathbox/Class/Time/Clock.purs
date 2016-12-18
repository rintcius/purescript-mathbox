module Mathbox.Class.Time.Clock where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type ClockG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , seek                 :: b Number
  , delay                :: a Number
  , pace                 :: a Number
  , speed                :: a Number
  , from                 :: a Number
  , to                   :: a Number
  , realtime             :: a T.Bool
  , loop                 :: a T.Bool
  }

type Clock = ClockG Field MaybeField

type JsClock =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , seek                 :: Nullable (Field Number)
  , delay                :: Field Number
  , pace                 :: Field Number
  , speed                :: Field Number
  , from                 :: Field Number
  , to                   :: Field Number
  , realtime             :: Field T.Bool
  , loop                 :: Field T.Bool
  }

mkClock :: Clock
mkClock =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , seek                 : Nothing
  , delay                : Val $ 0.0
  , pace                 : Val $ 1.0
  , speed                : Val $ 1.0
  , from                 : Val $ 0.0
  , to                   : Val $ T.infinity
  , realtime             : Val $ false
  , loop                 : Val $ false
  }

clockToJs :: Clock -> JsClock
clockToJs c =
  { id                   : toNullable c.id
  , classes              : map T.classesToJs c.classes
  , seek                 : toNullable c.seek
  , delay                : c.delay
  , pace                 : c.pace
  , speed                : c.speed
  , from                 : c.from
  , to                   : c.to
  , realtime             : c.realtime
  , loop                 : c.loop
  }
