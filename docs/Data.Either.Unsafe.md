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


