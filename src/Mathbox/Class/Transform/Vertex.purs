module Mathbox.Class.Transform.Vertex where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type VertexG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , shader               :: a T.Select
  , pass                 :: a T.VertexPass
  }

type Vertex = VertexG Field MaybeField

type JsVertex =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , shader               :: Field T.JsSelect
  , pass                 :: Field T.JsVertexPass
  }

mkVertex :: Vertex
mkVertex =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , shader               : Val $ T.mkSelect0
  , pass                 : Val $ T.mkVertexPass0
  }

vertexToJs :: Vertex -> JsVertex
vertexToJs v =
  { id                   : toNullable v.id
  , classes              : map T.classesToJs v.classes
  , shader               : map T.selectToJs v.shader
  , pass                 : map T.vertexPassToJs v.pass
  }
