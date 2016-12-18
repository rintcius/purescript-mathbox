module Mathbox.Examples.Curve where

import Prelude (($), (>>=), negate, (+), (*))
import Control.Monad.Eff (Eff)
import Data.Function.Uncurried (runFn2, mkFn4)
import Data.List (List(..), (:))
import Data.Maybe (Maybe(..))
import Optic.Core ((.~))
import Math as Math
import Prim as P

import Mathbox.Classes as C
import Mathbox.Field
import Mathbox.Lenses as L
import Mathbox.Mathbox
import Mathbox.Types

foreign import setThreeProps :: forall eff. Three -> Eff ( mathbox :: MATHBOX | eff) Three

ex :: Emitter_4_2
ex = mkFn4 ( \emit x i t -> do
       let y = Math.sin(x + t) * 0.7 -- + (i%2.0)* Math.sin(x * 400000.0 + t * 5.0 + x * x * 10000.0)* 0.05
       runFn2 emit x y
     )

mathbox :: MathboxPrimitive
mathbox =
  (Cartesian $ C.mkCartesian { range =  Val [mkVec2 (-2) 2, mkVec2 (-1) 1, mkVec2 (-1) 1], scale = Val (mkVec3 2 1 1) }) (
    (Axis $ C.mkAxis { detail = Val 30 }) :
    (Axis $ C.mkAxis { axis = Val axis2 }) :
    (Scale $ C.mkScale { divide = Val 10.0 }) :
    (Ticks $ C.mkTicks { classes = Val $ mkClasses ["foo", "bar"], width = Val 2.0 }) :
    (Grid $ C.mkGrid { divideX = Val 30.0, width = Val 1.0, opacity = Val 0.5, zBias = Val (-5.0), axes = Val $ mkSwizzle1 [1, 2] }) :
    (Interval $ C.mkInterval { id = Just (Val "sampler"), width = Just (Val 64), expr = Just (Val $ wrapEmitter ex), channels = Val 2 }) :
    (Line $ C.mkLine { points = Val $ mkSelect ["#sampler"], color = Val $ unsafeMkColor "#3090FF", width = Val 5.0 }) :
    (Transform3 $ C.mkTransform3 { position = Val [0.0, 0.1, 0.0] }) (
      (Line $ C.mkLine { points = Val $ mkSelect ["#sampler"], color = Val $ unsafeMkColor "#3090FF", width = Val 5.0, stroke = Val StrokeDotted }) : Nil
    ) :
    (Transform3 $ C.mkTransform3 { position = Val [0.0, -0.1, 0.0] }) (
      (Line $ C.mkLine { points = Val $ mkSelect ["#sampler"], color = Val $ unsafeMkColor "#3090FF", width = Val 5.0, stroke = Val StrokeDashed }) : Nil
    ) :
    Nil
  )

main :: forall t. Eff ( mathbox :: MATHBOX | t ) Mathbox
main = do
  mkMathbox { plugins: ["core", "controls", "cursor"], controls: { klass: orbitControls } } >>=
  applyOnThree setThreeProps >>=
  set ( L.focus .~ Just 3.0 $ mkSet ) >>=
  add (toJs mathbox)
