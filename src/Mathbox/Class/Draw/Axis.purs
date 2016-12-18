module Mathbox.Class.Draw.Axis where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type AxisG a b =
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
  , detail               :: a Int
  , crossed              :: a T.Bool
  , range                :: b T.Vec2
  , axis                 :: a T.Axis
  , size                 :: a Number
  , start                :: a T.Bool
  , end                  :: a T.Bool
  , origin               :: a T.Vec4
  }

type Axis = AxisG Field MaybeField

type JsAxis =
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
  , detail               :: Field Int
  , crossed              :: Field T.Bool
  , range                :: Nullable (Field T.Vec2)
  , axis                 :: Field T.JsAxis
  , size                 :: Field Number
  , start                :: Field T.Bool
  , end                  :: Field T.Bool
  , origin               :: Field T.Vec4
  }

mkAxis :: Axis
mkAxis =
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
  , detail               : Val $ 1
  , crossed              : Val $ false
  , range                : Nothing
  , axis                 : Val $ T.mkAxis0
  , size                 : Val $ 3.0
  , start                : Val $ false
  , end                  : Val $ true
  , origin               : Val $ T.mkVec40
  }

axisToJs :: Axis -> JsAxis
axisToJs a =
  { id                   : toNullable a.id
  , classes              : map T.classesToJs a.classes
  , visible              : a.visible
  , opacity              : a.opacity
  , color                : map T.colorToJs a.color
  , blending             : map T.blendingToJs a.blending
  , zWrite               : a.zWrite
  , zTest                : a.zTest
  , zIndex               : map T.roundToJs a.zIndex
  , zBias                : a.zBias
  , zOrder               : toNullable a.zOrder
  , width                : a.width
  , depth                : a.depth
  , join                 : map T.joinToJs a.join
  , stroke               : map T.strokeToJs a.stroke
  , proximity            : toNullable a.proximity
  , closed               : a.closed
  , detail               : a.detail
  , crossed              : a.crossed
  , range                : toNullable a.range
  , axis                 : map T.axisToJs a.axis
  , size                 : a.size
  , start                : a.start
  , end                  : a.end
  , origin               : a.origin
  }
