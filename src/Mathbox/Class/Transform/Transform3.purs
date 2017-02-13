module Mathbox.Class.Transform.Transform3 where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type Transform3G a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , pass                 :: a T.VertexPass
  , position             :: a T.Vec3
  , quaternion           :: a T.Quat
  , rotation             :: a T.Vec3
  , eulerOrder           :: a T.Swizzle
  , scale                :: a T.Vec3
  , matrix               :: a T.Mat4
  }

type Transform3 = Transform3G Field MaybeField

type JsTransform3 =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , pass                 :: Field T.JsVertexPass
  , position             :: Field T.Vec3
  , quaternion           :: Field T.Quat
  , rotation             :: Field T.Vec3
  , eulerOrder           :: Field T.JsSwizzle
  , scale                :: Field T.Vec3
  , matrix               :: Field T.JsMat4
  }

mkTransform3 :: Transform3
mkTransform3 =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , pass                 : Val $ T.mkVertexPass0
  , position             : Val $ T.mkVec30
  , quaternion           : Val $ T.mkQuat0
  , rotation             : Val $ T.mkVec30
  , eulerOrder           : Val $ T.mkSwizzle1 T.xyz
  , scale                : Val $ T.mkVec3 1 1 1
  , matrix               : Val $ T.mkMat4 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1
  }

transform3ToJs :: Transform3 -> JsTransform3
transform3ToJs t =
  { id                   : toNullable t.id
  , classes              : map T.classesToJs t.classes
  , pass                 : map T.vertexPassToJs t.pass
  , position             : t.position
  , quaternion           : t.quaternion
  , rotation             : t.rotation
  , eulerOrder           : map T.swizzleToJs t.eulerOrder
  , scale                : t.scale
  , matrix               : map T.mat4ToJs t.matrix
  }
