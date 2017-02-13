module Mathbox.Class.Shader.Shader where

import Prelude (map, ($))
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (Nullable, toNullable)

import Mathbox.Field
import Mathbox.Types as T

type ShaderG a b =
  { id                   :: b String
  , classes              :: a T.Classes
  , sources              :: b T.Select
  , language             :: a String
  , code                 :: a String
  , uniforms             :: b T.Object
  }

type Shader = ShaderG Field MaybeField

type JsShader =
  { id                   :: Nullable (Field String)
  , classes              :: Field T.JsClasses
  , sources              :: Nullable (Field T.JsSelect)
  , language             :: Field String
  , code                 :: Field String
  , uniforms             :: Nullable (Field T.Object)
  }

mkShader :: Shader
mkShader =
  { id                   : Nothing
  , classes              : Val $ T.mkClasses0
  , sources              : Nothing
  , language             : Val $ T.mkString T.glsl
  , code                 : Val $ T.mkString0
  , uniforms             : Nothing
  }

shaderToJs :: Shader -> JsShader
shaderToJs s =
  { id                   : toNullable s.id
  , classes              : map T.classesToJs s.classes
  , sources              : maybeToNullable T.selectToJs s.sources
  , language             : s.language
  , code                 : s.code
  , uniforms             : toNullable s.uniforms
  }
