module Mathbox.Class.View.Polar where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type PolarG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , visible              :: a T.Bool
  , range                :: a (Array T.Vec2)
  , position             :: a T.Vec3
  , quaternion           :: a T.Quat
  , rotation             :: a T.Vec3
  , scale                :: a T.Vec3
  , eulerOrder           :: a T.Swizzle
  , bend                 :: a Number
  , helix                :: a Number
  , pass                 :: a T.VertexPass
  }

type Polar = PolarG Field MaybeField

type JsPolar =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , visible              :: Field T.Bool
  , range                :: Field (Array T.Vec2)
  , position             :: Field T.Vec3
  , quaternion           :: Field T.Quat
  , rotation             :: Field T.Vec3
  , scale                :: Field T.Vec3
  , eulerOrder           :: Field T.JsSwizzle
  , bend                 :: Field Number
  , helix                :: Field Number
  , pass                 :: Field T.JsVertexPass
  }

mkPolar :: Polar
mkPolar =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , visible              : Val $ true
  , range                : Val $ [ T.mkVec2 (-1) 1 ]
  , position             : Val $ T.mkVec30
  , quaternion           : Val $ T.mkQuat0
  , rotation             : Val $ T.mkVec30
  , scale                : Val $ T.mkVec3 1 1 1
  , eulerOrder           : Val $ T.mkSwizzle1 T.xyz
  , bend                 : Val $ 1.0
  , helix                : Val $ 0.0
  , pass                 : Val $ T.mkVertexPass0
  }

polarToJs :: Polar -> JsPolar
polarToJs p =
  { id                   : toNullable p.id
  , classes              : map T.classesToJs p.classes
  , visible              : p.visible
  , range                : p.range
  , position             : p.position
  , quaternion           : p.quaternion
  , rotation             : p.rotation
  , scale                : p.scale
  , eulerOrder           : map T.swizzleToJs p.eulerOrder
  , bend                 : p.bend
  , helix                : p.helix
  , pass                 : map T.vertexPassToJs p.pass
  }
