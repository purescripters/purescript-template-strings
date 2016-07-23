module Data.TemplateString.Unsafe
  ((<~>)
  , template
  ) where

import Data.Function.Uncurried (Fn2, runFn2)

-- | This is the unsafe version. Javascript will coerce whatever it's given to a string
template :: forall a. String -> { | a } -> String
template = runFn2 _template

infix 7 template as <~>

foreign import _template :: forall a. Fn2 String { | a } String
