module Mathbox.Examples.Cartesian4 where

import Prelude ((>>=), ($), negate, (*), (+), (-), (/))
import Control.Monad.Eff (Eff)
import Data.Function.Uncurried (runFn4, mkFn6)
import Data.List (List(..), (:))
import Data.Maybe (Maybe(..))
import Math as Math
import Prim as P

import Mathbox.Classes as C
import Mathbox.Field
import Mathbox.Mathbox
import Mathbox.Types

foreign import setThreeProps :: forall eff. Three -> Eff ( mathbox :: MATHBOX | eff) Three

pi :: Number
pi = Math.pi

ex :: Emitter_6_4
ex = mkFn6 ( \emit x y i j time -> do
       let theta = pi / 2.0 * (
                     Math.cos(time * 0.31 + Math.cos(time * 0.481 - Math.sin(time * 0.318)) + Math.sin(time * 1.179)) +
                     Math.cos(time * 0.61 - Math.sin(time * 0.305 - Math.cos(time * 0.573)) + Math.cos(time * 0.962))
                   )
       let phi = time + Math.sin(time * 0.51 - Math.cos(time * 0.527 + Math.sin(time * 0.113)) + Math.sin(time * 1.224))
       let xi1 = phi + y / 2.0
       let xi2 = x
       let eta = theta
       let sum = xi1 + xi2
       let diff = xi1 - xi2
       let s = Math.sin(eta)
       let c = Math.cos(eta)

       let x' = Math.cos(sum)  * s
       let y' = Math.sin(sum)  * s
       let z = Math.cos(diff) * c
       let w = Math.sin(diff) * c
       runFn4 emit x' y' z w
     )

ex2 :: Emitter_6_4
ex2 = mkFn6 ( \emit x y i j time -> do
       let theta = pi / 2.0 * (
                     Math.cos(time * 0.31 + Math.cos(time * 0.481 - Math.sin(time * 0.318)) + Math.sin(time * 1.179)) +
                     Math.cos(time * 0.61 - Math.sin(time * 0.305 - Math.cos(time * 0.573)) + Math.cos(time * 0.962))
                   )
       let phi = time + Math.sin(time * 0.51 - Math.cos(time * 0.527 + Math.sin(time * 0.113)) + Math.sin(time * 1.224))
       let xi1 = phi + y / 2.0
       let xi2 = x
       let eta = theta
       let sum = xi1 + xi2
       let diff = xi1 - xi2
       let s = Math.sin(eta)
       let c = Math.cos(eta)

       let x' = Math.cos(sum)  * s
       let y' = Math.sin(sum)  * s
       let z = Math.cos(diff) * c
       let w = Math.sin(diff) * c

       let s' = 0.577

       runFn4 emit (x' + w * s') (y' + w * s') (z + w * s') 0.0
     )

mathbox :: MathboxPrimitive
mathbox =
  (Transform4 $ C.mkTransform4 {
    matrix = Val $ Mat4
      1.0 0.0 0.0 0.577
      0.0 1.0 0.0 0.577
      0.0 0.0 1.0 0.577
      0.0 0.0 0.0 1.0
    }) (
    (Cartesian4 $ C.mkCartesian4 { range = Val [mkVec2 (-1) 1, mkVec2 (-1) 1, mkVec2 (-1) 1, mkVec2 (-1) 1], scale = Val (mkVec4 1 1 1 1)}) (
      (Axis $ C.mkAxis { axis = Val axis1 }) :
      (Grid $ C.mkGrid { axes = Val $ mkSwizzle1 [1, 3], width = Val 4.0 }) :
      (Axis $ C.mkAxis { axis = Val axis2 }) :
      (Axis $ C.mkAxis { axis = Val axis3 }) :
      (Axis $ C.mkAxis { axis = Val axis4 }) :
      (Area $ C.mkArea { rangeX = Just $ Val [(-pi), pi], rangeY = Just $ Val $ mkVec2 (-1) 1, width = Just $ Val 32, height = Just $ Val 8, expr = Just (Val $ wrapEmitter ex), channels = Val 4 }) :
      (Line $ C.mkLine { color = Val $ unsafeMkColor "#3080FF", width = Val 10.0 }) :
      (Area $ C.mkArea { rangeX = Just $ Val [(-pi), pi], rangeY = Just $ Val $ mkVec2 (-1) 1, width = Just $ Val 96, height = Just $ Val 8, expr = Just (Val $ wrapEmitter ex2), channels = Val 4 }) :
      (Point $ C.mkPoint { color = Val $ unsafeMkColor "#C02050", size = Val 20.0 }) :
      Nil
    ) :
    Nil
  )

main :: forall t. Eff ( mathbox :: MATHBOX | t ) Mathbox
main = do
  mkMathbox { plugins: ["core", "controls", "cursor"]
            , controls: { klass: orbitControls }
            } >>=
  applyOnThree setThreeProps >>=
  add (toJs mathbox)
