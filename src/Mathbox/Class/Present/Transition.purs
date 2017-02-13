module Mathbox.Class.Present.Transition where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type TransitionG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , stagger              :: a T.Vec4
  , enter                :: b Number
  , exit                 :: b Number
  , delay                :: a Number
  , delayEnter           :: b Number
  , delayExit            :: b Number
  , duration             :: a Number
  , durationEnter        :: b Number
  , durationExit         :: b Number
  }

type Transition = TransitionG Field MaybeField

type JsTransition =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , stagger              :: Field T.Vec4
  , enter                :: Nullable (Field Number)
  , exit                 :: Nullable (Field Number)
  , delay                :: Field Number
  , delayEnter           :: Nullable (Field Number)
  , delayExit            :: Nullable (Field Number)
  , duration             :: Field Number
  , durationEnter        :: Nullable (Field Number)
  , durationExit         :: Nullable (Field Number)
  }

mkTransition :: Transition
mkTransition =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , stagger              : Val $ T.mkVec40
  , enter                : Nothing
  , exit                 : Nothing
  , delay                : Val $ 0.0
  , delayEnter           : Nothing
  , delayExit            : Nothing
  , duration             : Val $ 0.3
  , durationEnter        : Nothing
  , durationExit         : Nothing
  }

transitionToJs :: Transition -> JsTransition
transitionToJs t =
  { id                   : toNullable t.id
  , classes              : map T.classesToJs t.classes
  , stagger              : t.stagger
  , enter                : toNullable t.enter
  , exit                 : toNullable t.exit
  , delay                : t.delay
  , delayEnter           : toNullable t.delayEnter
  , delayExit            : toNullable t.delayExit
  , duration             : t.duration
  , durationEnter        : toNullable t.durationEnter
  , durationExit         : toNullable t.durationExit
  }
