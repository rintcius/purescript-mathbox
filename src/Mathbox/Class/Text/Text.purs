module Mathbox.Class.Text.Text where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type TextG a b =
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
  , minFilter            :: a T.Filter
  , magFilter            :: a T.Filter
  , type                 :: a T.Type
  , width                :: b Int
  , height               :: b Int
  , depth                :: b Int
  , bufferWidth          :: a Int
  , bufferHeight         :: a Int
  , bufferDepth          :: a Int
  , font                 :: a T.Font
  , style                :: a String
  , variant              :: a String
  , weight               :: a String
  , detail               :: a Number
  , sdf                  :: a Number
  }

type Text = TextG Field MaybeField

type JsText =
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
  , minFilter            :: Field T.JsFilter
  , magFilter            :: Field T.JsFilter
  , type                 :: Field T.JsType
  , width                :: Nullable (Field Int)
  , height               :: Nullable (Field Int)
  , depth                :: Nullable (Field Int)
  , bufferWidth          :: Field Int
  , bufferHeight         :: Field Int
  , bufferDepth          :: Field Int
  , font                 :: Field T.JsFont
  , style                :: Field String
  , variant              :: Field String
  , weight               :: Field String
  , detail               :: Field Number
  , sdf                  :: Field Number
  }

mkText :: Text
mkText =
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
  , minFilter            : Val $ T.FilterNearest
  , magFilter            : Val $ T.FilterNearest
  , type                 : Val $ T.TypeFloat
  , width                : Nothing
  , height               : Nothing
  , depth                : Nothing
  , bufferWidth          : Val $ 1
  , bufferHeight         : Val $ 1
  , bufferDepth          : Val $ 1
  , font                 : Val $ T.mkFont T.sansSerif
  , style                : Val $ T.mkString0
  , variant              : Val $ T.mkString0
  , weight               : Val $ T.mkString0
  , detail               : Val $ 24.0
  , sdf                  : Val $ 5.0
  }

textToJs :: Text -> JsText
textToJs t =
  { id                   : toNullable t.id
  , classes              : map T.classesToJs t.classes
  , items                : t.items
  , fps                  : toNullable t.fps
  , hurry                : t.hurry
  , limit                : t.limit
  , realtime             : t.realtime
  , observe              : t.observe
  , aligned              : t.aligned
  , data                 : toNullable t.data
  , expr                 : toNullable t.expr
  , bind                 : toNullable t.bind
  , live                 : t.live
  , minFilter            : map T.filterToJs t.minFilter
  , magFilter            : map T.filterToJs t.magFilter
  , type                 : map T.typeToJs t.type
  , width                : toNullable t.width
  , height               : toNullable t.height
  , depth                : toNullable t.depth
  , bufferWidth          : t.bufferWidth
  , bufferHeight         : t.bufferHeight
  , bufferDepth          : t.bufferDepth
  , font                 : map T.fontToJs t.font
  , style                : t.style
  , variant              : t.variant
  , weight               : t.weight
  , detail               : t.detail
  , sdf                  : t.sdf
  }
