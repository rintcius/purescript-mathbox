module Mathbox.Class.View.Cartesian4 where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type Cartesian4G a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , visible              :: a T.Bool
  , range                :: a (Array T.Vec2)
  , position             :: a T.Vec4
  , scale                :: a T.Vec4
  , pass                 :: a T.VertexPass
  }

type Cartesian4 = Cartesian4G Field MaybeField

type JsCartesian4 =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , visible              :: Field T.Bool
  , range                :: Field (Array T.Vec2)
  , position             :: Field T.Vec4
  , scale                :: Field T.Vec4
  , pass                 :: Field T.JsVertexPass
  }

mkCartesian4 :: Cartesian4
mkCartesian4 =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , visible              : Val $ true
  , range                : Val $ [ T.mkVec2 (-1) 1 ]
  , position             : Val $ T.mkVec40
  , scale                : Val $ T.mkVec4 1 1 1 1
  , pass                 : Val $ T.mkVertexPass0
  }

cartesian4ToJs :: Cartesian4 -> JsCartesian4
cartesian4ToJs c =
  { id                   : toNullable c.id
  , classes              : map T.classesToJs c.classes
  , visible              : c.visible
  , range                : c.range
  , position             : c.position
  , scale                : c.scale
  , pass                 : map T.vertexPassToJs c.pass
  }
