module Mathbox.Lenses where

import Prelude hiding (add, bind, map, unit, zero)
import Optic.Core as Optic

active :: forall r t. Optic.Lens' { active :: t | r } t
active =  Optic.lens _.active (_ { active = _ })

alignDepth :: forall r t. Optic.Lens' { alignDepth :: t | r } t
alignDepth =  Optic.lens _.alignDepth (_ { alignDepth = _ })

alignHeight :: forall r t. Optic.Lens' { alignHeight :: t | r } t
alignHeight =  Optic.lens _.alignHeight (_ { alignHeight = _ })

alignItems :: forall r t. Optic.Lens' { alignItems :: t | r } t
alignItems =  Optic.lens _.alignItems (_ { alignItems = _ })

alignWidth :: forall r t. Optic.Lens' { alignWidth :: t | r } t
alignWidth =  Optic.lens _.alignWidth (_ { alignWidth = _ })

alpha :: forall r t. Optic.Lens' { alpha :: t | r } t
alpha =  Optic.lens _.alpha (_ { alpha = _ })

attributes :: forall r t. Optic.Lens' { attributes :: t | r } t
attributes =  Optic.lens _.attributes (_ { attributes = _ })

axes :: forall r t. Optic.Lens' { axes :: t | r } t
axes =  Optic.lens _.axes (_ { axes = _ })

axis :: forall r t. Optic.Lens' { axis :: t | r } t
axis =  Optic.lens _.axis (_ { axis = _ })

background :: forall r t. Optic.Lens' { background :: t | r } t
background =  Optic.lens _.background (_ { background = _ })

base :: forall r t. Optic.Lens' { base :: t | r } t
base =  Optic.lens _.base (_ { base = _ })

bend :: forall r t. Optic.Lens' { bend :: t | r } t
bend =  Optic.lens _.bend (_ { bend = _ })

bind :: forall r t. Optic.Lens' { bind :: t | r } t
bind =  Optic.lens _.bind (_ { bind = _ })

blending :: forall r t. Optic.Lens' { blending :: t | r } t
blending =  Optic.lens _.blending (_ { blending = _ })

bufferDepth :: forall r t. Optic.Lens' { bufferDepth :: t | r } t
bufferDepth =  Optic.lens _.bufferDepth (_ { bufferDepth = _ })

bufferHeight :: forall r t. Optic.Lens' { bufferHeight :: t | r } t
bufferHeight =  Optic.lens _.bufferHeight (_ { bufferHeight = _ })

bufferLength :: forall r t. Optic.Lens' { bufferLength :: t | r } t
bufferLength =  Optic.lens _.bufferLength (_ { bufferLength = _ })

bufferWidth :: forall r t. Optic.Lens' { bufferWidth :: t | r } t
bufferWidth =  Optic.lens _.bufferWidth (_ { bufferWidth = _ })

camera :: forall r t. Optic.Lens' { camera :: t | r } t
camera =  Optic.lens _.camera (_ { camera = _ })

centered :: forall r t. Optic.Lens' { centered :: t | r } t
centered =  Optic.lens _.centered (_ { centered = _ })

channels :: forall r t. Optic.Lens' { channels :: t | r } t
channels =  Optic.lens _.channels (_ { channels = _ })

classes :: forall r t. Optic.Lens' { classes :: t | r } t
classes =  Optic.lens _.classes (_ { classes = _ })

closed :: forall r t. Optic.Lens' { closed :: t | r } t
closed =  Optic.lens _.closed (_ { closed = _ })

closedX :: forall r t. Optic.Lens' { closedX :: t | r } t
closedX =  Optic.lens _.closedX (_ { closedX = _ })

closedY :: forall r t. Optic.Lens' { closedY :: t | r } t
closedY =  Optic.lens _.closedY (_ { closedY = _ })

code :: forall r t. Optic.Lens' { code :: t | r } t
code =  Optic.lens _.code (_ { code = _ })

color :: forall r t. Optic.Lens' { color :: t | r } t
color =  Optic.lens _.color (_ { color = _ })

colors :: forall r t. Optic.Lens' { colors :: t | r } t
colors =  Optic.lens _.colors (_ { colors = _ })

crossed :: forall r t. Optic.Lens' { crossed :: t | r } t
crossed =  Optic.lens _.crossed (_ { crossed = _ })

dataX :: forall r t. Optic.Lens' { data :: t | r } t
dataX =  Optic.lens _.data (_ { data = _ })

delay :: forall r t. Optic.Lens' { delay :: t | r } t
delay =  Optic.lens _.delay (_ { delay = _ })

delayEnter :: forall r t. Optic.Lens' { delayEnter :: t | r } t
delayEnter =  Optic.lens _.delayEnter (_ { delayEnter = _ })

delayExit :: forall r t. Optic.Lens' { delayExit :: t | r } t
delayExit =  Optic.lens _.delayExit (_ { delayExit = _ })

depth :: forall r t. Optic.Lens' { depth :: t | r } t
depth =  Optic.lens _.depth (_ { depth = _ })

detail :: forall r t. Optic.Lens' { detail :: t | r } t
detail =  Optic.lens _.detail (_ { detail = _ })

digits :: forall r t. Optic.Lens' { digits :: t | r } t
digits =  Optic.lens _.digits (_ { digits = _ })

directed :: forall r t. Optic.Lens' { directed :: t | r } t
directed =  Optic.lens _.directed (_ { directed = _ })

divide :: forall r t. Optic.Lens' { divide :: t | r } t
divide =  Optic.lens _.divide (_ { divide = _ })

duration :: forall r t. Optic.Lens' { duration :: t | r } t
duration =  Optic.lens _.duration (_ { duration = _ })

durationEnter :: forall r t. Optic.Lens' { durationEnter :: t | r } t
durationEnter =  Optic.lens _.durationEnter (_ { durationEnter = _ })

durationExit :: forall r t. Optic.Lens' { durationExit :: t | r } t
durationExit =  Optic.lens _.durationExit (_ { durationExit = _ })

early :: forall r t. Optic.Lens' { early :: t | r } t
early =  Optic.lens _.early (_ { early = _ })

ease :: forall r t. Optic.Lens' { ease :: t | r } t
ease =  Optic.lens _.ease (_ { ease = _ })

end :: forall r t. Optic.Lens' { end :: t | r } t
end =  Optic.lens _.end (_ { end = _ })

enter :: forall r t. Optic.Lens' { enter :: t | r } t
enter =  Optic.lens _.enter (_ { enter = _ })

epsilon :: forall r t. Optic.Lens' { epsilon :: t | r } t
epsilon =  Optic.lens _.epsilon (_ { epsilon = _ })

eulerOrder :: forall r t. Optic.Lens' { eulerOrder :: t | r } t
eulerOrder =  Optic.lens _.eulerOrder (_ { eulerOrder = _ })

exit :: forall r t. Optic.Lens' { exit :: t | r } t
exit =  Optic.lens _.exit (_ { exit = _ })

expand :: forall r t. Optic.Lens' { expand :: t | r } t
expand =  Optic.lens _.expand (_ { expand = _ })

expr :: forall r t. Optic.Lens' { expr :: t | r } t
expr =  Optic.lens _.expr (_ { expr = _ })

factor :: forall r t. Optic.Lens' { factor :: t | r } t
factor =  Optic.lens _.factor (_ { factor = _ })

fill :: forall r t. Optic.Lens' { fill :: t | r } t
fill =  Optic.lens _.fill (_ { fill = _ })

fit :: forall r t. Optic.Lens' { fit :: t | r } t
fit =  Optic.lens _.fit (_ { fit = _ })

focus :: forall r t. Optic.Lens' { focus :: t | r } t
focus =  Optic.lens _.focus (_ { focus = _ })

font :: forall r t. Optic.Lens' { font :: t | r } t
font =  Optic.lens _.font (_ { font = _ })

fov :: forall r t. Optic.Lens' { fov :: t | r } t
fov =  Optic.lens _.fov (_ { fov = _ })

fps :: forall r t. Optic.Lens' { fps :: t | r } t
fps =  Optic.lens _.fps (_ { fps = _ })

from :: forall r t. Optic.Lens' { from :: t | r } t
from =  Optic.lens _.from (_ { from = _ })

gamma :: forall r t. Optic.Lens' { gamma :: t | r } t
gamma =  Optic.lens _.gamma (_ { gamma = _ })

height :: forall r t. Optic.Lens' { height :: t | r } t
height =  Optic.lens _.height (_ { height = _ })

helix :: forall r t. Optic.Lens' { helix :: t | r } t
helix =  Optic.lens _.helix (_ { helix = _ })

history :: forall r t. Optic.Lens' { history :: t | r } t
history =  Optic.lens _.history (_ { history = _ })

html :: forall r t. Optic.Lens' { html :: t | r } t
html =  Optic.lens _.html (_ { html = _ })

hurry :: forall r t. Optic.Lens' { hurry :: t | r } t
hurry =  Optic.lens _.hurry (_ { hurry = _ })

id :: forall r t. Optic.Lens' { id :: t | r } t
id =  Optic.lens _.id (_ { id = _ })

index :: forall r t. Optic.Lens' { index :: t | r } t
index =  Optic.lens _.index (_ { index = _ })

indices :: forall r t. Optic.Lens' { indices :: t | r } t
indices =  Optic.lens _.indices (_ { indices = _ })

items :: forall r t. Optic.Lens' { items :: t | r } t
items =  Optic.lens _.items (_ { items = _ })

language :: forall r t. Optic.Lens' { language :: t | r } t
language =  Optic.lens _.language (_ { language = _ })

late :: forall r t. Optic.Lens' { late :: t | r } t
late =  Optic.lens _.late (_ { late = _ })

length :: forall r t. Optic.Lens' { length :: t | r } t
length =  Optic.lens _.length (_ { length = _ })

limit :: forall r t. Optic.Lens' { limit :: t | r } t
limit =  Optic.lens _.limit (_ { limit = _ })

line :: forall r t. Optic.Lens' { line :: t | r } t
line =  Optic.lens _.line (_ { line = _ })

lineBias :: forall r t. Optic.Lens' { lineBias :: t | r } t
lineBias =  Optic.lens _.lineBias (_ { lineBias = _ })

lineX :: forall r t. Optic.Lens' { lineX :: t | r } t
lineX =  Optic.lens _.lineX (_ { lineX = _ })

lineY :: forall r t. Optic.Lens' { lineY :: t | r } t
lineY =  Optic.lens _.lineY (_ { lineY = _ })

live :: forall r t. Optic.Lens' { live :: t | r } t
live =  Optic.lens _.live (_ { live = _ })

lookAt :: forall r t. Optic.Lens' { lookAt :: t | r } t
lookAt =  Optic.lens _.lookAt (_ { lookAt = _ })

loop :: forall r t. Optic.Lens' { loop :: t | r } t
loop =  Optic.lens _.loop (_ { loop = _ })

magFilter :: forall r t. Optic.Lens' { magFilter :: t | r } t
magFilter =  Optic.lens _.magFilter (_ { magFilter = _ })

map :: forall r t. Optic.Lens' { map :: t | r } t
map =  Optic.lens _.map (_ { map = _ })

matrix :: forall r t. Optic.Lens' { matrix :: t | r } t
matrix =  Optic.lens _.matrix (_ { matrix = _ })

minFilter :: forall r t. Optic.Lens' { minFilter :: t | r } t
minFilter =  Optic.lens _.minFilter (_ { minFilter = _ })

mode :: forall r t. Optic.Lens' { mode :: t | r } t
mode =  Optic.lens _.mode (_ { mode = _ })

nice :: forall r t. Optic.Lens' { nice :: t | r } t
nice =  Optic.lens _.nice (_ { nice = _ })

normal :: forall r t. Optic.Lens' { normal :: t | r } t
normal =  Optic.lens _.normal (_ { normal = _ })

now :: forall r t. Optic.Lens' { now :: t | r } t
now =  Optic.lens _.now (_ { now = _ })

observe :: forall r t. Optic.Lens' { observe :: t | r } t
observe =  Optic.lens _.observe (_ { observe = _ })

offset :: forall r t. Optic.Lens' { offset :: t | r } t
offset =  Optic.lens _.offset (_ { offset = _ })

opacity :: forall r t. Optic.Lens' { opacity :: t | r } t
opacity =  Optic.lens _.opacity (_ { opacity = _ })

optical :: forall r t. Optic.Lens' { optical :: t | r } t
optical =  Optic.lens _.optical (_ { optical = _ })

order :: forall r t. Optic.Lens' { order :: t | r } t
order =  Optic.lens _.order (_ { order = _ })

origin :: forall r t. Optic.Lens' { origin :: t | r } t
origin =  Optic.lens _.origin (_ { origin = _ })

outline :: forall r t. Optic.Lens' { outline :: t | r } t
outline =  Optic.lens _.outline (_ { outline = _ })

overlap :: forall r t. Optic.Lens' { overlap :: t | r } t
overlap =  Optic.lens _.overlap (_ { overlap = _ })

pace :: forall r t. Optic.Lens' { pace :: t | r } t
pace =  Optic.lens _.pace (_ { pace = _ })

padding :: forall r t. Optic.Lens' { padding :: t | r } t
padding =  Optic.lens _.padding (_ { padding = _ })

pass :: forall r t. Optic.Lens' { pass :: t | r } t
pass =  Optic.lens _.pass (_ { pass = _ })

playback :: forall r t. Optic.Lens' { playback :: t | r } t
playback =  Optic.lens _.playback (_ { playback = _ })

pointerEvents :: forall r t. Optic.Lens' { pointerEvents :: t | r } t
pointerEvents =  Optic.lens _.pointerEvents (_ { pointerEvents = _ })

points :: forall r t. Optic.Lens' { points :: t | r } t
points =  Optic.lens _.points (_ { points = _ })

position :: forall r t. Optic.Lens' { position :: t | r } t
position =  Optic.lens _.position (_ { position = _ })

proximity :: forall r t. Optic.Lens' { proximity :: t | r } t
proximity =  Optic.lens _.proximity (_ { proximity = _ })

proxy :: forall r t. Optic.Lens' { proxy :: t | r } t
proxy =  Optic.lens _.proxy (_ { proxy = _ })

quaternion :: forall r t. Optic.Lens' { quaternion :: t | r } t
quaternion =  Optic.lens _.quaternion (_ { quaternion = _ })

range :: forall r t. Optic.Lens' { range :: t | r } t
range =  Optic.lens _.range (_ { range = _ })

realtime :: forall r t. Optic.Lens' { realtime :: t | r } t
realtime =  Optic.lens _.realtime (_ { realtime = _ })

rewind :: forall r t. Optic.Lens' { rewind :: t | r } t
rewind =  Optic.lens _.rewind (_ { rewind = _ })

rotation :: forall r t. Optic.Lens' { rotation :: t | r } t
rotation =  Optic.lens _.rotation (_ { rotation = _ })

sample :: forall r t. Optic.Lens' { sample :: t | r } t
sample =  Optic.lens _.sample (_ { sample = _ })

scale :: forall r t. Optic.Lens' { scale :: t | r } t
scale =  Optic.lens _.scale (_ { scale = _ })

script :: forall r t. Optic.Lens' { script :: t | r } t
script =  Optic.lens _.script (_ { script = _ })

sdf :: forall r t. Optic.Lens' { sdf :: t | r } t
sdf =  Optic.lens _.sdf (_ { sdf = _ })

seek :: forall r t. Optic.Lens' { seek :: t | r } t
seek =  Optic.lens _.seek (_ { seek = _ })

shaded :: forall r t. Optic.Lens' { shaded :: t | r } t
shaded =  Optic.lens _.shaded (_ { shaded = _ })

shader :: forall r t. Optic.Lens' { shader :: t | r } t
shader =  Optic.lens _.shader (_ { shader = _ })

shape :: forall r t. Optic.Lens' { shape :: t | r } t
shape =  Optic.lens _.shape (_ { shape = _ })

size :: forall r t. Optic.Lens' { size :: t | r } t
size =  Optic.lens _.size (_ { size = _ })

sizes :: forall r t. Optic.Lens' { sizes :: t | r } t
sizes =  Optic.lens _.sizes (_ { sizes = _ })

skip :: forall r t. Optic.Lens' { skip :: t | r } t
skip =  Optic.lens _.skip (_ { skip = _ })

snap :: forall r t. Optic.Lens' { snap :: t | r } t
snap =  Optic.lens _.snap (_ { snap = _ })

source :: forall r t. Optic.Lens' { source :: t | r } t
source =  Optic.lens _.source (_ { source = _ })

sources :: forall r t. Optic.Lens' { sources :: t | r } t
sources =  Optic.lens _.sources (_ { sources = _ })

speed :: forall r t. Optic.Lens' { speed :: t | r } t
speed =  Optic.lens _.speed (_ { speed = _ })

stagger :: forall r t. Optic.Lens' { stagger :: t | r } t
stagger =  Optic.lens _.stagger (_ { stagger = _ })

start :: forall r t. Optic.Lens' { start :: t | r } t
start =  Optic.lens _.start (_ { start = _ })

steps :: forall r t. Optic.Lens' { steps :: t | r } t
steps =  Optic.lens _.steps (_ { steps = _ })

stops :: forall r t. Optic.Lens' { stops :: t | r } t
stops =  Optic.lens _.stops (_ { stops = _ })

stroke :: forall r t. Optic.Lens' { stroke :: t | r } t
stroke =  Optic.lens _.stroke (_ { stroke = _ })

style :: forall r t. Optic.Lens' { style :: t | r } t
style =  Optic.lens _.style (_ { style = _ })

target :: forall r t. Optic.Lens' { target :: t | r } t
target =  Optic.lens _.target (_ { target = _ })

text :: forall r t. Optic.Lens' { text :: t | r } t
text =  Optic.lens _.text (_ { text = _ })

to :: forall r t. Optic.Lens' { to :: t | r } t
to =  Optic.lens _.to (_ { to = _ })

traits :: forall r t. Optic.Lens' { traits :: t | r } t
traits =  Optic.lens _.traits (_ { traits = _ })

trigger :: forall r t. Optic.Lens' { trigger :: t | r } t
trigger =  Optic.lens _.trigger (_ { trigger = _ })

typeX :: forall r t. Optic.Lens' { type :: t | r } t
typeX =  Optic.lens _.type (_ { type = _ })

uniforms :: forall r t. Optic.Lens' { uniforms :: t | r } t
uniforms =  Optic.lens _.uniforms (_ { uniforms = _ })

unit :: forall r t. Optic.Lens' { unit :: t | r } t
unit =  Optic.lens _.unit (_ { unit = _ })

up :: forall r t. Optic.Lens' { up :: t | r } t
up =  Optic.lens _.up (_ { up = _ })

variant :: forall r t. Optic.Lens' { variant :: t | r } t
variant =  Optic.lens _.variant (_ { variant = _ })

visible :: forall r t. Optic.Lens' { visible :: t | r } t
visible =  Optic.lens _.visible (_ { visible = _ })

weight :: forall r t. Optic.Lens' { weight :: t | r } t
weight =  Optic.lens _.weight (_ { weight = _ })

width :: forall r t. Optic.Lens' { width :: t | r } t
width =  Optic.lens _.width (_ { width = _ })

zBias :: forall r t. Optic.Lens' { zBias :: t | r } t
zBias =  Optic.lens _.zBias (_ { zBias = _ })

zIndex :: forall r t. Optic.Lens' { zIndex :: t | r } t
zIndex =  Optic.lens _.zIndex (_ { zIndex = _ })

zOrder :: forall r t. Optic.Lens' { zOrder :: t | r } t
zOrder =  Optic.lens _.zOrder (_ { zOrder = _ })

zTest :: forall r t. Optic.Lens' { zTest :: t | r } t
zTest =  Optic.lens _.zTest (_ { zTest = _ })

zWrite :: forall r t. Optic.Lens' { zWrite :: t | r } t
zWrite =  Optic.lens _.zWrite (_ { zWrite = _ })

zero :: forall r t. Optic.Lens' { zero :: t | r } t
zero =  Optic.lens _.zero (_ { zero = _ })

zoom :: forall r t. Optic.Lens' { zoom :: t | r } t
zoom =  Optic.lens _.zoom (_ { zoom = _ })
