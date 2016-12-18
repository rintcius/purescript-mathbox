module Mathbox.Class.Operator.Lerp where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type LerpG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , source               :: a T.Select
  , size                 :: a T.Mapping
  , items                :: b Number
  , width                :: b Number
  , height               :: b Number
  , depth                :: b Number
  , centeredX            :: a T.Bool
  , paddingX             :: a Number
  , centeredY            :: a T.Bool
  , paddingY             :: a Number
  , centeredZ            :: a T.Bool
  , paddingZ             :: a Number
  , centeredW            :: a T.Bool
  , paddingW             :: a Number
  }

type Lerp = LerpG Field MaybeField

type JsLerp =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , source               :: Field T.JsSelect
  , size                 :: Field T.JsMapping
  , items                :: Nullable (Field Number)
  , width                :: Nullable (Field Number)
  , height               :: Nullable (Field Number)
  , depth                :: Nullable (Field Number)
  , centeredX            :: Field T.Bool
  , paddingX             :: Field Number
  , centeredY            :: Field T.Bool
  , paddingY             :: Field Number
  , centeredZ            :: Field T.Bool
  , paddingZ             :: Field Number
  , centeredW            :: Field T.Bool
  , paddingW             :: Field Number
  }

mkLerp :: Lerp
mkLerp =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , source               : Val $ T.mkSelect0
  , size                 : Val $ T.MappingAbsolute
  , items                : Nothing
  , width                : Nothing
  , height               : Nothing
  , depth                : Nothing
  , centeredX            : Val $ false
  , paddingX             : Val $ 0.0
  , centeredY            : Val $ false
  , paddingY             : Val $ 0.0
  , centeredZ            : Val $ false
  , paddingZ             : Val $ 0.0
  , centeredW            : Val $ false
  , paddingW             : Val $ 0.0
  }

lerpToJs :: Lerp -> JsLerp
lerpToJs l =
  { id                   : toNullable l.id
  , classes              : map T.classesToJs l.classes
  , source               : map T.selectToJs l.source
  , size                 : map T.mappingToJs l.size
  , items                : toNullable l.items
  , width                : toNullable l.width
  , height               : toNullable l.height
  , depth                : toNullable l.depth
  , centeredX            : l.centeredX
  , paddingX             : l.paddingX
  , centeredY            : l.centeredY
  , paddingY             : l.paddingY
  , centeredZ            : l.centeredZ
  , paddingZ             : l.paddingZ
  , centeredW            : l.centeredW
  , paddingW             : l.paddingW
  }
