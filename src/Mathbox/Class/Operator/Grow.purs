module Mathbox.Class.Operator.Grow where

import Prelude (($), map, negate)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type GrowG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , source               :: a T.Select
  , scale                :: a Number
  , items                :: b T.Anchor
  , width                :: b T.Anchor
  , height               :: b T.Anchor
  , depth                :: b T.Anchor
  }

type Grow = GrowG Field MaybeField

type JsGrow =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , source               :: Field T.JsSelect
  , scale                :: Field Number
  , items                :: Nullable (Field T.JsAnchor)
  , width                :: Nullable (Field T.JsAnchor)
  , height               :: Nullable (Field T.JsAnchor)
  , depth                :: Nullable (Field T.JsAnchor)
  }

mkGrow :: Grow
mkGrow =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , source               : Val $ T.mkSelect0
  , scale                : Val $ 1.0
  , items                : Nothing
  , width                : Nothing
  , height               : Nothing
  , depth                : Nothing
  }

growToJs :: Grow -> JsGrow
growToJs g =
  { id                   : toNullable g.id
  , classes              : map T.classesToJs g.classes
  , source               : map T.selectToJs g.source
  , scale                : g.scale
  , items                : maybeToNullable T.anchorToJs g.items
  , width                : maybeToNullable T.anchorToJs g.width
  , height               : maybeToNullable T.anchorToJs g.height
  , depth                : maybeToNullable T.anchorToJs g.depth
  }
