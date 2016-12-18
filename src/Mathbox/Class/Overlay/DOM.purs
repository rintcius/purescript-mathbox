module Mathbox.Class.Overlay.DOM where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type DOMG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , visible              :: a T.Bool
  , opacity              :: a Number
  , zIndex               :: a T.Round
  , points               :: a T.Select
  , html                 :: a T.Select
  , size                 :: a Number
  , outline              :: a Number
  , zoom                 :: a Number
  , color                :: b T.Color
  , attributes           :: b T.Object
  , pointerEvents        :: a T.Bool
  , offset               :: a T.Vec2
  , snap                 :: a T.Bool
  , depth                :: a Number
  }

type DOM = DOMG Field MaybeField

type JsDOM =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , visible              :: Field T.Bool
  , opacity              :: Field Number
  , zIndex               :: Field T.JsRound
  , points               :: Field T.JsSelect
  , html                 :: Field T.JsSelect
  , size                 :: Field Number
  , outline              :: Field Number
  , zoom                 :: Field Number
  , color                :: Nullable (Field T.JsColor)
  , attributes           :: Nullable (Field T.Object)
  , pointerEvents        :: Field T.Bool
  , offset               :: Field T.Vec2
  , snap                 :: Field T.Bool
  , depth                :: Field Number
  }

mkDOM :: DOM
mkDOM =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , visible              : Val $ true
  , opacity              : Val $ 1.0
  , zIndex               : Val $ T.mkRound 0
  , points               : Val $ T.mkSelect0
  , html                 : Val $ T.mkSelect0
  , size                 : Val $ 16.0
  , outline              : Val $ 2.0
  , zoom                 : Val $ 1.0
  , color                : Nothing
  , attributes           : Nothing
  , pointerEvents        : Val $ false
  , offset               : Val $ T.mkVec2 0 (-20)
  , snap                 : Val $ false
  , depth                : Val $ 0.0
  }

dOMToJs :: DOM -> JsDOM
dOMToJs d =
  { id                   : toNullable d.id
  , classes              : map T.classesToJs d.classes
  , visible              : d.visible
  , opacity              : d.opacity
  , zIndex               : map T.roundToJs d.zIndex
  , points               : map T.selectToJs d.points
  , html                 : map T.selectToJs d.html
  , size                 : d.size
  , outline              : d.outline
  , zoom                 : d.zoom
  , color                : maybeToNullable T.colorToJs d.color
  , attributes           : toNullable d.attributes
  , pointerEvents        : d.pointerEvents
  , offset               : d.offset
  , snap                 : d.snap
  , depth                : d.depth
  }
