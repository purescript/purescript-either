module Data.Either.Open where

import Data.Either (Either(..))
import Data.Either.Nested as Nested
import Data.Void (Void)
import Partial.Unsafe (unsafePartial)

type Either1 z = Either Void z
type Either2 a z = Either (Either1 a) z
type Either3 a b z = Either (Either2 a b) z
type Either4 a b c z = Either (Either3 a b c) z
type Either5 a b c d z = Either (Either4 a b c d) z
type Either6 a b c d e z = Either (Either5 a b c d e) z
type Either7 a b c d e f z = Either (Either6 a b c d e f) z
type Either8 a b c d e f g z = Either (Either7 a b c d e f g) z
type Either9 a b c d e f g h z = Either (Either8 a b c d e f g h) z
type Either10 a b c d e f g h i z = Either (Either9 a b c d e f g h i) z

in1 :: forall z a. a -> Nested.Either2 z a
in1 = Right

in2 :: forall z a b. a -> Nested.Either3 z a b
in2 v = Left (Right v)

in3 :: forall z a b c. a -> Nested.Either4 z a b c
in3 v = Left (Left (Right v))

in4 :: forall z a b c d. a -> Nested.Either5 z a b c d
in4 v = Left (Left (Left (Right v)))

in5 :: forall z a b c d e. a -> Nested.Either6 z a b c d e
in5 v = Left (Left (Left (Left (Right v))))

in6 :: forall z a b c d e f. a -> Nested.Either7 z a b c d e f
in6 v = Left (Left (Left (Left (Left (Right v)))))

in7 :: forall z a b c d e f g. a -> Nested.Either8 z a b c d e f g
in7 v = Left (Left (Left (Left (Left (Left (Right v))))))

in8 :: forall z a b c d e f g h. a -> Nested.Either9 z a b c d e f g h
in8 v = Left (Left (Left (Left (Left (Left (Left (Right v)))))))

in9 :: forall z a b c d e f g h i. a -> Nested.Either10 z a b c d e f g h i
in9 v = Left (Left (Left (Left (Left (Left (Left (Left (Right v))))))))

in10 :: forall z a b c d e f g h i j. a -> Nested.Either10 (Either z a) b c d e f g h i j
in10 v = Left (Left (Left (Left (Left (Left (Left (Left (Left (Right v)))))))))

at1 :: forall z r a. r -> (a -> r) -> Nested.Either2 z a -> r
at1 b a y = case y of
  Right r -> a r
  _ -> b

at2 :: forall z r a b. r -> (a -> r) -> Nested.Either3 z a b -> r
at2 b a y = case y of
  Left (Right r) -> a r
  _ -> b

at3 :: forall z r a b c. r -> (a -> r) -> Nested.Either4 z a b c -> r
at3 b a y = case y of
  Left (Left (Right r)) -> a r
  _ -> b

at4 :: forall z r a b c d. r -> (a -> r) -> Nested.Either5 z a b c d -> r
at4 b a y = case y of
  Left (Left (Left (Right r))) -> a r
  _ -> b

at5 :: forall z r a b c d e. r -> (a -> r) -> Nested.Either6 z a b c d e -> r
at5 b a y = case y of
  Left (Left (Left (Left (Right r)))) -> a r
  _ -> b

at6 :: forall z r a b c d e f. r -> (a -> r) -> Nested.Either7 z a b c d e f -> r
at6 b a y = case y of
  Left (Left (Left (Left (Left (Right r))))) -> a r
  _ -> b

at7 :: forall z r a b c d e f g. r -> (a -> r) -> Nested.Either8 z a b c d e f g -> r
at7 b a y = case y of
  Left (Left (Left (Left (Left (Left (Right r)))))) -> a r
  _ -> b

at8 :: forall z r a b c d e f g h. r -> (a -> r) -> Nested.Either9 z a b c d e f g h -> r
at8 b a y = case y of
  Left (Left (Left (Left (Left (Left (Left (Right r))))))) -> a r
  _ -> b

at9 :: forall z r a b c d e f g h i. r -> (a -> r) -> Nested.Either10 z a b c d e f g h i -> r
at9 b a y = case y of
  Left (Left (Left (Left (Left (Left (Left (Left (Right r)))))))) -> a r
  _ -> b

at10 :: forall z r a b c d e f g h i j. r -> (a -> r) -> Nested.Either10 (Either z a) b c d e f g h i j -> r
at10 b a y = case y of
  Left (Left (Left (Left (Left (Left (Left (Left (Left (Right r))))))))) -> a r
  _ -> b

runEither1 :: forall a. Either1 a -> a
runEither1 y = unsafePartial case y of
  Right r -> r

either2 :: forall r a b. (a -> r) -> (b -> r) -> Either2 a b -> r
either2 a b y = case y of
  Right r -> b r
  Left _1 -> a (runEither1 _1)

either3 :: forall r a b c. (a -> r) -> (b -> r) -> (c -> r) -> Either3 a b c -> r
either3 a b c y = case y of
  Right r -> c r
  Left _1 -> either2 a b _1

either4 :: forall r a b c d. (a -> r) -> (b -> r) -> (c -> r) -> (d -> r) -> Either4 a b c d -> r
either4 a b c d y = case y of
  Right r -> d r
  Left _1 -> either3 a b c _1

either5 :: forall r a b c d e. (a -> r) -> (b -> r) -> (c -> r) -> (d -> r) -> (e -> r) -> Either5 a b c d e -> r
either5 a b c d e y = case y of
  Right r -> e r
  Left _1 -> either4 a b c d _1

either6 :: forall r a b c d e f. (a -> r) -> (b -> r) -> (c -> r) -> (d -> r) -> (e -> r) -> (f -> r) -> Either6 a b c d e f -> r
either6 a b c d e f y = case y of
  Right r -> f r
  Left _1 -> either5 a b c d e _1

either7 :: forall r a b c d e f g. (a -> r) -> (b -> r) -> (c -> r) -> (d -> r) -> (e -> r) -> (f -> r) -> (g -> r) -> Either7 a b c d e f g -> r
either7 a b c d e f g y = case y of
  Right r -> g r
  Left _1 -> either6 a b c d e f _1

either8 :: forall r a b c d e f g h. (a -> r) -> (b -> r) -> (c -> r) -> (d -> r) -> (e -> r) -> (f -> r) -> (g -> r) -> (h -> r) -> Either8 a b c d e f g h -> r
either8 a b c d e f g h y = case y of
  Right r -> h r
  Left _1 -> either7 a b c d e f g _1

either9 :: forall r a b c d e f g h i. (a -> r) -> (b -> r) -> (c -> r) -> (d -> r) -> (e -> r) -> (f -> r) -> (g -> r) -> (h -> r) -> (i -> r) -> Either9 a b c d e f g h i -> r
either9 a b c d e f g h i y = case y of
  Right r -> i r
  Left _1 -> either8 a b c d e f g h _1

either10 :: forall r a b c d e f g h i j. (a -> r) -> (b -> r) -> (c -> r) -> (d -> r) -> (e -> r) -> (f -> r) -> (g -> r) -> (h -> r) -> (i -> r) -> (j -> r) -> Either10 a b c d e f g h i j -> r
either10 a b c d e f g h i j y = case y of
  Right r -> j r
  Left _1 -> either9 a b c d e f g h i _1
