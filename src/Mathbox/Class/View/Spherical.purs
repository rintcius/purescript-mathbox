module Mathbox.Class.View.Spherical where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type SphericalG a b =
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
  , pass                 :: a T.VertexPass
  }

type Spherical = SphericalG Field MaybeField

type JsSpherical =
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
  , pass                 :: Field T.JsVertexPass
  }

mkSpherical :: Spherical
mkSpherical =
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
  , pass                 : Val $ T.mkVertexPass0
  }

sphericalToJs :: Spherical -> JsSpherical
sphericalToJs s =
  { id                   : toNullable s.id
  , classes              : map T.classesToJs s.classes
  , visible              : s.visible
  , range                : s.range
  , position             : s.position
  , quaternion           : s.quaternion
  , rotation             : s.rotation
  , scale                : s.scale
  , eulerOrder           : map T.swizzleToJs s.eulerOrder
  , bend                 : s.bend
  , pass                 : map T.vertexPassToJs s.pass
  }
