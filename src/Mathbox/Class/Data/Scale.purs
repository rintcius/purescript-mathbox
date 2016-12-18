module Mathbox.Class.Data.Scale where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type ScaleG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , axis                 :: a T.Axis
  , range                :: b T.Vec2
  , divide               :: a Number
  , unit                 :: a Number
  , base                 :: a Number
  , mode                 :: a T.Scale
  , start                :: a T.Bool
  , end                  :: a T.Bool
  , zero                 :: a T.Bool
  , factor               :: a Number
  , nice                 :: a T.Bool
  , origin               :: a T.Vec4
  }

type Scale = ScaleG Field MaybeField

type JsScale =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , axis                 :: Field T.JsAxis
  , range                :: Nullable (Field T.Vec2)
  , divide               :: Field Number
  , unit                 :: Field Number
  , base                 :: Field Number
  , mode                 :: Field T.JsScale
  , start                :: Field T.Bool
  , end                  :: Field T.Bool
  , zero                 :: Field T.Bool
  , factor               :: Field Number
  , nice                 :: Field T.Bool
  , origin               :: Field T.Vec4
  }

mkScale :: Scale
mkScale =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , axis                 : Val $ T.mkAxis0
  , range                : Nothing
  , divide               : Val $ 10.0
  , unit                 : Val $ 1.0
  , base                 : Val $ 10.0
  , mode                 : Val $ T.mkScale0
  , start                : Val $ true
  , end                  : Val $ true
  , zero                 : Val $ true
  , factor               : Val $ 1.0
  , nice                 : Val $ true
  , origin               : Val $ T.mkVec40
  }

scaleToJs :: Scale -> JsScale
scaleToJs s =
  { id                   : toNullable s.id
  , classes              : map T.classesToJs s.classes
  , axis                 : map T.axisToJs s.axis
  , range                : toNullable s.range
  , divide               : s.divide
  , unit                 : s.unit
  , base                 : s.base
  , mode                 : map T.scaleToJs s.mode
  , start                : s.start
  , end                  : s.end
  , zero                 : s.zero
  , factor               : s.factor
  , nice                 : s.nice
  , origin               : s.origin
  }
