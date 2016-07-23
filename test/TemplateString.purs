module Test.TemplateString where

import Prelude (Unit, bind, (==))
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)

import Test.Unit (test, suite)
import Test.Unit.Main (runTest)
import Test.Unit.Assert (assert)
import Test.Unit.Console (TESTOUTPUT)
import Data.TemplateString.Unsafe ((<~>))
import Data.TemplateString ((<^>)) 

import Data.Tuple.Nested


main :: Eff ( console :: CONSOLE, testOutput :: TESTOUTPUT ) Unit
main = runTest do
  suite "Unsafe" do
    test "template" do
      assert "single" ("Hello, ${name}!" <~> { name: "Mr. Foo" } == "Hello, Mr. Foo!")
      assert "multi" ("Hello, ${fName} ${lName}!" <~> { fName: "Foo", lName: "Bar" } == "Hello, Foo Bar!")

  suite "Safe" do
    test "template" do
      assert "single" ("Hello, ${name}!" <^> ["name" /\ "Mr. Foo"] == "Hello, Mr. Foo!")
      assert "multi" ("Hello, ${fName} ${lName}!" <^> ["fName" /\ "Foo", "lName" /\ "Bar"] == "Hello, Foo Bar!")
