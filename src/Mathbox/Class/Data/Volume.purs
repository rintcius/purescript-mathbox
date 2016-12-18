module Mathbox.Class.Data.Volume where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type VolumeG a b =
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
  , depth                :: b Int
  , bufferWidth          :: a Int
  , bufferHeight         :: a Int
  , bufferDepth          :: a Int
  , rangeX               :: b T.Vec2
  , rangeY               :: b T.Vec2
  , rangeZ               :: b T.Vec2
  , axes                 :: a T.Swizzle
  , centeredX            :: a T.Bool
  , paddingX             :: a Number
  , centeredY            :: a T.Bool
  , paddingY             :: a Number
  , centeredZ            :: a T.Bool
  , paddingZ             :: a Number
  }

type Volume = VolumeG Field MaybeField

type JsVolume =
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
  , depth                :: Nullable (Field Int)
  , bufferWidth          :: Field Int
  , bufferHeight         :: Field Int
  , bufferDepth          :: Field Int
  , rangeX               :: Nullable (Field T.Vec2)
  , rangeY               :: Nullable (Field T.Vec2)
  , rangeZ               :: Nullable (Field T.Vec2)
  , axes                 :: Field T.JsSwizzle
  , centeredX            :: Field T.Bool
  , paddingX             :: Field Number
  , centeredY            :: Field T.Bool
  , paddingY             :: Field Number
  , centeredZ            :: Field T.Bool
  , paddingZ             :: Field Number
  }

mkVolume :: Volume
mkVolume =
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
  , depth                : Nothing
  , bufferWidth          : Val $ 1
  , bufferHeight         : Val $ 1
  , bufferDepth          : Val $ 1
  , rangeX               : Nothing
  , rangeY               : Nothing
  , rangeZ               : Nothing
  , axes                 : Val $ T.mkSwizzle [1,2,3] 3
  , centeredX            : Val $ false
  , paddingX             : Val $ 0.0
  , centeredY            : Val $ false
  , paddingY             : Val $ 0.0
  , centeredZ            : Val $ false
  , paddingZ             : Val $ 0.0
  }

volumeToJs :: Volume -> JsVolume
volumeToJs v =
  { id                   : toNullable v.id
  , classes              : map T.classesToJs v.classes
  , channels             : v.channels
  , items                : v.items
  , fps                  : toNullable v.fps
  , hurry                : v.hurry
  , limit                : v.limit
  , realtime             : v.realtime
  , observe              : v.observe
  , aligned              : v.aligned
  , data                 : toNullable v.data
  , expr                 : toNullable v.expr
  , bind                 : toNullable v.bind
  , live                 : v.live
  , minFilter            : map T.filterToJs v.minFilter
  , magFilter            : map T.filterToJs v.magFilter
  , type                 : map T.typeToJs v.type
  , width                : toNullable v.width
  , height               : toNullable v.height
  , depth                : toNullable v.depth
  , bufferWidth          : v.bufferWidth
  , bufferHeight         : v.bufferHeight
  , bufferDepth          : v.bufferDepth
  , rangeX               : toNullable v.rangeX
  , rangeY               : toNullable v.rangeY
  , rangeZ               : toNullable v.rangeZ
  , axes                 : map T.swizzleToJs v.axes
  , centeredX            : v.centeredX
  , paddingX             : v.paddingX
  , centeredY            : v.centeredY
  , paddingY             : v.paddingY
  , centeredZ            : v.centeredZ
  , paddingZ             : v.paddingZ
  }
