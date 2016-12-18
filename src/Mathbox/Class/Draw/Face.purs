module Mathbox.Class.Draw.Face where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type FaceG a b =
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
  , fill                 :: a T.Bool
  , shaded               :: a T.Bool
  , map                  :: b T.Select
  , lineBias             :: a Number
  , line                 :: a T.Bool
  , points               :: a T.Select
  , colors               :: b T.Select
  }

type Face = FaceG Field MaybeField

type JsFace =
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
  , fill                 :: Field T.Bool
  , shaded               :: Field T.Bool
  , map                  :: Nullable (Field T.JsSelect)
  , lineBias             :: Field Number
  , line                 :: Field T.Bool
  , points               :: Field T.JsSelect
  , colors               :: Nullable (Field T.JsSelect)
  }

mkFace :: Face
mkFace =
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
  , fill                 : Val $ true
  , shaded               : Val $ false
  , map                  : Nothing
  , lineBias             : Val $ 5.0
  , line                 : Val $ false
  , points               : Val $ T.mkSelect0
  , colors               : Nothing
  }

faceToJs :: Face -> JsFace
faceToJs f =
  { id                   : toNullable f.id
  , classes              : map T.classesToJs f.classes
  , visible              : f.visible
  , opacity              : f.opacity
  , color                : map T.colorToJs f.color
  , blending             : map T.blendingToJs f.blending
  , zWrite               : f.zWrite
  , zTest                : f.zTest
  , zIndex               : map T.roundToJs f.zIndex
  , zBias                : f.zBias
  , zOrder               : toNullable f.zOrder
  , width                : f.width
  , depth                : f.depth
  , join                 : map T.joinToJs f.join
  , stroke               : map T.strokeToJs f.stroke
  , proximity            : toNullable f.proximity
  , closed               : f.closed
  , fill                 : f.fill
  , shaded               : f.shaded
  , map                  : maybeToNullable T.selectToJs f.map
  , lineBias             : f.lineBias
  , line                 : f.line
  , points               : map T.selectToJs f.points
  , colors               : maybeToNullable T.selectToJs f.colors
  }
