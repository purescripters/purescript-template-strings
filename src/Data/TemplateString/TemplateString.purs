module Data.TemplateString
  ( (<^>)
  , template
  , (<->)
  , templateS
  , getTemplateVars
  ) where

import Prelude (map, (<<<), show, (<>))
import Data.Function.Uncurried (Fn1, runFn1)
import Data.Tuple (Tuple)
import Data.Show (class Show)
import Data.TemplateString.Unsafe (templateBy)

-- | This is the safe version. The user is required to give a String representation of the object
-- |
-- | Example:
-- | ```purescript
-- | > "${foo} ${bar}" <^> ["foo" /\ "the ${bar} was", "bar" /\ "bananas"]
-- | = "the ${bar} was bananas"
-- | ```
template :: String -> Array (Tuple String String) -> String
template tmpl = templateBy ("!" <> _) tmpl <<< _buildExclamationKeyObject

infix 7 template as <^>

-- | This version can use any instance of Show
-- |
-- | Example:
-- | ```purescript
-- | > "${one} and ${two}" <-> ["one" /\ 1, "two" /\ 2]
-- | = "1 and 2"
-- | ```
templateS :: forall a. (Show a) => String -> Array (Tuple String a) -> String
templateS tmpl = template tmpl <<< map (map show)

infix 7 templateS as <->

-- | Get the template variables contained in a string.
-- |
-- | Example:
-- | ```purescript
-- | > getTemplateVars "Foo ${bar} baz ${qux}"
-- | = ["bar", "qux"]
-- | ```
getTemplateVars :: String -> Array String
getTemplateVars = runFn1 _getTemplateVars

foreign import _buildExclamationKeyObject :: forall e. Array (Tuple String String) -> { | e }

foreign import _getTemplateVars :: Fn1 String (Array String)

