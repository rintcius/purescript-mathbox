module Mathbox.Class.Operator.Readback where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type ReadbackG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , source               :: a T.Select
  , type                 :: a T.Type
  , expr                 :: b T.Func
  , data                 :: a T.Data
  , channels             :: a Int
  , items                :: b Int
  , width                :: b Int
  , height               :: b Int
  , depth                :: b Int
  , active               :: a T.Bool
  }

type Readback = ReadbackG Field MaybeField

type JsReadback =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , source               :: Field T.JsSelect
  , type                 :: Field T.JsType
  , expr                 :: Nullable (Field T.Func)
  , data                 :: Field T.Data
  , channels             :: Field Int
  , items                :: Nullable (Field Int)
  , width                :: Nullable (Field Int)
  , height               :: Nullable (Field Int)
  , depth                :: Nullable (Field Int)
  , active               :: Field T.Bool
  }

mkReadback :: Readback
mkReadback =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , source               : Val $ T.mkSelect0
  , type                 : Val $ T.TypeFloat
  , expr                 : Nothing
  , data                 : Val $ T.mkData0
  , channels             : Val $ 4
  , items                : Nothing
  , width                : Nothing
  , height               : Nothing
  , depth                : Nothing
  , active               : Val $ true
  }

readbackToJs :: Readback -> JsReadback
readbackToJs r =
  { id                   : toNullable r.id
  , classes              : map T.classesToJs r.classes
  , source               : map T.selectToJs r.source
  , type                 : map T.typeToJs r.type
  , expr                 : toNullable r.expr
  , data                 : r.data
  , channels             : r.channels
  , items                : toNullable r.items
  , width                : toNullable r.width
  , height               : toNullable r.height
  , depth                : toNullable r.depth
  , active               : r.active
  }
