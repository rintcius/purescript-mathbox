module Mathbox.Class.Operator.Spread where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type SpreadG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , source               :: a T.Select
  , unit                 :: a T.Mapping
  , items                :: b T.Vec4
  , width                :: b T.Vec4
  , height               :: b T.Vec4
  , depth                :: b T.Vec4
  , alignItems           :: a T.Anchor
  , alignWidth           :: a T.Anchor
  , alignHeight          :: a T.Anchor
  , alignDepth           :: a T.Anchor
  }

type Spread = SpreadG Field MaybeField

type JsSpread =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , source               :: Field T.JsSelect
  , unit                 :: Field T.JsMapping
  , items                :: Nullable (Field T.Vec4)
  , width                :: Nullable (Field T.Vec4)
  , height               :: Nullable (Field T.Vec4)
  , depth                :: Nullable (Field T.Vec4)
  , alignItems           :: Field T.JsAnchor
  , alignWidth           :: Field T.JsAnchor
  , alignHeight          :: Field T.JsAnchor
  , alignDepth           :: Field T.JsAnchor
  }

mkSpread :: Spread
mkSpread =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , source               : Val $ T.mkSelect0
  , unit                 : Val $ T.mkMapping0
  , items                : Nothing
  , width                : Nothing
  , height               : Nothing
  , depth                : Nothing
  , alignItems           : Val $ T.mkAnchor0
  , alignWidth           : Val $ T.mkAnchor0
  , alignHeight          : Val $ T.mkAnchor0
  , alignDepth           : Val $ T.mkAnchor0
  }

spreadToJs :: Spread -> JsSpread
spreadToJs s =
  { id                   : toNullable s.id
  , classes              : map T.classesToJs s.classes
  , source               : map T.selectToJs s.source
  , unit                 : map T.mappingToJs s.unit
  , items                : toNullable s.items
  , width                : toNullable s.width
  , height               : toNullable s.height
  , depth                : toNullable s.depth
  , alignItems           : map T.anchorToJs s.alignItems
  , alignWidth           : map T.anchorToJs s.alignWidth
  , alignHeight          : map T.anchorToJs s.alignHeight
  , alignDepth           : map T.anchorToJs s.alignDepth
  }
