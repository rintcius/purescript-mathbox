module Mathbox.Class.Present.Reveal where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type RevealG a b =
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

type Reveal = RevealG Field MaybeField

type JsReveal =
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

mkReveal :: Reveal
mkReveal =
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

revealToJs :: Reveal -> JsReveal
revealToJs r =
  { id                   : toNullable r.id
  , classes              : map T.classesToJs r.classes
  , stagger              : r.stagger
  , enter                : toNullable r.enter
  , exit                 : toNullable r.exit
  , delay                : r.delay
  , delayEnter           : toNullable r.delayEnter
  , delayExit            : toNullable r.delayExit
  , duration             : r.duration
  , durationEnter        : toNullable r.durationEnter
  , durationExit         : toNullable r.durationExit
  }
