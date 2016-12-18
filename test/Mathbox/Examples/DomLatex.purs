module Mathbox.Examples.DomLatex where

import Prelude ((>>=), negate, ($), (*), (/), (+))
import Control.Monad.Eff (Eff)
import Data.Foreign (Foreign)
import Data.Function.Uncurried (Fn4, mkFn4, runFn2)
import Data.List (List(..), (:))
import Data.Maybe (Maybe(..))
import Math as Math
import Prim as P

import Mathbox.Classes as C
import Mathbox.Field
import Mathbox.Mathbox
import Mathbox.Types

foreign import setThreeProps :: forall eff. Three -> Eff ( mathbox :: MATHBOX | eff) Three
foreign import htmlExpr :: Foreign -> Foreign -> Foreign -> Foreign -> Foreign

ex :: Emitter_4_2
ex = mkFn4 ( \emit x i time -> do
       let y = Math.sin(x + (time * 0.2) / 4.0) * 0.7
       runFn2 emit x y
     )

ex2 :: Fn4 Foreign Foreign Foreign Foreign Foreign
ex2 = mkFn4 ( \emit el i j -> do
        htmlExpr emit el i j
      )

mathbox :: MathboxPrimitive
mathbox =
  (Unit $ C.mkUnit { scale = Nothing }) (
    (Cartesian $ C.mkCartesian { range = Val [mkVec2 (-2) 2, mkVec2 (-1) 1, mkVec2 (-1) 1], scale = Val (mkVec3 2 1 1) }) (
      (Axis $ C.mkAxis { zBias = Val (-10.0), end = Val true, width = Val 10.0 }) :
      (Axis $ C.mkAxis { axis = Val axis2, zBias = Val (-10.0), end = Val true, width = Val 10.0 }) :
      (Grid $ C.mkGrid { divideX = Val 30.0, width = Val 10.0, opacity = Val 0.5, zBias = Val (-10.0), axes = Val $ mkSwizzle1 [1, 3] }) :
      (Interval $ C.mkInterval { width = Just $ Val 8, expr = Just (Val $ wrapEmitter ex), channels = Val 2 }) :
      (Repeat $ C.mkRepeat { height = Val 3.0, depth = Val 2.0 }) :
      (Spread $ C.mkSpread { unit = Val MappingAbsolute, height = Just $ Val [0.0, 0.0, 0.5], depth = Just $ Val [0.0, 0.5, 0.0] }) :
      (Point $ C.mkPoint { color = Val $ unsafeMkColor "#3090FF", size = Val 40.0 }):
      (HTML $ C.mkHTML { width = Just $ Val 8, height = Just $ Val 3, depth = Just $ Val 2, expr = Just $ Val $ wrapEmitter ex2 }):
      (DOM $ C.mkDOM { snap = Val false, offset = Val [0.0, (-32.0)], depth = Val 0.5, size = Val 24.0, zoom = Val 1.0, outline = Val 2.0 }):
      Nil
    ) :
    Nil
  )

main :: forall t. Eff ( mathbox :: MATHBOX | t ) Mathbox
main = do
  mkMathbox { plugins: ["core", "controls", "cursor", "stats"]
            , controls: { klass: orbitControls }
            , camera: { near : 0.01, far : 1000.0 }
            } >>=
  applyOnThree setThreeProps >>=
  add (toJs mathbox)
