module Mathbox.Class.Transform.Transform4 where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type Transform4G a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , pass                 :: a T.VertexPass
  , position             :: a T.Vec4
  , scale                :: a T.Vec4
  , matrix               :: a T.Mat4
  }

type Transform4 = Transform4G Field MaybeField

type JsTransform4 =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , pass                 :: Field T.JsVertexPass
  , position             :: Field T.Vec4
  , scale                :: Field T.Vec4
  , matrix               :: Field T.JsMat4
  }

mkTransform4 :: Transform4
mkTransform4 =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , pass                 : Val $ T.mkVertexPass0
  , position             : Val $ T.mkVec40
  , scale                : Val $ T.mkVec4 1 1 1 1
  , matrix               : Val $ T.mkMat4 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1
  }

transform4ToJs :: Transform4 -> JsTransform4
transform4ToJs t =
  { id                   : toNullable t.id
  , classes              : map T.classesToJs t.classes
  , pass                 : map T.vertexPassToJs t.pass
  , position             : t.position
  , scale                : t.scale
  , matrix               : map T.mat4ToJs t.matrix
  }
