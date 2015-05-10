## Module Data.Either.Nested

Utilities for n-eithers: sums types with more than two terms built from nested eithers.

Nested eithers arise naturally in sum combinators. You shouldn't
represent sum data using nested eithers, but if combinators you're working with
create them, utilities in this module will allow to to more easily work
with them, including translating to and from more traditional sum types.

```purescript
data Color = Red Number | Green Number | Blue Number

toEither3 :: Color -> Either3 Number Number Number
toEither3 = either3 Red Green Blue

fromEither3 :: Either3 Number Number Number -> Color
fromEither3 (Red   v) = either1of3
fromEither3 (Green v) = either2of3
fromEither3 (Blue  v) = either3of3
```

#### `Either2`

``` purescript
type Either2 a z = Either a z
```

#### `Either3`

``` purescript
type Either3 a b z = Either (Either2 a b) z
```

#### `Either4`

``` purescript
type Either4 a b c z = Either (Either3 a b c) z
```

#### `Either5`

``` purescript
type Either5 a b c d z = Either (Either4 a b c d) z
```

#### `Either6`

``` purescript
type Either6 a b c d e z = Either (Either5 a b c d e) z
```

#### `Either7`

``` purescript
type Either7 a b c d e f z = Either (Either6 a b c d e f) z
```

#### `Either8`

``` purescript
type Either8 a b c d e f g z = Either (Either7 a b c d e f g) z
```

#### `Either9`

``` purescript
type Either9 a b c d e f g h z = Either (Either8 a b c d e f g h) z
```

#### `Either10`

``` purescript
type Either10 a b c d e f g h i z = Either (Either9 a b c d e f g h i) z
```

#### `either1of2`

``` purescript
either1of2 :: forall a b. a -> Either2 a b
```

#### `either2of2`

``` purescript
either2of2 :: forall a b. b -> Either2 a b
```

#### `either1of3`

``` purescript
either1of3 :: forall a b c. a -> Either3 a b c
```

#### `either2of3`

``` purescript
either2of3 :: forall a b c. b -> Either3 a b c
```

#### `either3of3`

``` purescript
either3of3 :: forall a b c. c -> Either3 a b c
```

#### `either1of4`

``` purescript
either1of4 :: forall a b c d. a -> Either4 a b c d
```

#### `either2of4`

``` purescript
either2of4 :: forall a b c d. b -> Either4 a b c d
```

#### `either3of4`

``` purescript
either3of4 :: forall a b c d. c -> Either4 a b c d
```

#### `either4of4`

``` purescript
either4of4 :: forall a b c d. d -> Either4 a b c d
```

#### `either1of5`

``` purescript
either1of5 :: forall a b c d e. a -> Either5 a b c d e
```

#### `either2of5`

``` purescript
either2of5 :: forall a b c d e. b -> Either5 a b c d e
```

#### `either3of5`

``` purescript
either3of5 :: forall a b c d e. c -> Either5 a b c d e
```

#### `either4of5`

``` purescript
either4of5 :: forall a b c d e. d -> Either5 a b c d e
```

#### `either5of5`

``` purescript
either5of5 :: forall a b c d e. e -> Either5 a b c d e
```

#### `either1of6`

``` purescript
either1of6 :: forall a b c d e f. a -> Either6 a b c d e f
```

#### `either2of6`

``` purescript
either2of6 :: forall a b c d e f. b -> Either6 a b c d e f
```

#### `either3of6`

``` purescript
either3of6 :: forall a b c d e f. c -> Either6 a b c d e f
```

#### `either4of6`

``` purescript
either4of6 :: forall a b c d e f. d -> Either6 a b c d e f
```

#### `either5of6`

``` purescript
either5of6 :: forall a b c d e f. e -> Either6 a b c d e f
```

#### `either6of6`

``` purescript
either6of6 :: forall a b c d e f. f -> Either6 a b c d e f
```

#### `either1of7`

``` purescript
either1of7 :: forall a b c d e f g. a -> Either7 a b c d e f g
```

#### `either2of7`

``` purescript
either2of7 :: forall a b c d e f g. b -> Either7 a b c d e f g
```

#### `either3of7`

``` purescript
either3of7 :: forall a b c d e f g. c -> Either7 a b c d e f g
```

#### `either4of7`

``` purescript
either4of7 :: forall a b c d e f g. d -> Either7 a b c d e f g
```

#### `either5of7`

``` purescript
either5of7 :: forall a b c d e f g. e -> Either7 a b c d e f g
```

#### `either6of7`

``` purescript
either6of7 :: forall a b c d e f g. f -> Either7 a b c d e f g
```

#### `either7of7`

``` purescript
either7of7 :: forall a b c d e f g. g -> Either7 a b c d e f g
```

#### `either1of8`

``` purescript
either1of8 :: forall a b c d e f g h. a -> Either8 a b c d e f g h
```

#### `either2of8`

``` purescript
either2of8 :: forall a b c d e f g h. b -> Either8 a b c d e f g h
```

#### `either3of8`

``` purescript
either3of8 :: forall a b c d e f g h. c -> Either8 a b c d e f g h
```

#### `either4of8`

``` purescript
either4of8 :: forall a b c d e f g h. d -> Either8 a b c d e f g h
```

#### `either5of8`

``` purescript
either5of8 :: forall a b c d e f g h. e -> Either8 a b c d e f g h
```

#### `either6of8`

``` purescript
either6of8 :: forall a b c d e f g h. f -> Either8 a b c d e f g h
```

#### `either7of8`

``` purescript
either7of8 :: forall a b c d e f g h. g -> Either8 a b c d e f g h
```

#### `either8of8`

``` purescript
either8of8 :: forall a b c d e f g h. h -> Either8 a b c d e f g h
```

#### `either1of9`

``` purescript
either1of9 :: forall a b c d e f g h i. a -> Either9 a b c d e f g h i
```

#### `either2of9`

``` purescript
either2of9 :: forall a b c d e f g h i. b -> Either9 a b c d e f g h i
```

#### `either3of9`

``` purescript
either3of9 :: forall a b c d e f g h i. c -> Either9 a b c d e f g h i
```

#### `either4of9`

``` purescript
either4of9 :: forall a b c d e f g h i. d -> Either9 a b c d e f g h i
```

#### `either5of9`

``` purescript
either5of9 :: forall a b c d e f g h i. e -> Either9 a b c d e f g h i
```

#### `either6of9`

``` purescript
either6of9 :: forall a b c d e f g h i. f -> Either9 a b c d e f g h i
```

#### `either7of9`

``` purescript
either7of9 :: forall a b c d e f g h i. g -> Either9 a b c d e f g h i
```

#### `either8of9`

``` purescript
either8of9 :: forall a b c d e f g h i. h -> Either9 a b c d e f g h i
```

#### `either9of9`

``` purescript
either9of9 :: forall a b c d e f g h i. i -> Either9 a b c d e f g h i
```

#### `either1of10`

``` purescript
either1of10 :: forall a b c d e f g h i j. a -> Either10 a b c d e f g h i j
```

#### `either2of10`

``` purescript
either2of10 :: forall a b c d e f g h i j. b -> Either10 a b c d e f g h i j
```

#### `either3of10`

``` purescript
either3of10 :: forall a b c d e f g h i j. c -> Either10 a b c d e f g h i j
```

#### `either4of10`

``` purescript
either4of10 :: forall a b c d e f g h i j. d -> Either10 a b c d e f g h i j
```

#### `either5of10`

``` purescript
either5of10 :: forall a b c d e f g h i j. e -> Either10 a b c d e f g h i j
```

#### `either6of10`

``` purescript
either6of10 :: forall a b c d e f g h i j. f -> Either10 a b c d e f g h i j
```

#### `either7of10`

``` purescript
either7of10 :: forall a b c d e f g h i j. g -> Either10 a b c d e f g h i j
```

#### `either8of10`

``` purescript
either8of10 :: forall a b c d e f g h i j. h -> Either10 a b c d e f g h i j
```

#### `either9of10`

``` purescript
either9of10 :: forall a b c d e f g h i j. i -> Either10 a b c d e f g h i j
```

#### `either10of10`

``` purescript
either10of10 :: forall a b c d e f g h i j. j -> Either10 a b c d e f g h i j
```

#### `either2`

``` purescript
either2 :: forall a b z. (a -> z) -> (b -> z) -> Either2 a b -> z
```

#### `either3`

``` purescript
either3 :: forall a b c z. (a -> z) -> (b -> z) -> (c -> z) -> Either3 a b c -> z
```

#### `either4`

``` purescript
either4 :: forall a b c d z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> Either4 a b c d -> z
```

#### `either5`

``` purescript
either5 :: forall a b c d e z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> Either5 a b c d e -> z
```

#### `either6`

``` purescript
either6 :: forall a b c d e f z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> Either6 a b c d e f -> z
```

#### `either7`

``` purescript
either7 :: forall a b c d e f g z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> Either7 a b c d e f g -> z
```

#### `either8`

``` purescript
either8 :: forall a b c d e f g h z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> (h -> z) -> Either8 a b c d e f g h -> z
```

#### `either9`

``` purescript
either9 :: forall a b c d e f g h i z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> (h -> z) -> (i -> z) -> Either9 a b c d e f g h i -> z
```

#### `either10`

``` purescript
either10 :: forall a b c d e f g h i j z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> (h -> z) -> (i -> z) -> (j -> z) -> Either10 a b c d e f g h i j -> z
```


