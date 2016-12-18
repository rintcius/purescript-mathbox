module Mathbox.Examples.Axis where

import Prelude (($), (>>=), map, (*), (+), negate)
import Control.Monad.Eff (Eff)
import Data.List (List(..), (:))
import Data.Maybe (Maybe(..))
import Math as Math

import Prim as P

import Mathbox.Classes as C
import Mathbox.Field
import Mathbox.Mathbox
import Mathbox.Types

foreign import jsColorsToData :: {x :: JsColor, y :: JsColor, z :: JsColor } -> Data
foreign import jsData :: Data
foreign import jsTextData :: Data
foreign import setThreeProps :: forall eff. Three -> Eff ( mathbox :: MATHBOX | eff) Three

colors :: { x :: Color, y :: Color, z :: Color }
colors = { x: unsafeMkColor "#FF4136", y: unsafeMkColor "#2ECC40", z: unsafeMkColor "#0074D9" }

jsColors :: { x :: JsColor, y :: JsColor, z :: JsColor }
jsColors = { x: colorToJs colors.x, y: colorToJs colors.y, z: colorToJs colors.z }

mathbox :: MathboxPrimitive
mathbox =
  (Cartesian $ C.mkCartesian { range = Val [mkVec2 (-2) 2, mkVec2 (-1) 1, mkVec2 (-1) 1], scale = Val (mkVec3 2 1 1) }) (
    (Axis $ C.mkAxis { color = Val colors.x }) :
    (Axis $ C.mkAxis { axis = Val axis2, color = Val colors.y }) :
    (Axis $ C.mkAxis { axis = Val axis3, color = Val colors.z }) :
    (Array_ $ C.mkArray_ { id = Just (Val "colors"), live = Val false, data = Just (Val $ jsColorsToData jsColors)}) :
    (Array_ $ C.mkArray_ { data = Just (Val jsData), channels = Val 3, live = Val false }) :
    (Text $ C.mkText { data = Just (Val jsTextData) }) :
    (Label $ C.mkLabel { color = Val $ unsafeMkColor "#FFFFFF", colors = Just (Val $ mkSelect ["#colors"]) }) :
    Nil
  )

transformAxis :: C.Axis -> C.Axis
transformAxis a = a { end = Val true, width = Val 5.0, depth = Fun $ (\t -> 0.5 + 0.5 * Math.sin(t * 0.5)) }

transform :: MathboxPrimitive -> MathboxPrimitive
transform (Cartesian c l) = Cartesian c (map transform l)
transform (Axis a) = Axis (transformAxis a)
transform x = x

main :: forall t. Eff ( mathbox :: MATHBOX | t ) Mathbox
main = do
  mkMathbox { plugins: ["core", "controls", "cursor"]
            , controls: { klass: orbitControls }
            , camera: { fov: 45 }
            } >>=
  applyOnThree setThreeProps >>=
  set { scale: Just 720.0, focus: Just 1.0 } >>=
  add (toJs $ transform mathbox)
