module Mathbox.Class.Present.Slide where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type SlideG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , order                :: b Int
  , steps                :: a Number
  , early                :: a Int
  , late                 :: a Int
  , from                 :: b Int
  , to                   :: b Int
  }

type Slide = SlideG Field MaybeField

type JsSlide =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , order                :: Nullable (Field Int)
  , steps                :: Field Number
  , early                :: Field Int
  , late                 :: Field Int
  , from                 :: Nullable (Field Int)
  , to                   :: Nullable (Field Int)
  }

mkSlide :: Slide
mkSlide =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , order                : Nothing
  , steps                : Val $ 1.0
  , early                : Val $ 0
  , late                 : Val $ 0
  , from                 : Nothing
  , to                   : Nothing
  }

slideToJs :: Slide -> JsSlide
slideToJs s =
  { id                   : toNullable s.id
  , classes              : map T.classesToJs s.classes
  , order                : toNullable s.order
  , steps                : s.steps
  , early                : s.early
  , late                 : s.late
  , from                 : toNullable s.from
  , to                   : toNullable s.to
  }
