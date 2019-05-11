module Mathbox.Examples.Camera where

import Prelude ((>>=), ($), negate, (+), (*))
import Data.List (List(..), (:))
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Math as Math
import Prim as P

import Mathbox.Classes as C
import Mathbox.Field
import Mathbox.Mathbox
import Mathbox.Types

mathbox :: MathboxPrimitive
mathbox =
  (Cartesian $ C.mkCartesian { range = Val [mkVec2 (-1) 1, mkVec2 (-1) 1, mkVec2 (-1) 1], scale = Val (mkVec3 1 1 1) }) (
    (Camera $ C.mkCamera { lookAt = Just (Val (mkVec3 0 0 0)), position = Just (Fun (\t -> [(-3.0) * Math.cos(t) + 1.0, 0.4 * Math.cos(t * 0.381) + 1.0, (-3.0) * Math.sin(t) + 1.0])) }) :
    ((Transform3 $ C.mkTransform3 { position = Val [0.0, 0.5, 0.0] })
      ((Grid $ C.mkGrid { axes = Val $ mkSwizzle1 [1, 3], width = Val 2.0, color = Val $ unsafeMkColor "#b0b0b0", depth = Val 0.5 }) : Nil)
    ) :
    ((Transform3 $ C.mkTransform3 { position = Val [0.0, -0.5, 0.0] })
      ((Grid $ C.mkGrid { axes = Val $ mkSwizzle1 [1, 3], width = Val 2.0, color = Val $ unsafeMkColor "#2fff90", depth = Val 0.5 }) : Nil)
    ) :
    Nil
  )

main :: Effect Mathbox
main = do
  mkMathbox { plugins: ["core"] } >>=
  applyOnThree (setThreeClearColor colorWhite 1.0) >>=
  set { scale: Just 720.0, focus: Just 1.0 } >>=
  add (toJs mathbox)
