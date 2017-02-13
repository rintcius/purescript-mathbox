module Mathbox.Class.Operator.Operator where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type OperatorG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , source               :: a T.Select
  }

type Operator = OperatorG Field MaybeField

type JsOperator =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , source               :: Field T.JsSelect
  }

mkOperator :: Operator
mkOperator =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , source               : Val $ T.mkSelect0
  }

operatorToJs :: Operator -> JsOperator
operatorToJs o =
  { id                   : toNullable o.id
  , classes              : map T.classesToJs o.classes
  , source               : map T.selectToJs o.source
  }
