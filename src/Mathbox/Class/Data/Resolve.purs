module Mathbox.Class.Data.Resolve where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type ResolveG a b =
  { id                   :: b String
  , classes              :: a T.Classes
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

type Resolve = ResolveG Field MaybeField

type JsResolve =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
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

mkResolve :: Resolve
mkResolve =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
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

resolveToJs :: Resolve -> JsResolve
resolveToJs r =
  { id                   : toNullable r.id
  , classes              : map T.classesToJs r.classes
  , data                 : toNullable r.data
  , expr                 : toNullable r.expr
  , bind                 : toNullable r.bind
  , live                 : r.live
  , width                : toNullable r.width
  , height               : toNullable r.height
  , depth                : toNullable r.depth
  , bufferWidth          : r.bufferWidth
  , bufferHeight         : r.bufferHeight
  , bufferDepth          : r.bufferDepth
  }
