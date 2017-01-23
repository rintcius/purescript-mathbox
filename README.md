# purescript-mathbox

[![Latest release](http://img.shields.io/github/release/rintcius/purescript-mathbox.svg)](https://github.com/rintcius/purescript-mathbox/releases)
[![Travis branch](https://img.shields.io/travis/rintcius/purescript-mathbox/master.svg)](https://travis-ci.org/rintcius/purescript-mathbox)

## Description

`purescript-mathbox` contains purescript bindings for [MathBox](https://gitgud.io/unconed/mathbox).

In case you don't know MathBox yet:

> MathBox is a library for rendering presentation-quality math diagrams in a browser using WebGL.
> Built on top of Three.js and ShaderGraph, it provides a clean API to visualize mathematical
> relationships and animate them declaratively.

## Try Mathbox

`purescript-mathbox` is available as a backend of try-purescript,
which means you can play online with it without having to install anything locally:
[try-mathbox](http://try.purescript.org/?backend=mathbox)

![](./doc/resources/try-mathbox.gif)

## Examples

To get started, a couple of examples have been ported from the MathBox repos.
A fairly minimal example is:
https://github.com/rintcius/purescript-mathbox/blob/master/test/Mathbox/Examples/Main.purs

Other examples are in the same directory: https://github.com/rintcius/purescript-mathbox/blob/master/test/Mathbox/Examples

## Build purescript-mathbox

```
# install project dependencies
npm run install

# build project and examples
npm run build-all

open examples/resources/*.html   # in your favorite browser
```
## Contributing

Please feel free to file issues. However, note that I'll probably won't merge any PR's at the moment since the code in this lib is generated code (which is still private).
