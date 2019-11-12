## Function Composition in Haskell
Done via the `.` operator.
`(f . g) x` is equivalent to the mathematical expression of `(f (g(x)))`.
It applies the two functions as parameters and is used to resolve them later on.
So we perform first a function and then an operation on the result of it.
e.g.
`(length . filter) (\x -> if x /= 2 then true else false) [1,2,3,4]`

### Folgende Ausdrücke


