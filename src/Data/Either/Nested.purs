module Data.Either.Nested where
  import Data.Either

  type Either2 a z = Either a z
  type Either3 a b z = Either (Either2 a b) z
  type Either4 a b c z = Either (Either3 a b c) z
  type Either5 a b c d z = Either (Either4 a b c d) z
  type Either6 a b c d e z = Either (Either5 a b c d e) z
  type Either7 a b c d e f z = Either (Either6 a b c d e f) z
  type Either8 a b c d e f g z = Either (Either7 a b c d e f g) z
  type Either9 a b c d e f g h z = Either (Either8 a b c d e f g h) z
  type Either10 a b c d e f g h i z = Either (Either9 a b c d e f g h i) z

  either2 :: forall a b z. (a -> z) -> (b -> z) -> Either2 a b -> z
  either2 = either

  either3 :: forall a b c z. (a -> z) -> (b -> z) -> (c -> z) -> Either3 a b c -> z
  either3 a b z = either (either2 a b) z

  either4 :: forall a b c d z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> Either4 a b c d -> z
  either4 a b c z = either (either3 a b c) z 

  either5 :: forall a b c d e z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> Either5 a b c d e -> z
  either5 a b c d z = either (either4 a b c d) z 

  either6 :: forall a b c d e f z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> Either6 a b c d e f -> z
  either6 a b c d e z = either (either5 a b c d e) z 

  either7 :: forall a b c d e f g z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> Either7 a b c d e f g -> z
  either7 a b c d e f z = either (either6 a b c d e f) z 

  either8 :: forall a b c d e f g h z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> (h -> z) -> Either8 a b c d e f g h -> z
  either8 a b c d e f g z = either (either7 a b c d e f g) z

  either9 :: forall a b c d e f g h i z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> (h -> z) -> (i -> z) -> Either9 a b c d e f g h i -> z
  either9 a b c d e f g h z = either (either8 a b c d e f g h) z

  either10 :: forall a b c d e f g h i j z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> (h -> z) -> (i -> z) -> (j -> z) -> Either10 a b c d e f g h i j -> z
  either10 a b c d e f g h i z = either (either9 a b c d e f g h i) z