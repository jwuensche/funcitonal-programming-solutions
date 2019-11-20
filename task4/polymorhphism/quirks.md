#  # Polymorphism Quirks

```haskel
"" == []
tail [1] == ""
tail [1] == []
```

In these cases ghci will always evaluate true if one side is the most generic empty list `[]` or both sides specify the same type e.g. `tail [1] == []` will evaluate to `True` because the left side is left to be generic. In comparsion `tail [1] == ""` will evaluate to `False` because the left side specifies `Integer` and the right one `Char` to be the list members.

## Read Typeclass

Read has runtime defined behaviour without an explicit or implicit cast to the correct type it will panic. To fix this we need to specifiy a type for the result e.g.

```haskell
read "10" :: Integer
```

while parsing to the incorrect type also panics

```haskell
read "10" :: String
```
