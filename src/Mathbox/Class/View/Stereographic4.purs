module Mathbox.Class.View.Stereographic4 where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type Stereographic4G a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , visible              :: a T.Bool
  , range                :: a (Array T.Vec2)
  , position             :: a T.Vec4
  , scale                :: a T.Vec4
  , bend                 :: a Number
  , pass                 :: a T.VertexPass
  }

type Stereographic4 = Stereographic4G Field MaybeField

type JsStereographic4 =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , visible              :: Field T.Bool
  , range                :: Field (Array T.Vec2)
  , position             :: Field T.Vec4
  , scale                :: Field T.Vec4
  , bend                 :: Field Number
  , pass                 :: Field T.JsVertexPass
  }

mkStereographic4 :: Stereographic4
mkStereographic4 =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , visible              : Val $ true
  , range                : Val $ [ T.mkVec2 (-1) 1 ]
  , position             : Val $ T.mkVec40
  , scale                : Val $ T.mkVec4 1 1 1 1
  , bend                 : Val $ 1.0
  , pass                 : Val $ T.mkVertexPass0
  }

stereographic4ToJs :: Stereographic4 -> JsStereographic4
stereographic4ToJs s =
  { id                   : toNullable s.id
  , classes              : map T.classesToJs s.classes
  , visible              : s.visible
  , range                : s.range
  , position             : s.position
  , scale                : s.scale
  , bend                 : s.bend
  , pass                 : map T.vertexPassToJs s.pass
  }
