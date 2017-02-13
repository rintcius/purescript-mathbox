module Mathbox.Class.Draw.Line where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type LineG a b =
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

type Line = LineG Field MaybeField

type JsLine =
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

mkLine :: Line
mkLine =
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

lineToJs :: Line -> JsLine
lineToJs l =
  { id                   : toNullable l.id
  , classes              : map T.classesToJs l.classes
  , visible              : l.visible
  , opacity              : l.opacity
  , color                : map T.colorToJs l.color
  , blending             : map T.blendingToJs l.blending
  , zWrite               : l.zWrite
  , zTest                : l.zTest
  , zIndex               : map T.roundToJs l.zIndex
  , zBias                : l.zBias
  , zOrder               : toNullable l.zOrder
  , width                : l.width
  , depth                : l.depth
  , join                 : map T.joinToJs l.join
  , stroke               : map T.strokeToJs l.stroke
  , proximity            : toNullable l.proximity
  , closed               : l.closed
  , size                 : l.size
  , start                : l.start
  , end                  : l.end
  , points               : map T.selectToJs l.points
  , colors               : maybeToNullable T.selectToJs l.colors
  }
