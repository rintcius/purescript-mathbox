module Mathbox.Class.Text.Format where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type FormatG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , source               :: a T.Select
  , minFilter            :: a T.Filter
  , magFilter            :: a T.Filter
  , type                 :: a T.Type
  , digits               :: b Number
  , data                 :: b T.Data
  , expr                 :: b T.Func
  , live                 :: a T.Bool
  , font                 :: a T.Font
  , style                :: a String
  , variant              :: a String
  , weight               :: a String
  , detail               :: a Number
  , sdf                  :: a Number
  }

type Format = FormatG Field MaybeField

type JsFormat =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , source               :: Field T.JsSelect
  , minFilter            :: Field T.JsFilter
  , magFilter            :: Field T.JsFilter
  , type                 :: Field T.JsType
  , digits               :: Nullable (Field Number)
  , data                 :: Nullable (Field T.Data)
  , expr                 :: Nullable (Field T.Func)
  , live                 :: Field T.Bool
  , font                 :: Field T.JsFont
  , style                :: Field String
  , variant              :: Field String
  , weight               :: Field String
  , detail               :: Field Number
  , sdf                  :: Field Number
  }

mkFormat :: Format
mkFormat =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , source               : Val $ T.mkSelect0
  , minFilter            : Val $ T.FilterNearest
  , magFilter            : Val $ T.FilterNearest
  , type                 : Val $ T.TypeFloat
  , digits               : Nothing
  , data                 : Nothing
  , expr                 : Nothing
  , live                 : Val $ true
  , font                 : Val $ T.mkFont T.sansSerif
  , style                : Val $ T.mkString0
  , variant              : Val $ T.mkString0
  , weight               : Val $ T.mkString0
  , detail               : Val $ 24.0
  , sdf                  : Val $ 5.0
  }

formatToJs :: Format -> JsFormat
formatToJs f =
  { id                   : toNullable f.id
  , classes              : map T.classesToJs f.classes
  , source               : map T.selectToJs f.source
  , minFilter            : map T.filterToJs f.minFilter
  , magFilter            : map T.filterToJs f.magFilter
  , type                 : map T.typeToJs f.type
  , digits               : toNullable f.digits
  , data                 : toNullable f.data
  , expr                 : toNullable f.expr
  , live                 : f.live
  , font                 : map T.fontToJs f.font
  , style                : f.style
  , variant              : f.variant
  , weight               : f.weight
  , detail               : f.detail
  , sdf                  : f.sdf
  }
