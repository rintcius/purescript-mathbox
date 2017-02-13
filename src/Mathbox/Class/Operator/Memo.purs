module Mathbox.Class.Operator.Memo where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type MemoG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , source               :: a T.Select
  , minFilter            :: a T.Filter
  , magFilter            :: a T.Filter
  , type                 :: a T.Type
  }

type Memo = MemoG Field MaybeField

type JsMemo =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , source               :: Field T.JsSelect
  , minFilter            :: Field T.JsFilter
  , magFilter            :: Field T.JsFilter
  , type                 :: Field T.JsType
  }

mkMemo :: Memo
mkMemo =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , source               : Val $ T.mkSelect0
  , minFilter            : Val $ T.FilterNearest
  , magFilter            : Val $ T.FilterNearest
  , type                 : Val $ T.TypeFloat
  }

memoToJs :: Memo -> JsMemo
memoToJs m =
  { id                   : toNullable m.id
  , classes              : map T.classesToJs m.classes
  , source               : map T.selectToJs m.source
  , minFilter            : map T.filterToJs m.minFilter
  , magFilter            : map T.filterToJs m.magFilter
  , type                 : map T.typeToJs m.type
  }
