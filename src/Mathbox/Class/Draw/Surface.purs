module Mathbox.Class.Draw.Surface where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type SurfaceG a b =
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
  , points               :: a T.Select
  , colors               :: b T.Select
  , lineX                :: a T.Bool
  , lineY                :: a T.Bool
  , crossed              :: a T.Bool
  , closedX              :: a T.Bool
  , closedY              :: a T.Bool
  }

type Surface = SurfaceG Field MaybeField

type JsSurface =
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
  , points               :: Field T.JsSelect
  , colors               :: Nullable (Field T.JsSelect)
  , lineX                :: Field T.Bool
  , lineY                :: Field T.Bool
  , crossed              :: Field T.Bool
  , closedX              :: Field T.Bool
  , closedY              :: Field T.Bool
  }

mkSurface :: Surface
mkSurface =
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
  , points               : Val $ T.mkSelect0
  , colors               : Nothing
  , lineX                : Val $ true
  , lineY                : Val $ true
  , crossed              : Val $ false
  , closedX              : Val $ false
  , closedY              : Val $ false
  }

surfaceToJs :: Surface -> JsSurface
surfaceToJs s =
  { id                   : toNullable s.id
  , classes              : map T.classesToJs s.classes
  , visible              : s.visible
  , opacity              : s.opacity
  , color                : map T.colorToJs s.color
  , blending             : map T.blendingToJs s.blending
  , zWrite               : s.zWrite
  , zTest                : s.zTest
  , zIndex               : map T.roundToJs s.zIndex
  , zBias                : s.zBias
  , zOrder               : toNullable s.zOrder
  , width                : s.width
  , depth                : s.depth
  , join                 : map T.joinToJs s.join
  , stroke               : map T.strokeToJs s.stroke
  , proximity            : toNullable s.proximity
  , closed               : s.closed
  , fill                 : s.fill
  , shaded               : s.shaded
  , map                  : maybeToNullable T.selectToJs s.map
  , lineBias             : s.lineBias
  , points               : map T.selectToJs s.points
  , colors               : maybeToNullable T.selectToJs s.colors
  , lineX                : s.lineX
  , lineY                : s.lineY
  , crossed              : s.crossed
  , closedX              : s.closedX
  , closedY              : s.closedY
  }
