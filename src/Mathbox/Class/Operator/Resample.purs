module Mathbox.Class.Operator.Resample where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type ResampleG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , source               :: a T.Select
  , indices              :: a Number
  , channels             :: a Number
  , sample               :: a T.Mapping
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
  , shader               :: a T.Select
  }

type Resample = ResampleG Field MaybeField

type JsResample =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , source               :: Field T.JsSelect
  , indices              :: Field Number
  , channels             :: Field Number
  , sample               :: Field T.JsMapping
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
  , shader               :: Field T.JsSelect
  }

mkResample :: Resample
mkResample =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , source               : Val $ T.mkSelect0
  , indices              : Val $ 4.0
  , channels             : Val $ 4.0
  , sample               : Val $ T.mkMapping0
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
  , shader               : Val $ T.mkSelect0
  }

resampleToJs :: Resample -> JsResample
resampleToJs r =
  { id                   : toNullable r.id
  , classes              : map T.classesToJs r.classes
  , source               : map T.selectToJs r.source
  , indices              : r.indices
  , channels             : r.channels
  , sample               : map T.mappingToJs r.sample
  , size                 : map T.mappingToJs r.size
  , items                : toNullable r.items
  , width                : toNullable r.width
  , height               : toNullable r.height
  , depth                : toNullable r.depth
  , centeredX            : r.centeredX
  , paddingX             : r.paddingX
  , centeredY            : r.centeredY
  , paddingY             : r.paddingY
  , centeredZ            : r.centeredZ
  , paddingZ             : r.paddingZ
  , centeredW            : r.centeredW
  , paddingW             : r.paddingW
  , shader               : map T.selectToJs r.shader
  }
