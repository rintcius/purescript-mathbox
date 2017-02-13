module Mathbox.Class.Data.Buffer where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type BufferG a b =
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
  }

type Buffer = BufferG Field MaybeField

type JsBuffer =
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
  }

mkBuffer :: Buffer
mkBuffer =
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
  }

bufferToJs :: Buffer -> JsBuffer
bufferToJs b =
  { id                   : toNullable b.id
  , classes              : map T.classesToJs b.classes
  , channels             : b.channels
  , items                : b.items
  , fps                  : toNullable b.fps
  , hurry                : b.hurry
  , limit                : b.limit
  , realtime             : b.realtime
  , observe              : b.observe
  , aligned              : b.aligned
  , data                 : toNullable b.data
  , expr                 : toNullable b.expr
  , bind                 : toNullable b.bind
  , live                 : b.live
  , minFilter            : map T.filterToJs b.minFilter
  , magFilter            : map T.filterToJs b.magFilter
  , type                 : map T.typeToJs b.type
  }
