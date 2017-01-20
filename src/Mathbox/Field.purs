module Mathbox.Field where

import Mathbox.Types as T
import Data.Functor (class Functor, map)
import Data.Maybe (Maybe(..))
import Data.Nullable (Nullable, toNullable)
import Prelude (($))
import Signal (Signal)

data Field a = Val a | Fun (Number -> a) | Sig (Signal a)

instance functorField :: Functor Field where
  map f (Val v) = Val (f v)
  map f (Fun fn) = Fun (\n -> f (fn n))
  map f (Sig s) = Sig (map f s)

type MaybeField a = Maybe (Field a)

constrName :: forall a. Field a -> String
constrName (Val v) = "Val"
constrName (Fun f) = "Fun"
constrName (Sig s) = "Sig"

maybeToNullable :: forall a b. (a -> b) -> Maybe (Field a) -> Nullable (Field b)
maybeToNullable f Nothing = toNullable Nothing
maybeToNullable f (Just p) = toNullable $ Just (map f p)

mapPos :: forall a b. (a -> b) -> Field (T.Positive a) -> Field (T.Positive b)
mapPos f p = map f p
