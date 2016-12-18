module Mathbox.Class.Base.Source where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type SourceG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  }

type Source = SourceG Field MaybeField

type JsSource =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  }

mkSource :: Source
mkSource =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  }

sourceToJs :: Source -> JsSource
sourceToJs s =
  { id                   : toNullable s.id
  , classes              : map T.classesToJs s.classes
  }
