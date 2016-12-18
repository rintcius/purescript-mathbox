module Mathbox.Class.Present.Play where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type PlayG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , target               :: a T.Select
  , script               :: a T.Object
  , ease                 :: a T.Ease
  , trigger              :: b Int
  , delay                :: a Number
  , pace                 :: a Number
  , speed                :: a Number
  , from                 :: a Number
  , to                   :: a Number
  , realtime             :: a T.Bool
  , loop                 :: a T.Bool
  }

type Play = PlayG Field MaybeField

type JsPlay =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , target               :: Field T.JsSelect
  , script               :: Field T.Object
  , ease                 :: Field T.JsEase
  , trigger              :: Nullable (Field Int)
  , delay                :: Field Number
  , pace                 :: Field Number
  , speed                :: Field Number
  , from                 :: Field Number
  , to                   :: Field Number
  , realtime             :: Field T.Bool
  , loop                 :: Field T.Bool
  }

mkPlay :: Play
mkPlay =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , target               : Val $ T.mkSelect0
  , script               : Val $ T.mkObject0
  , ease                 : Val $ T.EaseCosine
  , trigger              : Nothing
  , delay                : Val $ 0.0
  , pace                 : Val $ 1.0
  , speed                : Val $ 1.0
  , from                 : Val $ 0.0
  , to                   : Val $ T.infinity
  , realtime             : Val $ false
  , loop                 : Val $ false
  }

playToJs :: Play -> JsPlay
playToJs p =
  { id                   : toNullable p.id
  , classes              : map T.classesToJs p.classes
  , target               : map T.selectToJs p.target
  , script               : p.script
  , ease                 : map T.easeToJs p.ease
  , trigger              : toNullable p.trigger
  , delay                : p.delay
  , pace                 : p.pace
  , speed                : p.speed
  , from                 : p.from
  , to                   : p.to
  , realtime             : p.realtime
  , loop                 : p.loop
  }
