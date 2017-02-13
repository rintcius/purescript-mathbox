module Mathbox.Class.Data.Voxel where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type VoxelG a b =
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
  }

type Voxel = VoxelG Field MaybeField

type JsVoxel =
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
  }

mkVoxel :: Voxel
mkVoxel =
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
  }

voxelToJs :: Voxel -> JsVoxel
voxelToJs v =
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
  }
