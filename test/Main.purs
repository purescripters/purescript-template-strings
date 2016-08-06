module Test.Main where

import Prelude (Unit)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)

import Test.Unit.Console (TESTOUTPUT)

import Test.Data.TemplateString as TemplateString


main :: Eff ( console :: CONSOLE, testOutput :: TESTOUTPUT ) Unit
main = TemplateString.main

