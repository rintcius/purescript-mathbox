module Mathbox.Class.Draw.Grid where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type GridG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , visible              :: a T.Bool
  , opacity              :: a Number
  , color                :: a T.Color
  , blending             :: a T.Blending
  , zWrite               :: a T.Bool
  , zTest                :: a T.Bool
  , zIndex               :: a T.Round
  , zBias                :: a Number
  , zOrder               :: b Int
  , width                :: a Number
  , depth                :: a Number
  , join                 :: a T.Join
  , stroke               :: a T.Stroke
  , proximity            :: b Number
  , closed               :: a T.Bool
  , lineX                :: a T.Bool
  , lineY                :: a T.Bool
  , crossed              :: a T.Bool
  , closedX              :: a T.Bool
  , closedY              :: a T.Bool
  , axes                 :: a T.Swizzle
  , origin               :: a T.Vec4
  , detailX              :: a Int
  , crossedX             :: a T.Bool
  , detailY              :: a Int
  , crossedY             :: a T.Bool
  , divideX              :: a Number
  , unitX                :: a Number
  , baseX                :: a Number
  , modeX                :: a T.Scale
  , startX               :: a T.Bool
  , endX                 :: a T.Bool
  , zeroX                :: a T.Bool
  , factorX              :: a Number
  , niceX                :: a T.Bool
  , divideY              :: a Number
  , unitY                :: a Number
  , baseY                :: a Number
  , modeY                :: a T.Scale
  , startY               :: a T.Bool
  , endY                 :: a T.Bool
  , zeroY                :: a T.Bool
  , factorY              :: a Number
  , niceY                :: a T.Bool
  , rangeX               :: b T.Vec2
  , rangeY               :: b T.Vec2
  }

type Grid = GridG Field MaybeField

type JsGrid =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , visible              :: Field T.Bool
  , opacity              :: Field Number
  , color                :: Field T.JsColor
  , blending             :: Field T.JsBlending
  , zWrite               :: Field T.Bool
  , zTest                :: Field T.Bool
  , zIndex               :: Field T.JsRound
  , zBias                :: Field Number
  , zOrder               :: Nullable (Field Int)
  , width                :: Field Number
  , depth                :: Field Number
  , join                 :: Field T.JsJoin
  , stroke               :: Field T.JsStroke
  , proximity            :: Nullable (Field Number)
  , closed               :: Field T.Bool
  , lineX                :: Field T.Bool
  , lineY                :: Field T.Bool
  , crossed              :: Field T.Bool
  , closedX              :: Field T.Bool
  , closedY              :: Field T.Bool
  , axes                 :: Field T.JsSwizzle
  , origin               :: Field T.Vec4
  , detailX              :: Field Int
  , crossedX             :: Field T.Bool
  , detailY              :: Field Int
  , crossedY             :: Field T.Bool
  , divideX              :: Field Number
  , unitX                :: Field Number
  , baseX                :: Field Number
  , modeX                :: Field T.JsScale
  , startX               :: Field T.Bool
  , endX                 :: Field T.Bool
  , zeroX                :: Field T.Bool
  , factorX              :: Field Number
  , niceX                :: Field T.Bool
  , divideY              :: Field Number
  , unitY                :: Field Number
  , baseY                :: Field Number
  , modeY                :: Field T.JsScale
  , startY               :: Field T.Bool
  , endY                 :: Field T.Bool
  , zeroY                :: Field T.Bool
  , factorY              :: Field Number
  , niceY                :: Field T.Bool
  , rangeX               :: Nullable (Field T.Vec2)
  , rangeY               :: Nullable (Field T.Vec2)
  }

mkGrid :: Grid
mkGrid =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , visible              : Val $ true
  , opacity              : Val $ 1.0
  , color                : Val $ T.mkColor0
  , blending             : Val $ T.mkBlending0
  , zWrite               : Val $ true
  , zTest                : Val $ true
  , zIndex               : Val $ T.mkRound0
  , zBias                : Val $ 0.0
  , zOrder               : Nothing
  , width                : Val $ 2.0
  , depth                : Val $ 1.0
  , join                 : Val $ T.mkJoin0
  , stroke               : Val $ T.mkStroke0
  , proximity            : Nothing
  , closed               : Val $ false
  , lineX                : Val $ true
  , lineY                : Val $ true
  , crossed              : Val $ false
  , closedX              : Val $ false
  , closedY              : Val $ false
  , axes                 : Val $ T.mkSwizzle [1,2] 2
  , origin               : Val $ T.mkVec40
  , detailX              : Val $ 1
  , crossedX             : Val $ false
  , detailY              : Val $ 1
  , crossedY             : Val $ false
  , divideX              : Val $ 10.0
  , unitX                : Val $ 1.0
  , baseX                : Val $ 10.0
  , modeX                : Val $ T.mkScale0
  , startX               : Val $ true
  , endX                 : Val $ true
  , zeroX                : Val $ true
  , factorX              : Val $ 1.0
  , niceX                : Val $ true
  , divideY              : Val $ 10.0
  , unitY                : Val $ 1.0
  , baseY                : Val $ 10.0
  , modeY                : Val $ T.mkScale0
  , startY               : Val $ true
  , endY                 : Val $ true
  , zeroY                : Val $ true
  , factorY              : Val $ 1.0
  , niceY                : Val $ true
  , rangeX               : Nothing
  , rangeY               : Nothing
  }

gridToJs :: Grid -> JsGrid
gridToJs g =
  { id                   : toNullable g.id
  , classes              : map T.classesToJs g.classes
  , visible              : g.visible
  , opacity              : g.opacity
  , color                : map T.colorToJs g.color
  , blending             : map T.blendingToJs g.blending
  , zWrite               : g.zWrite
  , zTest                : g.zTest
  , zIndex               : map T.roundToJs g.zIndex
  , zBias                : g.zBias
  , zOrder               : toNullable g.zOrder
  , width                : g.width
  , depth                : g.depth
  , join                 : map T.joinToJs g.join
  , stroke               : map T.strokeToJs g.stroke
  , proximity            : toNullable g.proximity
  , closed               : g.closed
  , lineX                : g.lineX
  , lineY                : g.lineY
  , crossed              : g.crossed
  , closedX              : g.closedX
  , closedY              : g.closedY
  , axes                 : map T.swizzleToJs g.axes
  , origin               : g.origin
  , detailX              : g.detailX
  , crossedX             : g.crossedX
  , detailY              : g.detailY
  , crossedY             : g.crossedY
  , divideX              : g.divideX
  , unitX                : g.unitX
  , baseX                : g.baseX
  , modeX                : map T.scaleToJs g.modeX
  , startX               : g.startX
  , endX                 : g.endX
  , zeroX                : g.zeroX
  , factorX              : g.factorX
  , niceX                : g.niceX
  , divideY              : g.divideY
  , unitY                : g.unitY
  , baseY                : g.baseY
  , modeY                : map T.scaleToJs g.modeY
  , startY               : g.startY
  , endY                 : g.endY
  , zeroY                : g.zeroY
  , factorY              : g.factorY
  , niceY                : g.niceY
  , rangeX               : toNullable g.rangeX
  , rangeY               : toNullable g.rangeY
  }
