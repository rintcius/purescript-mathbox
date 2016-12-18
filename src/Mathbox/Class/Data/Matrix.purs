module Mathbox.Class.Data.Matrix where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type MatrixG a b =
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
  , minFilter            :: a T.Filter
  , magFilter            :: a T.Filter
  , type                 :: a T.Type
  , width                :: b Int
  , height               :: b Int
  , history              :: a Int
  , bufferWidth          :: a Int
  , bufferHeight         :: a Int
  }

type Matrix = MatrixG Field MaybeField

type JsMatrix =
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
  , minFilter            :: Field T.JsFilter
  , magFilter            :: Field T.JsFilter
  , type                 :: Field T.JsType
  , width                :: Nullable (Field Int)
  , height               :: Nullable (Field Int)
  , history              :: Field Int
  , bufferWidth          :: Field Int
  , bufferHeight         :: Field Int
  }

mkMatrix :: Matrix
mkMatrix =
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
  , minFilter            : Val $ T.FilterNearest
  , magFilter            : Val $ T.FilterNearest
  , type                 : Val $ T.TypeFloat
  , width                : Nothing
  , height               : Nothing
  , history              : Val $ 1
  , bufferWidth          : Val $ 1
  , bufferHeight         : Val $ 1
  }

matrixToJs :: Matrix -> JsMatrix
matrixToJs m =
  { id                   : toNullable m.id
  , classes              : map T.classesToJs m.classes
  , channels             : m.channels
  , items                : m.items
  , fps                  : toNullable m.fps
  , hurry                : m.hurry
  , limit                : m.limit
  , realtime             : m.realtime
  , observe              : m.observe
  , aligned              : m.aligned
  , data                 : toNullable m.data
  , expr                 : toNullable m.expr
  , bind                 : toNullable m.bind
  , live                 : m.live
  , minFilter            : map T.filterToJs m.minFilter
  , magFilter            : map T.filterToJs m.magFilter
  , type                 : map T.typeToJs m.type
  , width                : toNullable m.width
  , height               : toNullable m.height
  , history              : m.history
  , bufferWidth          : m.bufferWidth
  , bufferHeight         : m.bufferHeight
  }
