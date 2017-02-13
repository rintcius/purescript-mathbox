module Mathbox.Class.Present.Track where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type TrackG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , target               :: a T.Select
  , script               :: a T.Object
  , ease                 :: a T.Ease
  , seek                 :: b Number
  }

type Track = TrackG Field MaybeField

type JsTrack =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , target               :: Field T.JsSelect
  , script               :: Field T.Object
  , ease                 :: Field T.JsEase
  , seek                 :: Nullable (Field Number)
  }

mkTrack :: Track
mkTrack =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , target               : Val $ T.mkSelect0
  , script               : Val $ T.mkObject0
  , ease                 : Val $ T.EaseCosine
  , seek                 : Nothing
  }

trackToJs :: Track -> JsTrack
trackToJs t =
  { id                   : toNullable t.id
  , classes              : map T.classesToJs t.classes
  , target               : map T.selectToJs t.target
  , script               : t.script
  , ease                 : map T.easeToJs t.ease
  , seek                 : toNullable t.seek
  }
