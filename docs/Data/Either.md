## Module Data.Either

#### `Either`

``` purescript
data Either a b
  = Left a
  | Right b
```

The `Either` type is used to represent a choice between two types of value.

A common use case for `Either` is error handling, where `Left` is used to
carry an error value and `Right` is used to carry a success value.

##### Instances
``` purescript
Functor (Either a)
Bifunctor Either
Apply (Either e)
Applicative (Either e)
Alt (Either e)
Bind (Either e)
Monad (Either e)
Extend (Either e)
(Show a, Show b) => Show (Either a b)
(Eq a, Eq b) => Eq (Either a b)
(Ord a, Ord b) => Ord (Either a b)
(Bounded a, Bounded b) => Bounded (Either a b)
Foldable (Either a)
Bifoldable Either
Traversable (Either a)
Bitraversable Either
(Semiring b) => Semiring (Either a b)
(Semigroup b) => Semigroup (Either a b)
```

#### `either`

``` purescript
either :: forall a b c. (a -> c) -> (b -> c) -> Either a b -> c
```

Takes two functions and an `Either` value, if the value is a `Left` the
inner value is applied to the first function, if the value is a `Right`
the inner value is applied to the second function.

``` purescript
either f g (Left x) == f x
either f g (Right y) == g y
```

#### `isLeft`

``` purescript
isLeft :: forall a b. Either a b -> Boolean
```

Returns `true` when the `Either` value was constructed with `Left`.

#### `isRight`

``` purescript
isRight :: forall a b. Either a b -> Boolean
```

Returns `true` when the `Either` value was constructed with `Right`.


