module Mathbox.Class.Base.Inherit where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type InheritG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  }

type Inherit = InheritG Field MaybeField

type JsInherit =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  }

mkInherit :: Inherit
mkInherit =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  }

inheritToJs :: Inherit -> JsInherit
inheritToJs i =
  { id                   : toNullable i.id
  , classes              : map T.classesToJs i.classes
  }
