module Mathbox.Class.Draw.Point where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type PointG a b =
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
  , size                 :: a Number
  , sizes                :: b T.Select
  , shape                :: a T.Shape
  , optical              :: a T.Bool
  , fill                 :: a T.Bool
  , depth                :: a Number
  , points               :: a T.Select
  , colors               :: b T.Select
  }

type Point = PointG Field MaybeField

type JsPoint =
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
  , size                 :: Field Number
  , sizes                :: Nullable (Field T.JsSelect)
  , shape                :: Field T.JsShape
  , optical              :: Field T.Bool
  , fill                 :: Field T.Bool
  , depth                :: Field Number
  , points               :: Field T.JsSelect
  , colors               :: Nullable (Field T.JsSelect)
  }

mkPoint :: Point
mkPoint =
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
  , size                 : Val $ 4.0
  , sizes                : Nothing
  , shape                : Val $ T.mkShape0
  , optical              : Val $ true
  , fill                 : Val $ true
  , depth                : Val $ 1.0
  , points               : Val $ T.mkSelect0
  , colors               : Nothing
  }

pointToJs :: Point -> JsPoint
pointToJs p =
  { id                   : toNullable p.id
  , classes              : map T.classesToJs p.classes
  , visible              : p.visible
  , opacity              : p.opacity
  , color                : map T.colorToJs p.color
  , blending             : map T.blendingToJs p.blending
  , zWrite               : p.zWrite
  , zTest                : p.zTest
  , zIndex               : map T.roundToJs p.zIndex
  , zBias                : p.zBias
  , zOrder               : toNullable p.zOrder
  , size                 : p.size
  , sizes                : maybeToNullable T.selectToJs p.sizes
  , shape                : map T.shapeToJs p.shape
  , optical              : p.optical
  , fill                 : p.fill
  , depth                : p.depth
  , points               : map T.selectToJs p.points
  , colors               : maybeToNullable T.selectToJs p.colors
  }
