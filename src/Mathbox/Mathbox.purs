module Mathbox.Mathbox where

import Mathbox.Classes as C
import Control.Monad.Eff (Eff)
import Data.List (List(..), null)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Nullable (Nullable, toNullable)
import Mathbox.Field (Field, constrName)
import Prelude (map, pure, (>>=))
import Unsafe.Coerce (unsafeCoerce)

type Set = { focus :: Maybe Number, scale :: Maybe Number }

mkSet :: Set
mkSet = { focus: Just 1.0, scale: Nothing }

setToNullable :: Set -> { focus :: Nullable Number, scale :: Nullable Number }
setToNullable s = { focus: toNullable s.focus, scale: toNullable s.scale }

isLeaf :: JsMathboxPrimitive -> Boolean
isLeaf d = null (subData d)

set :: Set -> Mathbox -> forall eff. Eff ( mathbox :: MATHBOX | eff) Mathbox
set s m = jsSet_k m (setToNullable s)

add :: JsMathboxPrimitive -> Mathbox -> forall eff. Eff ( mathbox :: MATHBOX | eff) Mathbox
add d m = jsAdd m (getType d) d constrName >>= addAll (subData d)

addAll :: List JsMathboxPrimitive -> Mathbox -> forall eff. Eff ( mathbox :: MATHBOX | eff) Mathbox
addAll Nil m = pure m
addAll (Cons h t) m = (add h m) >>= endD h >>= addAll t

endD :: JsMathboxPrimitive -> forall eff. Mathbox -> Eff ( mathbox :: MATHBOX | eff) Mathbox
endD d m = if (isLeaf d) then pure m else jsEnd m

foreign import data MATHBOX :: !

type MathboxEff  a     = forall eff. Eff (mathbox :: MATHBOX | eff) a
type MathboxEffN eff a = Eff (mathbox :: MATHBOX | eff) a

foreign import data Mathbox :: *
foreign import data Three :: *
foreign import data Controls :: *
foreign import data ThreeColor :: *

foreign import trackballControls :: Controls
foreign import orbitControls :: Controls

foreign import setThreeClearColor :: forall eff. ThreeColor -> Number -> Three -> Eff ( mathbox :: MATHBOX | eff) Three

foreign import mkMathbox :: forall r eff. { | r } -> Eff ( mathbox :: MATHBOX | eff) Mathbox
foreign import applyOnThree :: forall eff1 eff2.
                                  (Three -> Eff ( mathbox :: MATHBOX | eff1) Three)
                               -> Mathbox
                               -> Eff ( mathbox :: MATHBOX | eff2) Mathbox

foreign import jsAdd :: forall a eff. Mathbox -> String -> JsMathboxPrimitive -> (Field a -> String) -> Eff ( mathbox :: MATHBOX | eff) Mathbox
foreign import jsEnd :: forall eff. Mathbox -> Eff ( mathbox :: MATHBOX | eff) Mathbox

foreign import jsSet_k :: Mathbox -> forall r.{ | r } -> forall eff. Eff ( mathbox :: MATHBOX | eff) Mathbox

unsafeMkThreeColor :: String -> ThreeColor
unsafeMkThreeColor = unsafeCoerce

colorWhite :: ThreeColor
colorWhite = unsafeMkThreeColor "white"

data MathboxPrimitive =
  Area C.Area |
  Array_ C.Array_ |
  Axis C.Axis |
  Buffer C.Buffer |
  Camera C.Camera |
  Cartesian C.Cartesian (List MathboxPrimitive) |
  Cartesian4 C.Cartesian4 (List MathboxPrimitive) |
  Clamp C.Clamp |
  Clock C.Clock |
  Compose C.Compose |
  DOM C.DOM |
  Data C.Data |
  Face C.Face |
  Format C.Format |
  Fragment C.Fragment |
  Grid C.Grid |
  Group C.Group (List MathboxPrimitive) |
  Grow C.Grow |
  HTML C.HTML |
  Inherit C.Inherit |
  Interval C.Interval |
  Join C.Join |
  Label C.Label |
  Layer C.Layer |
  Lerp C.Lerp |
  Line C.Line |
  Mask C.Mask |
  Matrix C.Matrix |
  Memo C.Memo |
  Move C.Move |
  Now C.Now |
  Operator C.Operator |
  Parent C.Parent |
  Play C.Play |
  Point C.Point |
  Polar C.Polar |
  Present C.Present |
  RTT C.RTT (List MathboxPrimitive) |
  Readback C.Readback |
  Repeat C.Repeat |
  Resample C.Resample |
  Resolve C.Resolve |
  Retext C.Retext |
  Reveal C.Reveal |
  Root C.Root |
  Scale C.Scale |
  Shader C.Shader |
  Slice C.Slice |
  Slide C.Slide |
  Source C.Source |
  Spherical C.Spherical |
  Split C.Split |
  Spread C.Spread |
  Step C.Step |
  Stereographic C.Stereographic |
  Stereographic4 C.Stereographic4 |
  Strip C.Strip |
  Subdivide C.Subdivide |
  Surface C.Surface |
  Swizzle C.Swizzle |
  Text C.Text |
  Ticks C.Ticks |
  Track C.Track |
  Transform C.Transform (List MathboxPrimitive) |
  Transform3 C.Transform3 (List MathboxPrimitive) |
  Transform4 C.Transform4 (List MathboxPrimitive) |
  Transition C.Transition |
  Transpose C.Transpose |
  Unit C.Unit (List MathboxPrimitive) |
  Vector C.Vector |
  Vertex C.Vertex |
  View C.View |
  Volume C.Volume |
  Voxel C.Voxel

data JsMathboxPrimitive =
  JsArea C.JsArea |
  JsArray_ C.JsArray_ |
  JsAxis C.JsAxis |
  JsBuffer C.JsBuffer |
  JsCamera C.JsCamera |
  JsCartesian C.JsCartesian (List JsMathboxPrimitive) |
  JsCartesian4 C.JsCartesian4 (List JsMathboxPrimitive) |
  JsClamp C.JsClamp |
  JsClock C.JsClock |
  JsCompose C.JsCompose |
  JsDOM C.JsDOM |
  JsData C.JsData |
  JsFace C.JsFace |
  JsFormat C.JsFormat |
  JsFragment C.JsFragment |
  JsGrid C.JsGrid |
  JsGroup C.JsGroup (List JsMathboxPrimitive) |
  JsGrow C.JsGrow |
  JsHTML C.JsHTML |
  JsInherit C.JsInherit |
  JsInterval C.JsInterval |
  JsJoin C.JsJoin |
  JsLabel C.JsLabel |
  JsLayer C.JsLayer |
  JsLerp C.JsLerp |
  JsLine C.JsLine |
  JsMask C.JsMask |
  JsMatrix C.JsMatrix |
  JsMemo C.JsMemo |
  JsMove C.JsMove |
  JsNow C.JsNow |
  JsOperator C.JsOperator |
  JsParent C.JsParent |
  JsPlay C.JsPlay |
  JsPoint C.JsPoint |
  JsPolar C.JsPolar |
  JsPresent C.JsPresent |
  JsRTT C.JsRTT (List JsMathboxPrimitive) |
  JsReadback C.JsReadback |
  JsRepeat C.JsRepeat |
  JsResample C.JsResample |
  JsResolve C.JsResolve |
  JsRetext C.JsRetext |
  JsReveal C.JsReveal |
  JsRoot C.JsRoot |
  JsScale C.JsScale |
  JsShader C.JsShader |
  JsSlice C.JsSlice |
  JsSlide C.JsSlide |
  JsSource C.JsSource |
  JsSpherical C.JsSpherical |
  JsSplit C.JsSplit |
  JsSpread C.JsSpread |
  JsStep C.JsStep |
  JsStereographic C.JsStereographic |
  JsStereographic4 C.JsStereographic4 |
  JsStrip C.JsStrip |
  JsSubdivide C.JsSubdivide |
  JsSurface C.JsSurface |
  JsSwizzle C.JsSwizzle |
  JsText C.JsText |
  JsTicks C.JsTicks |
  JsTrack C.JsTrack |
  JsTransform C.JsTransform (List JsMathboxPrimitive) |
  JsTransform3 C.JsTransform3 (List JsMathboxPrimitive) |
  JsTransform4 C.JsTransform4 (List JsMathboxPrimitive) |
  JsTransition C.JsTransition |
  JsTranspose C.JsTranspose |
  JsUnit C.JsUnit (List JsMathboxPrimitive) |
  JsVector C.JsVector |
  JsVertex C.JsVertex |
  JsView C.JsView |
  JsVolume C.JsVolume |
  JsVoxel C.JsVoxel

getType :: JsMathboxPrimitive -> String
getType (JsArea _) = "area"
getType (JsArray_ _) = "array"
getType (JsAxis _) = "axis"
getType (JsBuffer _) = "buffer"
getType (JsCamera _) = "camera"
getType (JsCartesian _ _) = "cartesian"
getType (JsCartesian4 _ _) = "cartesian4"
getType (JsClamp _) = "clamp"
getType (JsClock _) = "clock"
getType (JsCompose _) = "compose"
getType (JsDOM _) = "dom"
getType (JsData _) = "data"
getType (JsFace _) = "face"
getType (JsFormat _) = "format"
getType (JsFragment _) = "fragment"
getType (JsGrid _) = "grid"
getType (JsGroup _ _) = "group"
getType (JsGrow _) = "grow"
getType (JsHTML _) = "html"
getType (JsInherit _) = "inherit"
getType (JsInterval _) = "interval"
getType (JsJoin _) = "join"
getType (JsLabel _) = "label"
getType (JsLayer _) = "layer"
getType (JsLerp _) = "lerp"
getType (JsLine _) = "line"
getType (JsMask _) = "mask"
getType (JsMatrix _) = "matrix"
getType (JsMemo _) = "memo"
getType (JsMove _) = "move"
getType (JsNow _) = "now"
getType (JsOperator _) = "operator"
getType (JsParent _) = "parent"
getType (JsPlay _) = "play"
getType (JsPoint _) = "point"
getType (JsPolar _) = "polar"
getType (JsPresent _) = "present"
getType (JsRTT _ _) = "rtt"
getType (JsReadback _) = "readback"
getType (JsRepeat _) = "repeat"
getType (JsResample _) = "resample"
getType (JsResolve _) = "resolve"
getType (JsRetext _) = "retext"
getType (JsReveal _) = "reveal"
getType (JsRoot _) = "root"
getType (JsScale _) = "scale"
getType (JsShader _) = "shader"
getType (JsSlice _) = "slice"
getType (JsSlide _) = "slide"
getType (JsSource _) = "source"
getType (JsSpherical _) = "spherical"
getType (JsSplit _) = "split"
getType (JsSpread _) = "spread"
getType (JsStep _) = "step"
getType (JsStereographic _) = "stereographic"
getType (JsStereographic4 _) = "stereographic4"
getType (JsStrip _) = "strip"
getType (JsSubdivide _) = "subdivide"
getType (JsSurface _) = "surface"
getType (JsSwizzle _) = "swizzle"
getType (JsText _) = "text"
getType (JsTicks _) = "ticks"
getType (JsTrack _) = "track"
getType (JsTransform _ _) = "transform"
getType (JsTransform3 _ _) = "transform"
getType (JsTransform4 _ _) = "transform4"
getType (JsTransition _) = "transition"
getType (JsTranspose _) = "transpose"
getType (JsUnit _ _) = "unit"
getType (JsVector _) = "vector"
getType (JsVertex _) = "vertex"
getType (JsView _) = "view"
getType (JsVolume _) = "volume"
getType (JsVoxel _) = "voxel"

subData :: JsMathboxPrimitive -> List JsMathboxPrimitive
subData (JsCartesian _ l) = l
subData (JsCartesian4 _ l) = l
subData (JsGroup _ l) = l
subData (JsRTT _ l) = l
subData (JsTransform _ l) = l
subData (JsTransform3 _ l) = l
subData (JsTransform4 _ l) = l
subData (JsUnit _ l) = l
subData _ = Nil

toJs :: MathboxPrimitive -> JsMathboxPrimitive
toJs (Area a) = JsArea (C.areaToJs a)
toJs (Array_ a) = JsArray_ (C.array_ToJs a)
toJs (Axis a) = JsAxis (C.axisToJs a)
toJs (Buffer b) = JsBuffer (C.bufferToJs b)
toJs (Camera c) = JsCamera (C.cameraToJs c)
toJs (Cartesian c l) = JsCartesian (C.cartesianToJs c) (map toJs l)
toJs (Cartesian4 c l) = JsCartesian4 (C.cartesian4ToJs c) (map toJs l)
toJs (Clamp c) = JsClamp (C.clampToJs c)
toJs (Clock c) = JsClock (C.clockToJs c)
toJs (Compose c) = JsCompose (C.composeToJs c)
toJs (DOM d) = JsDOM (C.dOMToJs d)
toJs (Data d) = JsData (C.dataToJs d)
toJs (Face f) = JsFace (C.faceToJs f)
toJs (Format f) = JsFormat (C.formatToJs f)
toJs (Fragment f) = JsFragment (C.fragmentToJs f)
toJs (Grid g) = JsGrid (C.gridToJs g)
toJs (Group g l) = JsGroup (C.groupToJs g) (map toJs l)
toJs (Grow g) = JsGrow (C.growToJs g)
toJs (HTML h) = JsHTML (C.hTMLToJs h)
toJs (Inherit i) = JsInherit (C.inheritToJs i)
toJs (Interval i) = JsInterval (C.intervalToJs i)
toJs (Join j) = JsJoin (C.joinToJs j)
toJs (Label l) = JsLabel (C.labelToJs l)
toJs (Layer l) = JsLayer (C.layerToJs l)
toJs (Lerp l) = JsLerp (C.lerpToJs l)
toJs (Line l) = JsLine (C.lineToJs l)
toJs (Mask m) = JsMask (C.maskToJs m)
toJs (Matrix m) = JsMatrix (C.matrixToJs m)
toJs (Memo m) = JsMemo (C.memoToJs m)
toJs (Move m) = JsMove (C.moveToJs m)
toJs (Now n) = JsNow (C.nowToJs n)
toJs (Operator o) = JsOperator (C.operatorToJs o)
toJs (Parent p) = JsParent (C.parentToJs p)
toJs (Play p) = JsPlay (C.playToJs p)
toJs (Point p) = JsPoint (C.pointToJs p)
toJs (Polar p) = JsPolar (C.polarToJs p)
toJs (Present p) = JsPresent (C.presentToJs p)
toJs (RTT r l) = JsRTT (C.rTTToJs r) (map toJs l)
toJs (Readback r) = JsReadback (C.readbackToJs r)
toJs (Repeat r) = JsRepeat (C.repeatToJs r)
toJs (Resample r) = JsResample (C.resampleToJs r)
toJs (Resolve r) = JsResolve (C.resolveToJs r)
toJs (Retext r) = JsRetext (C.retextToJs r)
toJs (Reveal r) = JsReveal (C.revealToJs r)
toJs (Root r) = JsRoot (C.rootToJs r)
toJs (Scale s) = JsScale (C.scaleToJs s)
toJs (Shader s) = JsShader (C.shaderToJs s)
toJs (Slice s) = JsSlice (C.sliceToJs s)
toJs (Slide s) = JsSlide (C.slideToJs s)
toJs (Source s) = JsSource (C.sourceToJs s)
toJs (Spherical s) = JsSpherical (C.sphericalToJs s)
toJs (Split s) = JsSplit (C.splitToJs s)
toJs (Spread s) = JsSpread (C.spreadToJs s)
toJs (Step s) = JsStep (C.stepToJs s)
toJs (Stereographic s) = JsStereographic (C.stereographicToJs s)
toJs (Stereographic4 s) = JsStereographic4 (C.stereographic4ToJs s)
toJs (Strip s) = JsStrip (C.stripToJs s)
toJs (Subdivide s) = JsSubdivide (C.subdivideToJs s)
toJs (Surface s) = JsSurface (C.surfaceToJs s)
toJs (Swizzle s) = JsSwizzle (C.swizzleToJs s)
toJs (Text t) = JsText (C.textToJs t)
toJs (Ticks t) = JsTicks (C.ticksToJs t)
toJs (Track t) = JsTrack (C.trackToJs t)
toJs (Transform t l) = JsTransform (C.transformToJs t) (map toJs l)
toJs (Transform3 t l) = JsTransform3 (C.transform3ToJs t) (map toJs l)
toJs (Transform4 t l) = JsTransform4 (C.transform4ToJs t) (map toJs l)
toJs (Transition t) = JsTransition (C.transitionToJs t)
toJs (Transpose t) = JsTranspose (C.transposeToJs t)
toJs (Unit u l) = JsUnit (C.unitToJs u) (map toJs l)
toJs (Vector v) = JsVector (C.vectorToJs v)
toJs (Vertex v) = JsVertex (C.vertexToJs v)
toJs (View v) = JsView (C.viewToJs v)
toJs (Volume v) = JsVolume (C.volumeToJs v)
toJs (Voxel v) = JsVoxel (C.voxelToJs v)
