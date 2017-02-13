module Mathbox.Class.Text.Label where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type LabelG a b =
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
  , text                 :: a T.Select
  , size                 :: a Number
  , outline              :: a Number
  , expand               :: a Number
  , background           :: a T.Color
  , offset               :: a T.Vec2
  , snap                 :: a T.Bool
  , depth                :: a Number
  , points               :: a T.Select
  , colors               :: b T.Select
  }

type Label = LabelG Field MaybeField

type JsLabel =
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
  , text                 :: Field T.JsSelect
  , size                 :: Field Number
  , outline              :: Field Number
  , expand               :: Field Number
  , background           :: Field T.JsColor
  , offset               :: Field T.Vec2
  , snap                 :: Field T.Bool
  , depth                :: Field Number
  , points               :: Field T.JsSelect
  , colors               :: Nullable (Field T.JsSelect)
  }

mkLabel :: Label
mkLabel =
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
  , text                 : Val $ T.mkSelect0
  , size                 : Val $ 16.0
  , outline              : Val $ 2.0
  , expand               : Val $ 0.0
  , background           : Val $ T.mkColor 1 1 1
  , offset               : Val $ T.mkVec2 0 (-20)
  , snap                 : Val $ false
  , depth                : Val $ 0.0
  , points               : Val $ T.mkSelect0
  , colors               : Nothing
  }

labelToJs :: Label -> JsLabel
labelToJs l =
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
  , text                 : map T.selectToJs l.text
  , size                 : l.size
  , outline              : l.outline
  , expand               : l.expand
  , background           : map T.colorToJs l.background
  , offset               : l.offset
  , snap                 : l.snap
  , depth                : l.depth
  , points               : map T.selectToJs l.points
  , colors               : maybeToNullable T.selectToJs l.colors
  }
