module Mathbox.Class.Overlay.HTML where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type HTMLG a b =
  { id                   :: b String
  , classes              :: a T.Classes
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
  , depth                :: b Int
  , bufferWidth          :: a Int
  , bufferHeight         :: a Int
  , bufferDepth          :: a Int
  }

type HTML = HTMLG Field MaybeField

type JsHTML =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
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
  , depth                :: Nullable (Field Int)
  , bufferWidth          :: Field Int
  , bufferHeight         :: Field Int
  , bufferDepth          :: Field Int
  }

mkHTML :: HTML
mkHTML =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
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
  , depth                : Nothing
  , bufferWidth          : Val $ 1
  , bufferHeight         : Val $ 1
  , bufferDepth          : Val $ 1
  }

hTMLToJs :: HTML -> JsHTML
hTMLToJs h =
  { id                   : toNullable h.id
  , classes              : map T.classesToJs h.classes
  , items                : h.items
  , fps                  : toNullable h.fps
  , hurry                : h.hurry
  , limit                : h.limit
  , realtime             : h.realtime
  , observe              : h.observe
  , aligned              : h.aligned
  , data                 : toNullable h.data
  , expr                 : toNullable h.expr
  , bind                 : toNullable h.bind
  , live                 : h.live
  , width                : toNullable h.width
  , height               : toNullable h.height
  , depth                : toNullable h.depth
  , bufferWidth          : h.bufferWidth
  , bufferHeight         : h.bufferHeight
  , bufferDepth          : h.bufferDepth
  }
