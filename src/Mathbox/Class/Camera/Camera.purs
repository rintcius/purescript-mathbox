module Mathbox.Class.Camera.Camera where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type CameraG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , proxy                :: a T.Bool
  , position             :: b T.Vec3
  , quaternion           :: b T.Quat
  , rotation             :: b T.Vec3
  , lookAt               :: b T.Vec3
  , up                   :: b T.Vec3
  , eulerOrder           :: a T.Swizzle
  , fov                  :: b Number
  }

type Camera = CameraG Field MaybeField

type JsCamera =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , proxy                :: Field T.Bool
  , position             :: Nullable (Field T.Vec3)
  , quaternion           :: Nullable (Field T.Quat)
  , rotation             :: Nullable (Field T.Vec3)
  , lookAt               :: Nullable (Field T.Vec3)
  , up                   :: Nullable (Field T.Vec3)
  , eulerOrder           :: Field T.JsSwizzle
  , fov                  :: Nullable (Field Number)
  }

mkCamera :: Camera
mkCamera =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , proxy                : Val $ false
  , position             : Nothing
  , quaternion           : Nothing
  , rotation             : Nothing
  , lookAt               : Nothing
  , up                   : Nothing
  , eulerOrder           : Val $ T.mkSwizzle1 T.xyz
  , fov                  : Nothing
  }

cameraToJs :: Camera -> JsCamera
cameraToJs c =
  { id                   : toNullable c.id
  , classes              : map T.classesToJs c.classes
  , proxy                : c.proxy
  , position             : toNullable c.position
  , quaternion           : toNullable c.quaternion
  , rotation             : toNullable c.rotation
  , lookAt               : toNullable c.lookAt
  , up                   : toNullable c.up
  , eulerOrder           : map T.swizzleToJs c.eulerOrder
  , fov                  : toNullable c.fov
  }
