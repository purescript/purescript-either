# Module Documentation

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

#### `left`

``` purescript
left :: forall a b. Either a b -> Maybe a
```

Returns `Just a` if the value is `Left a` and `Nothing` otherwise.

#### `right`

``` purescript
right :: forall a b. Either a b -> Maybe b
```

Returns `Just b` if the value is `Right b` and `Nothing` otherwise.

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

#### `functorEither`

``` purescript
instance functorEither :: Functor (Either a)
```

The `Functor` instance allows functions to transform the contents of a
`Right` with the `<$>` operator:

``` purescript
f <$> Right x == Right (f x)
```

`Left` values are untouched:

``` purescript
f <$> Left y == Left y
```

#### `applyEither`

``` purescript
instance applyEither :: Apply (Either e)
```

The `Apply` instance allows functions contained within a `Right` to
transform a value contained within a `Right` using the `(<*>)` operator:

``` purescript
Right f <*> Right x == Right (f x)
```

`Left` values are left untouched:

``` purescript
Left f <*> Right x == Left x
Right f <*> Left y == Left y
```

Combining `Functor`'s `<$>` with `Apply`'s `<*>` can be used transform a
pure function to take `Either`-typed arguments so `f :: a -> b -> c`
becomes `f :: Either l a -> Either l b -> Either l c`:

``` purescript
f <$> Right x <*> Right y == Right (f x y)
```

The `Left`-preserving behaviour of both operators means the result of
an expression like the above but where any one of the values is `Left`
means the whole result becomes `Left` also, taking the first `Left` value
found:

``` purescript
f <$> Left x <*> Right y == Left x
f <$> Right x <*> Left y == Left y
f <$> Left x <*> Left y == Left x
```

#### `applicativeEither`

``` purescript
instance applicativeEither :: Applicative (Either e)
```

The `Applicative` instance enables lifting of values into `Either` with the
`pure` or `return` function (`return` is an alias for `pure`):

``` purescript
pure x :: Either _ _ == Right x
return x :: Either _ _ == Right x
```

Combining `Functor`'s `<$>` with `Apply`'s `<*>` and `Applicative`'s
`pure` can be used to pass a mixture of `Either` and non-`Either` typed
values to a function that does not usually expect them, by using `pure`
for any value that is not already `Either` typed:

``` purescript
f <$> Right x <*> pure y == Right (f x y)
```

Even though `pure = Right` it is recommended to use `pure` in situations
like this as it allows the choice of `Applicative` to be changed later
without having to go through and replace `Right` with a new constructor.

#### `altEither`

``` purescript
instance altEither :: Alt (Either e)
```

The `Alt` instance allows for a choice to be made between two `Either`
values with the `<|>` operator, where the first `Right` encountered
is taken.

``` purescript
Right x <|> Right y == Right x
Left x <|> Right y == Right y
Left x <|> Left y == Left y
```

#### `bindEither`

``` purescript
instance bindEither :: Bind (Either e)
```

The `Bind` instance allows sequencing of `Either` values and functions that
return an `Either` by using the `>>=` operator:

``` purescript
Left x >>= f = Left x
Right x >>= f = f x
```

#### `monadEither`

``` purescript
instance monadEither :: Monad (Either e)
```

The `Monad` instance guarantees that there are both `Applicative` and
`Bind` instances for `Either`. This also enables the `do` syntactic sugar:

``` purescript
do
  x' <- x
  y' <- y
  pure (f x' y')
```

Which is equivalent to:

``` purescript
x >>= (\x' -> y >>= (\y' -> pure (f x' y')))
```

#### `extendEither`

``` purescript
instance extendEither :: Extend (Either e)
```

The `Extend` instance allows sequencing of `Either` values and functions
that accept an `Either` and return a non-`Either` result using the
`<<=` operator.

``` purescript
f <<= Left x = Left x
f <<= Right x = Right (f x)
```

#### `showEither`

``` purescript
instance showEither :: (Show a, Show b) => Show (Either a b)
```

The `Show` instance allows `Either` values to be rendered as a string with
`show` whenever there is an `Show` instance for both type the `Either` can
contain.

#### `eqEither`

``` purescript
instance eqEither :: (Eq a, Eq b) => Eq (Either a b)
```

The `Eq` instance allows `Either` values to be checked for equality with
`==` and inequality with `/=` whenever there is an `Eq` instance for both
types the `Either` can contain.

#### `ordEither`

``` purescript
instance ordEither :: (Ord a, Ord b) => Ord (Either a b)
```

The `Ord` instance allows `Either` values to be compared with
`compare`, `>`, `>=`, `<` and `<=` whenever there is an `Ord` instance for
both types the `Either` can contain.

Any `Left` value is considered to be less than a `Right` value.


## Module Data.Either.Nested

#### `choice2`

``` purescript
choice2 :: forall a b z. (a -> z) -> (b -> z) -> Either a b -> z
```


#### `choice3`

``` purescript
choice3 :: forall a b c z. (a -> z) -> (b -> z) -> (c -> z) -> Either a (Either b c) -> z
```


#### `choice4`

``` purescript
choice4 :: forall a b c d z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> Either a (Either b (Either c d)) -> z
```


#### `choice5`

``` purescript
choice5 :: forall a b c d e z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> Either a (Either b (Either c (Either d e))) -> z
```


#### `choice6`

``` purescript
choice6 :: forall a b c d e f z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> Either a (Either b (Either c (Either d (Either e f)))) -> z
```


#### `choice7`

``` purescript
choice7 :: forall a b c d e f g z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> Either a (Either b (Either c (Either d (Either e (Either f g))))) -> z
```


#### `choice8`

``` purescript
choice8 :: forall a b c d e f g h z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> (h -> z) -> Either a (Either b (Either c (Either d (Either e (Either f (Either g h)))))) -> z
```


#### `choice9`

``` purescript
choice9 :: forall a b c d e f g h i z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> (h -> z) -> (i -> z) -> Either a (Either b (Either c (Either d (Either e (Either f (Either g (Either h i))))))) -> z
```


#### `choice10`

``` purescript
choice10 :: forall a b c d e f g h i j z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> (h -> z) -> (i -> z) -> (j -> z) -> Either a (Either b (Either c (Either d (Either e (Either f (Either g (Either h (Either i j)))))))) -> z
```



## Module Data.Either.Unsafe

#### `fromLeft`

``` purescript
fromLeft :: forall a b. Either a b -> a
```

A partial function that extracts the value from the `Left` data constructor.
Passing a `Right` to `fromLeft` will throw an error at runtime.

#### `fromRight`

``` purescript
fromRight :: forall a b. Either a b -> b
```

A partial function that extracts the value from the `Right` data constructor.
Passing a `Left` to `fromRight` will throw an error at runtime.