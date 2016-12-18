module Mathbox.Class.View.Cartesian where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type CartesianG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , visible              :: a T.Bool
  , range                :: a (Array T.Vec2)
  , position             :: a T.Vec3
  , quaternion           :: a T.Quat
  , rotation             :: a T.Vec3
  , scale                :: a T.Vec3
  , eulerOrder           :: a T.Swizzle
  , pass                 :: a T.VertexPass
  }

type Cartesian = CartesianG Field MaybeField

type JsCartesian =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , visible              :: Field T.Bool
  , range                :: Field (Array T.Vec2)
  , position             :: Field T.Vec3
  , quaternion           :: Field T.Quat
  , rotation             :: Field T.Vec3
  , scale                :: Field T.Vec3
  , eulerOrder           :: Field T.JsSwizzle
  , pass                 :: Field T.JsVertexPass
  }

mkCartesian :: Cartesian
mkCartesian =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , visible              : Val $ true
  , range                : Val $ [ T.mkVec2 (-1) 1 ]
  , position             : Val $ T.mkVec30
  , quaternion           : Val $ T.mkQuat0
  , rotation             : Val $ T.mkVec30
  , scale                : Val $ T.mkVec3 1 1 1
  , eulerOrder           : Val $ T.mkSwizzle1 T.xyz
  , pass                 : Val $ T.mkVertexPass0
  }

cartesianToJs :: Cartesian -> JsCartesian
cartesianToJs c =
  { id                   : toNullable c.id
  , classes              : map T.classesToJs c.classes
  , visible              : c.visible
  , range                : c.range
  , position             : c.position
  , quaternion           : c.quaternion
  , rotation             : c.rotation
  , scale                : c.scale
  , eulerOrder           : map T.swizzleToJs c.eulerOrder
  , pass                 : map T.vertexPassToJs c.pass
  }
