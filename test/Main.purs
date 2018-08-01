module Test.Main where

import Prelude (Unit)
import Effect (Effect)
import Test.Data.TemplateString as TemplateString


main :: Effect Unit
main = TemplateString.main

