module Data.TemplateString
  ((<^>)
  , template
  ) where

import Data.Function.Uncurried (Fn2, runFn2)
import Data.Tuple (Tuple)

-- | This is the safe version. The user is required to give a String representation of the object
template :: String -> Array (Tuple String String) -> String
template = runFn2 _template

infix 7 template as <^>

foreign import _template :: Fn2 String (Array (Tuple String String)) String
