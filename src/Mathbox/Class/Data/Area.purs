module Mathbox.Class.Data.Area where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type AreaG a b =
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
  , height               :: b Int
  , history              :: a Int
  , bufferWidth          :: a Int
  , bufferHeight         :: a Int
  , minFilter            :: a T.Filter
  , magFilter            :: a T.Filter
  , type                 :: a T.Type
  , rangeX               :: b T.Vec2
  , rangeY               :: b T.Vec2
  , axes                 :: a T.Swizzle
  , centeredX            :: a T.Bool
  , paddingX             :: a Number
  , centeredY            :: a T.Bool
  , paddingY             :: a Number
  }

type Area = AreaG Field MaybeField

type JsArea =
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
  , height               :: Nullable (Field Int)
  , history              :: Field Int
  , bufferWidth          :: Field Int
  , bufferHeight         :: Field Int
  , minFilter            :: Field T.JsFilter
  , magFilter            :: Field T.JsFilter
  , type                 :: Field T.JsType
  , rangeX               :: Nullable (Field T.Vec2)
  , rangeY               :: Nullable (Field T.Vec2)
  , axes                 :: Field T.JsSwizzle
  , centeredX            :: Field T.Bool
  , paddingX             :: Field Number
  , centeredY            :: Field T.Bool
  , paddingY             :: Field Number
  }

mkArea :: Area
mkArea =
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
  , height               : Nothing
  , history              : Val $ 1
  , bufferWidth          : Val $ 1
  , bufferHeight         : Val $ 1
  , minFilter            : Val $ T.FilterNearest
  , magFilter            : Val $ T.FilterNearest
  , type                 : Val $ T.TypeFloat
  , rangeX               : Nothing
  , rangeY               : Nothing
  , axes                 : Val $ T.mkSwizzle [1,2] 2
  , centeredX            : Val $ false
  , paddingX             : Val $ 0.0
  , centeredY            : Val $ false
  , paddingY             : Val $ 0.0
  }

areaToJs :: Area -> JsArea
areaToJs a =
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
  , height               : toNullable a.height
  , history              : a.history
  , bufferWidth          : a.bufferWidth
  , bufferHeight         : a.bufferHeight
  , minFilter            : map T.filterToJs a.minFilter
  , magFilter            : map T.filterToJs a.magFilter
  , type                 : map T.typeToJs a.type
  , rangeX               : toNullable a.rangeX
  , rangeY               : toNullable a.rangeY
  , axes                 : map T.swizzleToJs a.axes
  , centeredX            : a.centeredX
  , paddingX             : a.paddingX
  , centeredY            : a.centeredY
  , paddingY             : a.paddingY
  }
