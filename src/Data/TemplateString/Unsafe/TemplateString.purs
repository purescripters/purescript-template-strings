module Data.TemplateString.Unsafe
  ((<~>)
  , template
  , templateBy
  ) where

import Control.Category (identity)
import Data.Function.Uncurried (Fn3, runFn3)

-- | Unsafe: JavaScript will coerce values to strings.
-- | Supports a key mapping function for transforming keys found in the template.
-- |
-- | Example:
-- | ```purescript
-- | > templateBy String.toUpper "${foo} ${Foo} ${FOO}" { FOO: 42 }
-- | = "42 42 42"
-- | ```
templateBy :: forall a. (String -> String) -> String -> { | a } -> String
templateBy = runFn3 _templateBy

-- | Unsafe: JavaScript will coerce values to strings.
-- | Keys must match exactly.
-- |
-- | Example:
-- | ```purescript
-- | > "${foo} ${Foo} ${FOO} ${Bar}" <~> { Foo: 42, Bar: "!!!" }
-- | = "${foo} 42 ${FOO} !!!"
-- | ```
template :: forall a. String -> { | a } -> String
template = runFn3 _templateBy identity

infix 7 template as <~>

foreign import _templateBy :: forall a. Fn3 (String -> String) String { | a } String
