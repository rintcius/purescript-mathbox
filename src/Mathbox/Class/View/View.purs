module Mathbox.Class.View.View where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type ViewG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , visible              :: a T.Bool
  , range                :: a (Array T.Vec2)
  , pass                 :: a T.VertexPass
  }

type View = ViewG Field MaybeField

type JsView =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , visible              :: Field T.Bool
  , range                :: Field (Array T.Vec2)
  , pass                 :: Field T.JsVertexPass
  }

mkView :: View
mkView =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , visible              : Val $ true
  , range                : Val $ [ T.mkVec2 (-1) 1 ]
  , pass                 : Val $ T.mkVertexPass0
  }

viewToJs :: View -> JsView
viewToJs v =
  { id                   : toNullable v.id
  , classes              : map T.classesToJs v.classes
  , visible              : v.visible
  , range                : v.range
  , pass                 : map T.vertexPassToJs v.pass
  }
