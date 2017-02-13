module Mathbox.Class.Transform.Layer where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type LayerG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , pass                 :: a T.VertexPass
  , depth                :: a Number
  , fit                  :: a T.Fit
  }

type Layer = LayerG Field MaybeField

type JsLayer =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , pass                 :: Field T.JsVertexPass
  , depth                :: Field Number
  , fit                  :: Field T.JsFit
  }

mkLayer :: Layer
mkLayer =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , pass                 : Val $ T.mkVertexPass0
  , depth                : Val $ 1.0
  , fit                  : Val $ T.FitY
  }

layerToJs :: Layer -> JsLayer
layerToJs l =
  { id                   : toNullable l.id
  , classes              : map T.classesToJs l.classes
  , pass                 : map T.vertexPassToJs l.pass
  , depth                : l.depth
  , fit                  : map T.fitToJs l.fit
  }
