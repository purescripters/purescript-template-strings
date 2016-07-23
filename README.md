# purescript-template-strings

[![Latest release](http://img.shields.io/bower/v/purescript-template-strings.svg)](https://github.com/purescripters/purescript-template-strings/releases)

Sample usage:

```haskell
> import Data.TemplateString.Unsafe ((<~>))
> "Hello, ${firstName} ${lastName}!" <~> { firstName: "Haskell", lastName: "Curry" }
"Hello, Haskell Curry!"

> "The answer: ${answer}" <~> { answer: 42 }
"The answer: 42"
```

```haskell
> import Data.TemplateString ((<^>))
> import Data.Tuple.Nested ((/\))
> import Data.Show (show)
> "Pi: ${pi}, Phi: ${phi}" <^> ["pi" /\ (show 3.1415), "phi" /\ (show 1.618)]
"Pi: 3.1415, Phi: 1.618"
```
