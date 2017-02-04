module Mathbox.Types where

import Global as Global
import Data.Foreign (Foreign, toForeign)
import Data.Function.Uncurried
import Data.Int (toNumber)
import Data.Maybe (Maybe(..))
import Data.Nullable (Nullable, toNullable)
import Data.Tuple (Tuple)
import Data.Tuple.Nested (Tuple3, Tuple4, Tuple5, Tuple6)
import Prelude (class Show, show)

type N = Number

type It1 = N
type It2 = Tuple N N
type It3 = Tuple3 N N N
type It4 = Tuple4 N N N N
type It5 = Tuple5 N N N N N
type It6 = Tuple6 N N N N N N

type Ch1 = N -> N
type Ch2 = Fn2 N N N
type Ch3 = Fn3 N N N N
type Ch4 = Fn4 N N N N N
type Ch5 = Fn5 N N N N N N
type Ch6 = Fn6 N N N N N N N

type In1 c i = c -> i
type In2 c i = Fn2 c N i
type In3 c i = Fn3 c N N i
type In4 c i = Fn4 c N N N i
type In5 c i = Fn5 c N N N N i
type In6 c i = Fn6 c N N N N N i
type In7 c i = Fn7 c N N N N N N i
type In8 c i = Fn8 c N N N N N N N i
type In9 c i = Fn9 c N N N N N N N N i

type Emitter = Foreign
type Func = String

type Bool = Boolean

type Positive t = t
positive :: forall a. a -> Positive a
positive n = n

infinity :: Number
infinity = Global.infinity

mkString :: String -> String
mkString s = s
mkString0 :: String
mkString0 = ""

glsl :: String
glsl = "glsl"

camera :: String
camera = "camera"

type Object = String
mkObject :: String -> String
mkObject s = s
mkObject0 :: String
mkObject0 = "{}"

data Font = Font (Array String)
mkFont :: String -> Font
mkFont s = Font [s]
sansSerif :: String
sansSerif = "sans-serif"

fontToJs :: Font -> JsFont
fontToJs (Font a) = jsMkFont a

foreign import data JsFont :: *
foreign import jsMkFont :: Array String -> JsFont

data Timestamp = Timestamp String --should be: Date

timestampToJs :: Timestamp -> JsTimestamp
timestampToJs t = jsMkTimestamp

foreign import data JsTimestamp :: *
foreign import jsMkTimestamp :: JsTimestamp

data Classes = Classes (Array String)
mkClasses :: Array String -> Classes
mkClasses ss = Classes ss
mkClasses0 :: Classes
mkClasses0 = Classes []

classesToJs :: Classes -> JsClasses
classesToJs (Classes xs) = jsMkClasses xs

foreign import data JsClasses :: *
foreign import jsMkClasses :: Array String -> JsClasses

data Swizzle = Swizzle (Maybe (Array Int)) (Maybe Int)

mkSwizzle :: Array Int -> Int -> Swizzle
mkSwizzle is i = Swizzle (Just is) (Just i)
mkSwizzle0 :: Swizzle
mkSwizzle0 = Swizzle Nothing Nothing
mkSwizzle1 :: (Array Int) -> Swizzle
mkSwizzle1 ls = Swizzle (Just ls) Nothing

swizzleToJs :: Swizzle -> JsSwizzle
swizzleToJs (Swizzle order size) = jsMkSwizzle (toNullable order) (toNullable size)

foreign import data JsSwizzle :: *
foreign import jsMkSwizzle :: (Nullable (Array Int)) -> (Nullable Int) -> JsSwizzle

-- TODO should this be "Select String" instead?
data Select = Select (Array String)

mkSelect :: Array String -> Select
mkSelect a = Select a
mkSelect0 :: Select
mkSelect0 = mkSelect []

selectToJs :: Select -> JsSelect
selectToJs (Select ss) = jsMkSelect ss

foreign import data JsSelect :: *
foreign import jsMkSelect :: Array String -> JsSelect

data Color = RgbColor Number Number Number | StringColor String

mkColor0 :: Color
mkColor0 = RgbColor 0.5 0.5 0.5
mkColor :: Int -> Int -> Int -> Color
mkColor r g b = RgbColor (toNumber r) (toNumber g) (toNumber b)
unsafeMkColor :: String -> Color
unsafeMkColor s = StringColor s

colorToJs :: Color -> JsColor
colorToJs (RgbColor r g b) = jsMkRgbColor r g b
colorToJs (StringColor s) = jsMkStringColor s

foreign import data JsColor :: *
foreign import jsMkRgbColor :: Number -> Number -> Number -> JsColor
foreign import jsMkStringColor :: String -> JsColor

data Transpose = Transpose (Maybe (Array Int))

mkTranspose0 :: Transpose
mkTranspose0 = Transpose Nothing
mkTranspose :: Array Int -> Transpose
mkTranspose a = Transpose (Just a)

wxyz :: Array Int
wxyz = [4, 1, 2, 3]

transposeToJs :: Transpose -> JsTranspose
transposeToJs c = jsMkTranspose

foreign import data JsTranspose :: *
foreign import jsMkTranspose :: JsTranspose

data Round = Round (Maybe Int)

mkRound0 :: Round
mkRound0 = Round Nothing
mkRound :: Int -> Round
mkRound n = Round (Just n)

roundToJs :: Round -> JsRound
roundToJs c = jsMkRound

foreign import data JsRound :: *
foreign import jsMkRound :: JsRound

-- (still?) TODO https://gist.github.com/puffnfresh/c98358d6f513c31a0ef4
type Data = Foreign
mkData0 :: Foreign
mkData0 = toForeign ""

type Quat = Vec4
type JsQuat = Quat
mkQuat0 :: Quat
mkQuat0 = mkQuat 0 0 0 1
mkQuat :: Int -> Int -> Int -> Int -> Quat
mkQuat x y z w = mkVec4 x y z w

data Mat4 = Mat4 Number Number Number Number Number Number Number Number Number Number Number Number Number Number Number Number

mkMat4 :: Int -> Int -> Int -> Int -> Int -> Int -> Int -> Int -> Int -> Int -> Int -> Int -> Int -> Int -> Int -> Int -> Mat4
mkMat4 n11 n12 n13 n14 n21 n22 n23 n24 n31 n32 n33 n34 n41 n42 n43 n44 = Mat4 (toNumber n11) (toNumber n12) (toNumber n13) (toNumber n14) (toNumber n21) (toNumber n22) (toNumber n23) (toNumber n24) (toNumber n31) (toNumber n32) (toNumber n33) (toNumber n34) (toNumber n41) (toNumber n42) (toNumber n43) (toNumber n44)

mat4ToJs :: Mat4 -> JsMat4
mat4ToJs m = jsMkMat4 m

foreign import data JsMat4 :: *
foreign import jsMkMat4 :: Mat4 -> JsMat4

data Axis = Axis0 | AxisX | AxisY | AxisZ | AxisW

mkAxis0 :: Axis
mkAxis0 = AxisX

axis0 :: Axis
axis0 = Axis0
axis1 :: Axis
axis1 = AxisX
axis2 :: Axis
axis2 = AxisY
axis3 :: Axis
axis3 = AxisZ
axis4 :: Axis
axis4 = AxisW

axisToInt :: Axis -> Int
axisToInt Axis0 = 0
axisToInt AxisX = 1
axisToInt AxisY = 2
axisToInt AxisZ = 3
axisToInt AxisW = 4

axisToJs :: Axis -> JsAxis
axisToJs a = jsMkAxis (axisToInt a) true

foreign import data JsAxis :: *
foreign import jsMkAxis :: Int -> Boolean -> JsAxis

type Vec2 = Array Number
type Vec3 = Array Number
type Vec4 = Array Number
mkVec2 :: Int -> Int -> Vec2
mkVec2 x y = [toNumber x, toNumber y]
mkVec3 :: Int -> Int -> Int -> Vec3
mkVec3 x y z = [toNumber x, toNumber y, toNumber z]
mkVec30 :: Vec3
mkVec30 = mkVec3 0 0 0
mkVec4 :: Int -> Int -> Int -> Int -> Vec4
mkVec4 a b c d = [toNumber a, toNumber b, toNumber c, toNumber d]
mkVec40 :: Vec4
mkVec40 = mkVec4 0 0 0 0

data Enum = Enum Int (Array Int)
mkEnum :: Int -> Array Int -> Enum
mkEnum i is = Enum i is

enumToJs :: Enum -> JsEnum
enumToJs (Enum i is) = jsMkEnum i is

foreign import data JsEnum :: *
foreign import jsMkEnum :: Int -> Array Int -> JsEnum

foreign import data JsEmitter :: *
foreign import data JsFunc :: *

xyz :: Array Int
xyz = [1, 2, 3]
data Blending = BlendingNo | BlendingNormal | BlendingAdd | BlendingSubstract | BlendingMultiply | BlendingCustom

mkBlending0 :: Blending
mkBlending0 = BlendingNormal

instance showBlending :: Show Blending where
  show BlendingNo = "no"
  show BlendingNormal = "normal"
  show BlendingAdd = "add"
  show BlendingSubstract = "substract"
  show BlendingMultiply = "multiply"
  show BlendingCustom = "custom"

blendingToJs :: Blending -> JsBlending
blendingToJs e = jsMkBlending (show e)

foreign import data JsBlending :: *
foreign import jsMkBlending :: String -> JsBlending

data Filter = FilterNearest | FilterLinearMipmapLinear | FilterLinearMipMapNearest | FilterNearestMipMapLinear | FilterLinear | FilterNearestMipMapNearest

mkFilter0 :: Filter
mkFilter0 = FilterNearest

instance showFilter :: Show Filter where
  show FilterNearest = "nearest"
  show FilterLinearMipmapLinear = "linearMipmapLinear"
  show FilterLinearMipMapNearest = "linearMipMapNearest"
  show FilterNearestMipMapLinear = "nearestMipMapLinear"
  show FilterLinear = "linear"
  show FilterNearestMipMapNearest = "nearestMipMapNearest"

filterToJs :: Filter -> JsFilter
filterToJs e = jsMkFilter (show e)

foreign import data JsFilter :: *
foreign import jsMkFilter :: String -> JsFilter

data Type = TypeFloat | TypeShort | TypeUnsignedInt | TypeUnsignedShort | TypeInt | TypeUnsignedByte | TypeByte

mkType0 :: Type
mkType0 = TypeUnsignedByte

instance showType :: Show Type where
  show TypeFloat = "float"
  show TypeShort = "short"
  show TypeUnsignedInt = "unsignedInt"
  show TypeUnsignedShort = "unsignedShort"
  show TypeInt = "int"
  show TypeUnsignedByte = "unsignedByte"
  show TypeByte = "byte"

typeToJs :: Type -> JsType
typeToJs e = jsMkType (show e)

foreign import data JsType :: *
foreign import jsMkType :: String -> JsType

data Scale = ScaleLinear | ScaleLog

mkScale0 :: Scale
mkScale0 = ScaleLinear

instance showScale :: Show Scale where
  show ScaleLinear = "linear"
  show ScaleLog = "log"

scaleToJs :: Scale -> JsScale
scaleToJs e = jsMkScale (show e)

foreign import data JsScale :: *
foreign import jsMkScale :: String -> JsScale

data Mapping = MappingRelative | MappingAbsolute

mkMapping0 :: Mapping
mkMapping0 = MappingRelative

instance showMapping :: Show Mapping where
  show MappingRelative = "relative"
  show MappingAbsolute = "absolute"

mappingToJs :: Mapping -> JsMapping
mappingToJs e = jsMkMapping (show e)

foreign import data JsMapping :: *
foreign import jsMkMapping :: String -> JsMapping

data Indexing = IndexingOriginal | IndexingFinal

mkIndexing0 :: Indexing
mkIndexing0 = IndexingOriginal

instance showIndexing :: Show Indexing where
  show IndexingOriginal = "original"
  show IndexingFinal = "final"

indexingToJs :: Indexing -> JsIndexing
indexingToJs e = jsMkIndexing (show e)

foreign import data JsIndexing :: *
foreign import jsMkIndexing :: String -> JsIndexing

data Join = JoinMiter | JoinRound | JoinBevel

mkJoin0 :: Join
mkJoin0 = JoinMiter

instance showJoin :: Show Join where
  show JoinMiter = "miter"
  show JoinRound = "round"
  show JoinBevel = "bevel"

joinToJs :: Join -> JsJoin
joinToJs e = jsMkJoin (show e)

foreign import data JsJoin :: *
foreign import jsMkJoin :: String -> JsJoin

data Shape = ShapeCircle | ShapeSquare | ShapeDiamond | ShapeUp | ShapeDown | ShapeLeft | ShapeRight

mkShape0 :: Shape
mkShape0 = ShapeCircle

instance showShape :: Show Shape where
  show ShapeCircle = "circle"
  show ShapeSquare = "square"
  show ShapeDiamond = "diamond"
  show ShapeUp = "up"
  show ShapeDown = "down"
  show ShapeLeft = "left"
  show ShapeRight = "right"

shapeToJs :: Shape -> JsShape
shapeToJs e = jsMkShape (show e)

foreign import data JsShape :: *
foreign import jsMkShape :: String -> JsShape

data Stroke = StrokeSolid | StrokeDotted | StrokeDashed

mkStroke0 :: Stroke
mkStroke0 = StrokeSolid

instance showStroke :: Show Stroke where
  show StrokeSolid = "solid"
  show StrokeDotted = "dotted"
  show StrokeDashed = "dashed"

strokeToJs :: Stroke -> JsStroke
strokeToJs e = jsMkStroke (show e)

foreign import data JsStroke :: *
foreign import jsMkStroke :: String -> JsStroke

data VertexPass = VertexPassData | VertexPassView | VertexPassWorld | VertexPassEye

mkVertexPass0 :: VertexPass
mkVertexPass0 = VertexPassView

instance showVertexPass :: Show VertexPass where
  show VertexPassData = "data"
  show VertexPassView = "view"
  show VertexPassWorld = "world"
  show VertexPassEye = "eye"

vertexPassToJs :: VertexPass -> JsVertexPass
vertexPassToJs e = jsMkVertexPass (show e)

foreign import data JsVertexPass :: *
foreign import jsMkVertexPass :: String -> JsVertexPass

data FragmentPass = FragmentPassColor | FragmentPassLight | FragmentPassRgba

mkFragmentPass0 :: FragmentPass
mkFragmentPass0 = FragmentPassLight

instance showFragmentPass :: Show FragmentPass where
  show FragmentPassColor = "color"
  show FragmentPassLight = "light"
  show FragmentPassRgba = "rgba"

fragmentPassToJs :: FragmentPass -> JsFragmentPass
fragmentPassToJs e = jsMkFragmentPass (show e)

foreign import data JsFragmentPass :: *
foreign import jsMkFragmentPass :: String -> JsFragmentPass

data Ease = EaseLinear | EaseCosine

mkEase0 :: Ease
mkEase0 = EaseLinear

instance showEase :: Show Ease where
  show EaseLinear = "linear"
  show EaseCosine = "cosine"

easeToJs :: Ease -> JsEase
easeToJs e = jsMkEase (show e)

foreign import data JsEase :: *
foreign import jsMkEase :: String -> JsEase

data Fit = FitX | FitY | FitContain | FitCover

mkFit0 :: Fit
mkFit0 = FitContain

instance showFit :: Show Fit where
  show FitX = "x"
  show FitY = "y"
  show FitContain = "contain"
  show FitCover = "cover"

fitToJs :: Fit -> JsFit
fitToJs e = jsMkFit (show e)

foreign import data JsFit :: *
foreign import jsMkFit :: String -> JsFit

data Anchor = AnchorFirst | AnchorMiddle | AnchorLast

mkAnchor0 :: Anchor
mkAnchor0 = AnchorMiddle

instance showAnchor :: Show Anchor where
  show AnchorFirst = "first"
  show AnchorMiddle = "middle"
  show AnchorLast = "last"

anchorToJs :: Anchor -> JsAnchor
anchorToJs e = jsMkAnchor (show e)

foreign import data JsAnchor :: *
foreign import jsMkAnchor :: String -> JsAnchor

data TransitionState = TransitionStateEnter | TransitionStateVisible | TransitionStateExit

mkTransitionState0 :: TransitionState
mkTransitionState0 = TransitionStateEnter

instance showTransitionState :: Show TransitionState where
  show TransitionStateEnter = "enter"
  show TransitionStateVisible = "visible"
  show TransitionStateExit = "exit"

transitionStateToJs :: TransitionState -> JsTransitionState
transitionStateToJs e = jsMkTransitionState (show e)

foreign import data JsTransitionState :: *
foreign import jsMkTransitionState :: String -> JsTransitionState
