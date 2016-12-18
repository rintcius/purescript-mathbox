module Mathbox.Class.Data.Array where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type Array_G a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , channels             :: a Int
  , items                :: a Int
  , fps                  :: b Int
  , hurry                :: a Int
  , limit                :: a Int
  , realtime             :: a T.Bool
  , observe              :: a T.Bool
  , aligned              :: a T.Bool
  , data                 :: b T.Data
  , expr                 :: b T.Emitter
  , bind                 :: b T.Func
  , live                 :: a T.Bool
  , width                :: b Int
  , bufferWidth          :: a Int
  , history              :: a Int
  , minFilter            :: a T.Filter
  , magFilter            :: a T.Filter
  , type                 :: a T.Type
  }

type Array_ = Array_G Field MaybeField

type JsArray_ =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , channels             :: Field Int
  , items                :: Field Int
  , fps                  :: Nullable (Field Int)
  , hurry                :: Field Int
  , limit                :: Field Int
  , realtime             :: Field T.Bool
  , observe              :: Field T.Bool
  , aligned              :: Field T.Bool
  , data                 :: Nullable (Field T.Data)
  , expr                 :: Nullable (Field T.Emitter)
  , bind                 :: Nullable (Field T.Func)
  , live                 :: Field T.Bool
  , width                :: Nullable (Field Int)
  , bufferWidth          :: Field Int
  , history              :: Field Int
  , minFilter            :: Field T.JsFilter
  , magFilter            :: Field T.JsFilter
  , type                 :: Field T.JsType
  }

mkArray_ :: Array_
mkArray_ =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , channels             : Val $ 4
  , items                : Val $ 1
  , fps                  : Nothing
  , hurry                : Val $ 5
  , limit                : Val $ 60
  , realtime             : Val $ false
  , observe              : Val $ false
  , aligned              : Val $ false
  , data                 : Nothing
  , expr                 : Nothing
  , bind                 : Nothing
  , live                 : Val $ true
  , width                : Nothing
  , bufferWidth          : Val $ 1
  , history              : Val $ 1
  , minFilter            : Val $ T.FilterNearest
  , magFilter            : Val $ T.FilterNearest
  , type                 : Val $ T.TypeFloat
  }

array_ToJs :: Array_ -> JsArray_
array_ToJs a =
  { id                   : toNullable a.id
  , classes              : map T.classesToJs a.classes
  , channels             : a.channels
  , items                : a.items
  , fps                  : toNullable a.fps
  , hurry                : a.hurry
  , limit                : a.limit
  , realtime             : a.realtime
  , observe              : a.observe
  , aligned              : a.aligned
  , data                 : toNullable a.data
  , expr                 : toNullable a.expr
  , bind                 : toNullable a.bind
  , live                 : a.live
  , width                : toNullable a.width
  , bufferWidth          : a.bufferWidth
  , history              : a.history
  , minFilter            : map T.filterToJs a.minFilter
  , magFilter            : map T.filterToJs a.magFilter
  , type                 : map T.typeToJs a.type
  }
