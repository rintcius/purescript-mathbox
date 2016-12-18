module Mathbox.Examples.Compose where

import Prelude (map, (>>=), ($), negate, (*), (+))
import Control.Monad.Eff (Eff)
import Data.Function.Uncurried (runFn4, mkFn4, runFn3, mkFn3, mkFn5)
import Data.List (List(..), (:))
import Data.Maybe (Maybe(..))
import Math as Math
import Prim as P

import Mathbox.Classes as C
import Mathbox.Field
import Mathbox.Mathbox
import Mathbox.Types

ex :: Emitter_5_4
ex = mkFn5 ( \emit x y i j -> do
       runFn4 emit x y 0.0 1.0
     )

ex2 :: Emitter_3_3
ex2 = mkFn3 ( \emit x i -> do
        runFn3 emit x 0.0 0.0
      )

ex3 :: Emitter_4_4
ex3 = mkFn4 ( \emit x i t -> do
        let y = Math.sin(x + t) * 0.5 + 0.5
        runFn4 emit y y y 1.0
      )

mathbox :: List MathboxPrimitive
mathbox =
  (Camera $ C.mkCamera { proxy = Val true, position = Just $ Val (mkVec3 0 0 3) }) :
  (Cartesian $ C.mkCartesian { range = Val [mkVec2 (-2) 2, mkVec2 (-1) 1, mkVec2 (-1) 1], scale = Val (mkVec3 2 1 1) }) (
    (Grid $ C.mkGrid { color = Val $ unsafeMkColor "black", divideX = Val 2.0, divideY = Val 2.0, zBias = Val 10.0, opacity = Val 0.75 }) :
    (RTT $ C.mkRTT { type = Val TypeUnsignedByte }) (
      (Camera $ C.mkCamera { lookAt = Just $ Val $ mkVec3 0 0 0, position = Just (Fun (\t -> [Math.cos(t) * 3.0, Math.sin(t * 0.271), Math.sin(t) * 3.0])) }) :
      (Cartesian $ C.mkCartesian { range = Val [mkVec2 (-2) 2, mkVec2 (-1) 1, mkVec2 (-1) 1], scale = Val (mkVec3 2 1 1) }) (
        (Grid $ C.mkGrid { color = Val $ unsafeMkColor "black", divideX = Val 2.0, divideY = Val 2.0, zBias = Val 10.0, opacity = Val 0.75 }) :
        Nil
      ) :
      Nil
    ) :
    (Compose $ C.mkCompose { color = Val $ unsafeMkColor "#fff", opacity = Val 0.5, zWrite = Val false }) :
    (Area $ C.mkArea { width = Just $ Val 16, height = Just $ Val 16, rangeX = Just $ Val $ mkVec2 0 1, rangeY = Just $ Val $ mkVec2 0 1, expr = Just (Val $ wrapEmitter ex), minFilter = Val $ FilterLinear, magFilter = Val $ FilterLinear }) :
    (Interval $ C.mkInterval { width = Just $ Val $ 16, range = Just $ Val $ mkVec2 0 1, expr = Just (Val $ wrapEmitter ex2), minFilter = Val $ FilterLinear, magFilter = Val $ FilterLinear }) :
    (Compose $ C.mkCompose { color = Val $ unsafeMkColor "#fff", opacity = Val 0.333, zWrite = Val false }) :
    (Area $ C.mkArea { width = Just $ Val 3, height = Just $ Val 16 }) :
    (Interval $ C.mkInterval { width = Just $ Val $ 8, minFilter = Val $ FilterLinear, magFilter = Val $ FilterLinear, expr = Just (Val $ wrapEmitter ex3) }) :
    (Surface $ C.mkSurface { color = Val $ unsafeMkColor "#ffffff", points = Val $ mkSelect ["<<"], map = Just $ Val $ mkSelect ["<"], zBias = Val (-5.0) }) :
    (Compose $ C.mkCompose { color = Val $ unsafeMkColor "#fff", opacity = Val 0.333, zWrite = Val false }) :
    Nil
  ) :
  Nil

main :: forall t. Eff ( mathbox :: MATHBOX | t ) Mathbox
main = do
  mkMathbox { plugins: ["core", "controls", "cursor"], controls: { klass: orbitControls } } >>=
  applyOnThree (setThreeClearColor colorWhite 1.0) >>=
  set { scale: Just 500.0, focus: Just 3.0 } >>=
  addAll (map toJs mathbox)
