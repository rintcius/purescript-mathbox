module Mathbox.Class.Rtt.Compose where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type ComposeG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , visible              :: a T.Bool
  , source               :: a T.Select
  , opacity              :: a Number
  , color                :: a T.Color
  , blending             :: a T.Blending
  , zWrite               :: a T.Bool
  , zTest                :: a T.Bool
  , zIndex               :: a T.Round
  , zBias                :: a Number
  , zOrder               :: b Int
  , alpha                :: a T.Bool
  }

type Compose = ComposeG Field MaybeField

type JsCompose =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , visible              :: Field T.Bool
  , source               :: Field T.JsSelect
  , opacity              :: Field Number
  , color                :: Field T.JsColor
  , blending             :: Field T.JsBlending
  , zWrite               :: Field T.Bool
  , zTest                :: Field T.Bool
  , zIndex               :: Field T.JsRound
  , zBias                :: Field Number
  , zOrder               :: Nullable (Field Int)
  , alpha                :: Field T.Bool
  }

mkCompose :: Compose
mkCompose =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , visible              : Val $ true
  , source               : Val $ T.mkSelect0
  , opacity              : Val $ 1.0
  , color                : Val $ T.mkColor0
  , blending             : Val $ T.mkBlending0
  , zWrite               : Val $ true
  , zTest                : Val $ true
  , zIndex               : Val $ T.mkRound0
  , zBias                : Val $ 0.0
  , zOrder               : Nothing
  , alpha                : Val $ false
  }

composeToJs :: Compose -> JsCompose
composeToJs c =
  { id                   : toNullable c.id
  , classes              : map T.classesToJs c.classes
  , visible              : c.visible
  , source               : map T.selectToJs c.source
  , opacity              : c.opacity
  , color                : map T.colorToJs c.color
  , blending             : map T.blendingToJs c.blending
  , zWrite               : c.zWrite
  , zTest                : c.zTest
  , zIndex               : map T.roundToJs c.zIndex
  , zBias                : c.zBias
  , zOrder               : toNullable c.zOrder
  , alpha                : c.alpha
  }
