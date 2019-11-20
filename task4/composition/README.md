## Function Composition in Haskell
Done via the `.` operator.
`(f . g) x` is equivalent to the mathematical expression of `(f (g(x)))`.
It applies the two functions as parameters and is used to resolve them later on.
So we perform first a function and then an operation on the result of it.
e.g.
`(length . filter) (\x -> if x /= 2 then true else false) [1,2,3,4]`

### Folgende Ausdrücke

let f = undefined :: b -> c1 -> c

Evaluated:
(f .) :: (a -> b) -> a -> c1 -> c

As we can see the function is only partially applied and requires the application of a singular function (with the signature (a -> b)) and an input of the value a (for the first function).
 
As for the second term:
let g = undefined :: a -> a1 -> b

Evaluated:
(. g) :: ((a1 -> b) -> c) -> a -> c

Again the composition is only partially applied and needs the second function aswell as the input parameter.
