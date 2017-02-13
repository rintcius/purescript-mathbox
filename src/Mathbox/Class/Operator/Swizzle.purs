module Mathbox.Class.Operator.Swizzle where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type SwizzleG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , source               :: a T.Select
  , order                :: a T.Swizzle
  }

type Swizzle = SwizzleG Field MaybeField

type JsSwizzle =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , source               :: Field T.JsSelect
  , order                :: Field T.JsSwizzle
  }

mkSwizzle :: Swizzle
mkSwizzle =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , source               : Val $ T.mkSelect0
  , order                : Val $ T.mkSwizzle0
  }

swizzleToJs :: Swizzle -> JsSwizzle
swizzleToJs s =
  { id                   : toNullable s.id
  , classes              : map T.classesToJs s.classes
  , source               : map T.selectToJs s.source
  , order                : map T.swizzleToJs s.order
  }
