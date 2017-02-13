module Mathbox.Class.Operator.Repeat where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type RepeatG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , source               :: a T.Select
  , items                :: a Number
  , width                :: a Number
  , height               :: a Number
  , depth                :: a Number
  }

type Repeat = RepeatG Field MaybeField

type JsRepeat =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , source               :: Field T.JsSelect
  , items                :: Field Number
  , width                :: Field Number
  , height               :: Field Number
  , depth                :: Field Number
  }

mkRepeat :: Repeat
mkRepeat =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , source               : Val $ T.mkSelect0
  , items                : Val $ 1.0
  , width                : Val $ 1.0
  , height               : Val $ 1.0
  , depth                : Val $ 1.0
  }

repeatToJs :: Repeat -> JsRepeat
repeatToJs r =
  { id                   : toNullable r.id
  , classes              : map T.classesToJs r.classes
  , source               : map T.selectToJs r.source
  , items                : r.items
  , width                : r.width
  , height               : r.height
  , depth                : r.depth
  }
