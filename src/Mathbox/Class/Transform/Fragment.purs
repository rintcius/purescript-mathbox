module Mathbox.Class.Transform.Fragment where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type FragmentG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , shader               :: a T.Select
  , pass                 :: a T.FragmentPass
  , gamma                :: a T.Bool
  }

type Fragment = FragmentG Field MaybeField

type JsFragment =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , shader               :: Field T.JsSelect
  , pass                 :: Field T.JsFragmentPass
  , gamma                :: Field T.Bool
  }

mkFragment :: Fragment
mkFragment =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , shader               : Val $ T.mkSelect0
  , pass                 : Val $ T.mkFragmentPass0
  , gamma                : Val $ false
  }

fragmentToJs :: Fragment -> JsFragment
fragmentToJs f =
  { id                   : toNullable f.id
  , classes              : map T.classesToJs f.classes
  , shader               : map T.selectToJs f.shader
  , pass                 : map T.fragmentPassToJs f.pass
  , gamma                : f.gamma
  }
