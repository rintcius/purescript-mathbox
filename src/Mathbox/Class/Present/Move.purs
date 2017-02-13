module Mathbox.Class.Present.Move where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type MoveG a b =
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
  , pass                 :: a T.VertexPass
  , from                 :: a T.Vec4
  , to                   :: a T.Vec4
  }

type Move = MoveG Field MaybeField

type JsMove =
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
  , pass                 :: Field T.JsVertexPass
  , from                 :: Field T.Vec4
  , to                   :: Field T.Vec4
  }

mkMove :: Move
mkMove =
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
  , pass                 : Val $ T.mkVertexPass0
  , from                 : Val $ T.mkVec40
  , to                   : Val $ T.mkVec40
  }

moveToJs :: Move -> JsMove
moveToJs m =
  { id                   : toNullable m.id
  , classes              : map T.classesToJs m.classes
  , stagger              : m.stagger
  , enter                : toNullable m.enter
  , exit                 : toNullable m.exit
  , delay                : m.delay
  , delayEnter           : toNullable m.delayEnter
  , delayExit            : toNullable m.delayExit
  , duration             : m.duration
  , durationEnter        : toNullable m.durationEnter
  , durationExit         : toNullable m.durationExit
  , pass                 : map T.vertexPassToJs m.pass
  , from                 : m.from
  , to                   : m.to
  }
