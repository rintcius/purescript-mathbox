module Mathbox.Class.Rtt.RTT where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type RTTG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , speed                :: a Number
  , camera               :: a T.Select
  , pass                 :: a T.VertexPass
  , minFilter            :: a T.Filter
  , magFilter            :: a T.Filter
  , type                 :: a T.Type
  , size                 :: a T.Mapping
  , width                :: b Number
  , height               :: b Number
  , history              :: a Int
  }

type RTT = RTTG Field MaybeField

type JsRTT =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , speed                :: Field Number
  , camera               :: Field T.JsSelect
  , pass                 :: Field T.JsVertexPass
  , minFilter            :: Field T.JsFilter
  , magFilter            :: Field T.JsFilter
  , type                 :: Field T.JsType
  , size                 :: Field T.JsMapping
  , width                :: Nullable (Field Number)
  , height               :: Nullable (Field Number)
  , history              :: Field Int
  }

mkRTT :: RTT
mkRTT =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , speed                : Val $ 1.0
  , camera               : Val $ T.mkSelect [ T.camera ]
  , pass                 : Val $ T.mkVertexPass0
  , minFilter            : Val $ T.FilterNearest
  , magFilter            : Val $ T.FilterNearest
  , type                 : Val $ T.TypeFloat
  , size                 : Val $ T.MappingAbsolute
  , width                : Nothing
  , height               : Nothing
  , history              : Val $ 1
  }

rTTToJs :: RTT -> JsRTT
rTTToJs r =
  { id                   : toNullable r.id
  , classes              : map T.classesToJs r.classes
  , speed                : r.speed
  , camera               : map T.selectToJs r.camera
  , pass                 : map T.vertexPassToJs r.pass
  , minFilter            : map T.filterToJs r.minFilter
  , magFilter            : map T.filterToJs r.magFilter
  , type                 : map T.typeToJs r.type
  , size                 : map T.mappingToJs r.size
  , width                : toNullable r.width
  , height               : toNullable r.height
  , history              : r.history
  }
