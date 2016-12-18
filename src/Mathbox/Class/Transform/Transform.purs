module Mathbox.Class.Transform.Transform where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type TransformG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , pass                 :: a T.VertexPass
  , gamma                :: a T.Bool
  }

type Transform = TransformG Field MaybeField

type JsTransform =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , pass                 :: Field T.JsVertexPass
  , gamma                :: Field T.Bool
  }

mkTransform :: Transform
mkTransform =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , pass                 : Val $ T.mkVertexPass0
  , gamma                : Val $ false
  }

transformToJs :: Transform -> JsTransform
transformToJs t =
  { id                   : toNullable t.id
  , classes              : map T.classesToJs t.classes
  , pass                 : map T.vertexPassToJs t.pass
  , gamma                : t.gamma
  }
