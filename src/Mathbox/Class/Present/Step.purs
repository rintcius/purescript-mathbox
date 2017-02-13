module Mathbox.Class.Present.Step where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type StepG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , target               :: a T.Select
  , script               :: a T.Object
  , ease                 :: a T.Ease
  , playback             :: a T.Ease
  , stops                :: b (Array Number)
  , delay                :: a Number
  , duration             :: a Number
  , pace                 :: a Number
  , speed                :: a Number
  , rewind               :: a Number
  , skip                 :: a T.Bool
  , realtime             :: a T.Bool
  , trigger              :: b Int
  }

type Step = StepG Field MaybeField

type JsStep =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , target               :: Field T.JsSelect
  , script               :: Field T.Object
  , ease                 :: Field T.JsEase
  , playback             :: Field T.JsEase
  , stops                :: Nullable (Field (Array Number))
  , delay                :: Field Number
  , duration             :: Field Number
  , pace                 :: Field Number
  , speed                :: Field Number
  , rewind               :: Field Number
  , skip                 :: Field T.Bool
  , realtime             :: Field T.Bool
  , trigger              :: Nullable (Field Int)
  }

mkStep :: Step
mkStep =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , target               : Val $ T.mkSelect0
  , script               : Val $ T.mkObject0
  , ease                 : Val $ T.EaseCosine
  , playback             : Val $ T.EaseLinear
  , stops                : Nothing
  , delay                : Val $ 0.0
  , duration             : Val $ 0.3
  , pace                 : Val $ 0.0
  , speed                : Val $ 1.0
  , rewind               : Val $ 2.0
  , skip                 : Val $ true
  , realtime             : Val $ false
  , trigger              : Nothing
  }

stepToJs :: Step -> JsStep
stepToJs s =
  { id                   : toNullable s.id
  , classes              : map T.classesToJs s.classes
  , target               : map T.selectToJs s.target
  , script               : s.script
  , ease                 : map T.easeToJs s.ease
  , playback             : map T.easeToJs s.playback
  , stops                : toNullable s.stops
  , delay                : s.delay
  , duration             : s.duration
  , pace                 : s.pace
  , speed                : s.speed
  , rewind               : s.rewind
  , skip                 : s.skip
  , realtime             : s.realtime
  , trigger              : toNullable s.trigger
  }
