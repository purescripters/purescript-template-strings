module Data.TemplateString
  ( (<^>)
  , template
  , (<->)
  , templateS  
  ) where

import Prelude (map, ($), (<<<), show)
import Data.Function.Uncurried (Fn2, runFn2)
import Data.Tuple (Tuple)
import Data.Show (class Show)

-- | This is the safe version. The user is required to give a String representation of the object
template :: String -> Array (Tuple String String) -> String
template = runFn2 _template

infix 7 template as <^>

-- | This version can use any instance of Show
templateS :: forall a. (Show a) => String -> Array (Tuple String a) -> String
templateS s vs = runFn2 _template s $ (map <<< map) show vs

infix 7 templateS as <->

foreign import _template :: Fn2 String (Array (Tuple String String)) String
