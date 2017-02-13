module Mathbox.Class.Data.Interval where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type IntervalG a b =
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
  , bufferWidth          :: a Int
  , history              :: a Int
  , range                :: b T.Vec2
  , axis                 :: a T.Axis
  , centered             :: a T.Bool
  , padding              :: a Number
  }

type Interval = IntervalG Field MaybeField

type JsInterval =
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
  , bufferWidth          :: Field Int
  , history              :: Field Int
  , range                :: Nullable (Field T.Vec2)
  , axis                 :: Field T.JsAxis
  , centered             :: Field T.Bool
  , padding              :: Field Number
  }

mkInterval :: Interval
mkInterval =
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
  , bufferWidth          : Val $ 1
  , history              : Val $ 1
  , range                : Nothing
  , axis                 : Val $ T.mkAxis0
  , centered             : Val $ false
  , padding              : Val $ 0.0
  }

intervalToJs :: Interval -> JsInterval
intervalToJs i =
  { id                   : toNullable i.id
  , classes              : map T.classesToJs i.classes
  , channels             : i.channels
  , items                : i.items
  , fps                  : toNullable i.fps
  , hurry                : i.hurry
  , limit                : i.limit
  , realtime             : i.realtime
  , observe              : i.observe
  , aligned              : i.aligned
  , data                 : toNullable i.data
  , expr                 : toNullable i.expr
  , bind                 : toNullable i.bind
  , live                 : i.live
  , minFilter            : map T.filterToJs i.minFilter
  , magFilter            : map T.filterToJs i.magFilter
  , type                 : map T.typeToJs i.type
  , width                : toNullable i.width
  , bufferWidth          : i.bufferWidth
  , history              : i.history
  , range                : toNullable i.range
  , axis                 : map T.axisToJs i.axis
  , centered             : i.centered
  , padding              : i.padding
  }
