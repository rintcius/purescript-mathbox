module Mathbox.Class.Draw.Vector where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type VectorG a b =
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
  , size                 :: a Number
  , start                :: a T.Bool
  , end                  :: a T.Bool
  , points               :: a T.Select
  , colors               :: b T.Select
  }

type Vector = VectorG Field MaybeField

type JsVector =
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
  , size                 :: Field Number
  , start                :: Field T.Bool
  , end                  :: Field T.Bool
  , points               :: Field T.JsSelect
  , colors               :: Nullable (Field T.JsSelect)
  }

mkVector :: Vector
mkVector =
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
  , size                 : Val $ 3.0
  , start                : Val $ false
  , end                  : Val $ false
  , points               : Val $ T.mkSelect0
  , colors               : Nothing
  }

vectorToJs :: Vector -> JsVector
vectorToJs v =
  { id                   : toNullable v.id
  , classes              : map T.classesToJs v.classes
  , visible              : v.visible
  , opacity              : v.opacity
  , color                : map T.colorToJs v.color
  , blending             : map T.blendingToJs v.blending
  , zWrite               : v.zWrite
  , zTest                : v.zTest
  , zIndex               : map T.roundToJs v.zIndex
  , zBias                : v.zBias
  , zOrder               : toNullable v.zOrder
  , width                : v.width
  , depth                : v.depth
  , join                 : map T.joinToJs v.join
  , stroke               : map T.strokeToJs v.stroke
  , proximity            : toNullable v.proximity
  , closed               : v.closed
  , size                 : v.size
  , start                : v.start
  , end                  : v.end
  , points               : map T.selectToJs v.points
  , colors               : maybeToNullable T.selectToJs v.colors
  }
