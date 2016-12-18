module Mathbox.Class.Base.Root where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type RootG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , speed                :: a Number
  , camera               :: a T.Select
  , pass                 :: a T.VertexPass
  , scale                :: b Number
  , fov                  :: b Number
  , focus                :: b Number
  }

type Root = RootG Field MaybeField

type JsRoot =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , speed                :: Field Number
  , camera               :: Field T.JsSelect
  , pass                 :: Field T.JsVertexPass
  , scale                :: Nullable (Field Number)
  , fov                  :: Nullable (Field Number)
  , focus                :: Nullable (Field Number)
  }

mkRoot :: Root
mkRoot =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , speed                : Val $ 1.0
  , camera               : Val $ T.mkSelect [ T.camera ]
  , pass                 : Val $ T.mkVertexPass0
  , scale                : Nothing
  , fov                  : Nothing
  , focus                : Nothing
  }

rootToJs :: Root -> JsRoot
rootToJs r =
  { id                   : toNullable r.id
  , classes              : map T.classesToJs r.classes
  , speed                : r.speed
  , camera               : map T.selectToJs r.camera
  , pass                 : map T.vertexPassToJs r.pass
  , scale                : toNullable r.scale
  , fov                  : toNullable r.fov
  , focus                : toNullable r.focus
  }
