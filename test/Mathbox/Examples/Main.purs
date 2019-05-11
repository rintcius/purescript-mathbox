module Mathbox.Examples.Main where

import Prelude (map, (>>=), ($), negate)
import Data.List (List(..), (:))
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Prim as P

import Mathbox.Classes as C
import Mathbox.Field
import Mathbox.Mathbox
import Mathbox.Types

mathbox :: List MathboxPrimitive
mathbox =
  (Camera $ C.mkCamera { proxy = Val true, position = Just (Val (mkVec3 0 0 3)) }) :
  (Cartesian $ C.mkCartesian { range = Val [mkVec2 (-2) 2, mkVec2 (-1) 1, mkVec2 (-1) 1], scale = Val (mkVec3 2 1 1) }) (
    (Axis $ C.mkAxis { width = Val 3.0 }) :
    (Axis $ C.mkAxis { width = Val 3.0, axis = Val axis2 }) :
    (Grid $ C.mkGrid { width = Val 2.0, divideX = Val 20.0, divideY = Val 10.0 }) :
    Nil
  ) :
  Nil

main :: Effect Mathbox
main = do
  mkMathbox { plugins: ["core", "controls", "cursor"]
            , controls: { klass: trackballControls }
            } >>=
  applyOnThree (setThreeClearColor colorWhite 1.0) >>=
  set { focus: Just 3.0, scale: Just 720.0 } >>=
  addAll (map toJs mathbox)
