module Data.Either.Nested where
  import Data.Either

  type Either2 a b = Either a b
  type Either3 a b c = Either a (Either2 b c)
  type Either4 a b c d = Either a (Either3 b c d)
  type Either5 a b c d e = Either a (Either4 b c d e)
  type Either6 a b c d e f = Either a (Either5 b c d e f)
  type Either7 a b c d e f g = Either a (Either6 b c d e f g)
  type Either8 a b c d e f g h = Either a (Either7 b c d e f g h)
  type Either9 a b c d e f g h i = Either a (Either8 b c d e f g h i)
  type Either10 a b c d e f g h i j = Either a (Either9 b c d e f g h i j)

  either2 :: forall a b z. (a -> z) -> (b -> z) -> Either2 a b -> z
  either2 = either

  either3 :: forall a b c z. (a -> z) -> (b -> z) -> (c -> z) -> Either3 a b c -> z
  either3 a b c = either a (either2 b c)

  either4 :: forall a b c d z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> Either4 a b c d -> z
  either4 a b c d = either a (either3 b c d)

  either5 :: forall a b c d e z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> Either5 a b c d e -> z
  either5 a b c d e = either a (either4 b c d e)

  either6 :: forall a b c d e f z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> Either6 a b c d e f -> z
  either6 a b c d e f = either a (either5 b c d e f)

  either7 :: forall a b c d e f g z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> Either7 a b c d e f g -> z
  either7 a b c d e f g = either a (either6 b c d e f g)

  either8 :: forall a b c d e f g h z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> (h -> z) -> Either8 a b c d e f g h -> z
  either8 a b c d e f g h = either a (either7 b c d e f g h)

  either9 :: forall a b c d e f g h i z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> (h -> z) -> (i -> z) -> Either9 a b c d e f g h i -> z
  either9 a b c d e f g h i = either a (either8 b c d e f g h i)

  either10 :: forall a b c d e f g h i j z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> (h -> z) -> (i -> z) -> (j -> z) -> Either10 a b c d e f g h i j -> z
  either10 a b c d e f g h i j = either a (either9 b c d e f g h i j)