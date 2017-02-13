module Mathbox.Class.Operator.Subdivide where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type SubdivideG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , source               :: a T.Select
  , items                :: b Int
  , width                :: b Int
  , height               :: b Int
  , depth                :: b Int
  , bevel                :: a Number
  , lerp                 :: a T.Bool
  }

type Subdivide = SubdivideG Field MaybeField

type JsSubdivide =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , source               :: Field T.JsSelect
  , items                :: Nullable (Field Int)
  , width                :: Nullable (Field Int)
  , height               :: Nullable (Field Int)
  , depth                :: Nullable (Field Int)
  , bevel                :: Field Number
  , lerp                 :: Field T.Bool
  }

mkSubdivide :: Subdivide
mkSubdivide =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , source               : Val $ T.mkSelect0
  , items                : Nothing
  , width                : Nothing
  , height               : Nothing
  , depth                : Nothing
  , bevel                : Val $ 1.0
  , lerp                 : Val $ true
  }

subdivideToJs :: Subdivide -> JsSubdivide
subdivideToJs s =
  { id                   : toNullable s.id
  , classes              : map T.classesToJs s.classes
  , source               : map T.selectToJs s.source
  , items                : toNullable s.items
  , width                : toNullable s.width
  , height               : toNullable s.height
  , depth                : toNullable s.depth
  , bevel                : s.bevel
  , lerp                 : s.lerp
  }
