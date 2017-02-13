module Mathbox.Class.Operator.Slice where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type SliceG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , source               :: a T.Select
  , items                :: b T.Vec2
  , width                :: b T.Vec2
  , height               :: b T.Vec2
  , depth                :: b T.Vec2
  }

type Slice = SliceG Field MaybeField

type JsSlice =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , source               :: Field T.JsSelect
  , items                :: Nullable (Field T.Vec2)
  , width                :: Nullable (Field T.Vec2)
  , height               :: Nullable (Field T.Vec2)
  , depth                :: Nullable (Field T.Vec2)
  }

mkSlice :: Slice
mkSlice =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , source               : Val $ T.mkSelect0
  , items                : Nothing
  , width                : Nothing
  , height               : Nothing
  , depth                : Nothing
  }

sliceToJs :: Slice -> JsSlice
sliceToJs s =
  { id                   : toNullable s.id
  , classes              : map T.classesToJs s.classes
  , source               : map T.selectToJs s.source
  , items                : toNullable s.items
  , width                : toNullable s.width
  , height               : toNullable s.height
  , depth                : toNullable s.depth
  }
