module Test.Main where

import Prelude (Unit)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Aff.AVar (AVAR)

import Test.Unit.Console (TESTOUTPUT)

import Test.Data.TemplateString as TemplateString


main :: Eff ( console :: CONSOLE, testOutput :: TESTOUTPUT, avar :: AVAR ) Unit
main = TemplateString.main

