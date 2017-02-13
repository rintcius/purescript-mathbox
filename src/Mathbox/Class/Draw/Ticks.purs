module Mathbox.Class.Draw.Ticks where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type TicksG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , visible              :: a T.Bool
  , opacity              :: a Number
  , color                :: a T.Color
  , blending             :: a T.Blending
  , zWrite               :: a T.Bool
  , zTest                :: a T.Bool
  , zIndex               :: a T.Round
  , zBias                :: a Number
  , zOrder               :: b Int
  , width                :: a Number
  , depth                :: a Number
  , join                 :: a T.Join
  , stroke               :: a T.Stroke
  , proximity            :: b Number
  , closed               :: a T.Bool
  , normal               :: a T.Vec3
  , size                 :: a Number
  , epsilon              :: a Number
  , points               :: a T.Select
  , colors               :: b T.Select
  }

type Ticks = TicksG Field MaybeField

type JsTicks =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , visible              :: Field T.Bool
  , opacity              :: Field Number
  , color                :: Field T.JsColor
  , blending             :: Field T.JsBlending
  , zWrite               :: Field T.Bool
  , zTest                :: Field T.Bool
  , zIndex               :: Field T.JsRound
  , zBias                :: Field Number
  , zOrder               :: Nullable (Field Int)
  , width                :: Field Number
  , depth                :: Field Number
  , join                 :: Field T.JsJoin
  , stroke               :: Field T.JsStroke
  , proximity            :: Nullable (Field Number)
  , closed               :: Field T.Bool
  , normal               :: Field T.Vec3
  , size                 :: Field Number
  , epsilon              :: Field Number
  , points               :: Field T.JsSelect
  , colors               :: Nullable (Field T.JsSelect)
  }

mkTicks :: Ticks
mkTicks =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , visible              : Val $ true
  , opacity              : Val $ 1.0
  , color                : Val $ T.mkColor0
  , blending             : Val $ T.mkBlending0
  , zWrite               : Val $ true
  , zTest                : Val $ true
  , zIndex               : Val $ T.mkRound0
  , zBias                : Val $ 0.0
  , zOrder               : Nothing
  , width                : Val $ 2.0
  , depth                : Val $ 1.0
  , join                 : Val $ T.mkJoin0
  , stroke               : Val $ T.mkStroke0
  , proximity            : Nothing
  , closed               : Val $ false
  , normal               : Val $ T.mkVec3 0 0 1
  , size                 : Val $ 10.0
  , epsilon              : Val $ 0.001
  , points               : Val $ T.mkSelect0
  , colors               : Nothing
  }

ticksToJs :: Ticks -> JsTicks
ticksToJs t =
  { id                   : toNullable t.id
  , classes              : map T.classesToJs t.classes
  , visible              : t.visible
  , opacity              : t.opacity
  , color                : map T.colorToJs t.color
  , blending             : map T.blendingToJs t.blending
  , zWrite               : t.zWrite
  , zTest                : t.zTest
  , zIndex               : map T.roundToJs t.zIndex
  , zBias                : t.zBias
  , zOrder               : toNullable t.zOrder
  , width                : t.width
  , depth                : t.depth
  , join                 : map T.joinToJs t.join
  , stroke               : map T.strokeToJs t.stroke
  , proximity            : toNullable t.proximity
  , closed               : t.closed
  , normal               : t.normal
  , size                 : t.size
  , epsilon              : t.epsilon
  , points               : map T.selectToJs t.points
  , colors               : maybeToNullable T.selectToJs t.colors
  }
