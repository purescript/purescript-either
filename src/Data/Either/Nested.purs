-- | Utilities for n-eithers: sums types with more than two terms built from nested eithers.
-- |
-- | Nested eithers arise naturally in sum combinators. You shouldn't
-- | represent sum data using nested eithers, but if combinators you're working with
-- | create them, utilities in this module will allow to to more easily work
-- | with them, including translating to and from more traditional sum types.
-- |
-- | ```purescript
-- | data Color = Red Number | Green Number | Blue Number
-- |
-- | toEither3 :: Either3 Number Number Number -> Color
-- | toEither3 = either3 Red Green Blue
-- |
-- | fromEither3 :: Color -> Either3 Number Number Number
-- | fromEither3 (Red   v) = in3 v
-- | fromEither3 (Green v) = in2 v
-- | fromEither3 (Blue  v) = in1 v
-- | ```
-- |
-- | Note that the numbering counts from right-to-left. This is because the
-- | nesting is left-associative. Nesting this way preserves useful instances.
module Data.Either.Nested
  ( in1, in2, in3, in4, in5, in6, in7, in8, in9, in10
  , at1, at2, at3, at4, at5, at6, at7, at8, at9, at10
  , Either1, Either2, Either3, Either4, Either5, Either6, Either7, Either8, Either9, Either10
  , either1, either2, either3, either4, either5, either6, either7, either8, either9, either10
  ) where

import Data.Either (Either(..))
import Data.Void (Void, absurd)

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

type E2 z a = Either z a
type E3 z a b = Either (E2 z a) b
type E4 z a b c = Either (E3 z a b) c
type E5 z a b c d = Either (E4 z a b c) d
type E6 z a b c d e = Either (E5 z a b c d) e
type E7 z a b c d e f = Either (E6 z a b c d e) f
type E8 z a b c d e f g = Either (E7 z a b c d e f) g
type E9 z a b c d e f g h = Either (E8 z a b c d e f g) h
type E10 z a b c d e f g h i = Either (E9 z a b c d e f g h) i
type E11 z a b c d e f g h i j = Either (E10 z a b c d e f g h i) j

in1 :: forall z a. a -> E2 z a
in1 = Right

in2 :: forall z a b. a -> E3 z a b
in2 v = Left (Right v)

in3 :: forall z a b c. a -> E4 z a b c
in3 v = Left (Left (Right v))

in4 :: forall z a b c d. a -> E5 z a b c d
in4 v = Left (Left (Left (Right v)))

in5 :: forall z a b c d e. a -> E6 z a b c d e
in5 v = Left (Left (Left (Left (Right v))))

in6 :: forall z a b c d e f. a -> E7 z a b c d e f
in6 v = Left (Left (Left (Left (Left (Right v)))))

in7 :: forall z a b c d e f g. a -> E8 z a b c d e f g
in7 v = Left (Left (Left (Left (Left (Left (Right v))))))

in8 :: forall z a b c d e f g h. a -> E9 z a b c d e f g h
in8 v = Left (Left (Left (Left (Left (Left (Left (Right v)))))))

in9 :: forall z a b c d e f g h i. a -> E10 z a b c d e f g h i
in9 v = Left (Left (Left (Left (Left (Left (Left (Left (Right v))))))))

in10 :: forall z a b c d e f g h i j. a -> E11 z a b c d e f g h i j
in10 v = Left (Left (Left (Left (Left (Left (Left (Left (Left (Right v)))))))))

at1 :: forall z r a. r -> (a -> r) -> E2 z a -> r
at1 b a y = case y of
  Right r -> a r
  _ -> b

at2 :: forall z r a b. r -> (a -> r) -> E3 z a b -> r
at2 b a y = case y of
  Left (Right r) -> a r
  _ -> b

at3 :: forall z r a b c. r -> (a -> r) -> E4 z a b c -> r
at3 b a y = case y of
  Left (Left (Right r)) -> a r
  _ -> b

at4 :: forall z r a b c d. r -> (a -> r) -> E5 z a b c d -> r
at4 b a y = case y of
  Left (Left (Left (Right r))) -> a r
  _ -> b

at5 :: forall z r a b c d e. r -> (a -> r) -> E6 z a b c d e -> r
at5 b a y = case y of
  Left (Left (Left (Left (Right r)))) -> a r
  _ -> b

at6 :: forall z r a b c d e f. r -> (a -> r) -> E7 z a b c d e f -> r
at6 b a y = case y of
  Left (Left (Left (Left (Left (Right r))))) -> a r
  _ -> b

at7 :: forall z r a b c d e f g. r -> (a -> r) -> E8 z a b c d e f g -> r
at7 b a y = case y of
  Left (Left (Left (Left (Left (Left (Right r)))))) -> a r
  _ -> b

at8 :: forall z r a b c d e f g h. r -> (a -> r) -> E9 z a b c d e f g h -> r
at8 b a y = case y of
  Left (Left (Left (Left (Left (Left (Left (Right r))))))) -> a r
  _ -> b

at9 :: forall z r a b c d e f g h i. r -> (a -> r) -> E10 z a b c d e f g h i -> r
at9 b a y = case y of
  Left (Left (Left (Left (Left (Left (Left (Left (Right r)))))))) -> a r
  _ -> b

at10 :: forall z r a b c d e f g h i j. r -> (a -> r) -> E11 z a b c d e f g h i j -> r
at10 b a y = case y of
  Left (Left (Left (Left (Left (Left (Left (Left (Left (Right r))))))))) -> a r
  _ -> b

either1 :: forall a. Either1 a -> a
either1 y = case y of
  Right r -> r
  Left _0 -> absurd _0

either2 :: forall r a b. (a -> r) -> (b -> r) -> Either2 a b -> r
either2 a b y = case y of
  Right r -> b r
  Left _1 -> case _1 of
    Right r -> a r
    Left _0 -> absurd _0

either3 :: forall r a b c. (a -> r) -> (b -> r) -> (c -> r) -> Either3 a b c -> r
either3 a b c y = case y of
  Right r -> c r
  Left _2 -> case _2 of
    Right r -> b r
    Left _1 -> case _1 of
      Right r -> a r
      Left _0 -> absurd _0

either4 :: forall r a b c d. (a -> r) -> (b -> r) -> (c -> r) -> (d -> r) -> Either4 a b c d -> r
either4 a b c d y = case y of
  Right r -> d r
  Left _3 -> case _3 of
    Right r -> c r
    Left _2 -> case _2 of
      Right r -> b r
      Left _1 -> case _1 of
        Right r -> a r
        Left _0 -> absurd _0

either5 :: forall r a b c d e. (a -> r) -> (b -> r) -> (c -> r) -> (d -> r) -> (e -> r) -> Either5 a b c d e -> r
either5 a b c d e y = case y of
  Right r -> e r
  Left _4 -> case _4 of
    Right r -> d r
    Left _3 -> case _3 of
      Right r -> c r
      Left _2 -> case _2 of
        Right r -> b r
        Left _1 -> case _1 of
          Right r -> a r
          Left _0 -> absurd _0

either6 :: forall r a b c d e f. (a -> r) -> (b -> r) -> (c -> r) -> (d -> r) -> (e -> r) -> (f -> r) -> Either6 a b c d e f -> r
either6 a b c d e f y = case y of
  Right r -> f r
  Left _5 -> case _5 of
    Right r -> e r
    Left _4 -> case _4 of
      Right r -> d r
      Left _3 -> case _3 of
        Right r -> c r
        Left _2 -> case _2 of
          Right r -> b r
          Left _1 -> case _1 of
            Right r -> a r
            Left _0 -> absurd _0

either7 :: forall r a b c d e f g. (a -> r) -> (b -> r) -> (c -> r) -> (d -> r) -> (e -> r) -> (f -> r) -> (g -> r) -> Either7 a b c d e f g -> r
either7 a b c d e f g y = case y of
  Right r -> g r
  Left _6 -> case _6 of
    Right r -> f r
    Left _5 -> case _5 of
      Right r -> e r
      Left _4 -> case _4 of
        Right r -> d r
        Left _3 -> case _3 of
          Right r -> c r
          Left _2 -> case _2 of
            Right r -> b r
            Left _1 -> case _1 of
              Right r -> a r
              Left _0 -> absurd _0

either8 :: forall r a b c d e f g h. (a -> r) -> (b -> r) -> (c -> r) -> (d -> r) -> (e -> r) -> (f -> r) -> (g -> r) -> (h -> r) -> Either8 a b c d e f g h -> r
either8 a b c d e f g h y = case y of
  Right r -> h r
  Left _7 -> case _7 of
    Right r -> g r
    Left _6 -> case _6 of
      Right r -> f r
      Left _5 -> case _5 of
        Right r -> e r
        Left _4 -> case _4 of
          Right r -> d r
          Left _3 -> case _3 of
            Right r -> c r
            Left _2 -> case _2 of
              Right r -> b r
              Left _1 -> case _1 of
                Right r -> a r
                Left _0 -> absurd _0

either9 :: forall r a b c d e f g h i. (a -> r) -> (b -> r) -> (c -> r) -> (d -> r) -> (e -> r) -> (f -> r) -> (g -> r) -> (h -> r) -> (i -> r) -> Either9 a b c d e f g h i -> r
either9 a b c d e f g h i y = case y of
  Right r -> i r
  Left _8 -> case _8 of
    Right r -> h r
    Left _7 -> case _7 of
      Right r -> g r
      Left _6 -> case _6 of
        Right r -> f r
        Left _5 -> case _5 of
          Right r -> e r
          Left _4 -> case _4 of
            Right r -> d r
            Left _3 -> case _3 of
              Right r -> c r
              Left _2 -> case _2 of
                Right r -> b r
                Left _1 -> case _1 of
                  Right r -> a r
                  Left _0 -> absurd _0

either10 :: forall r a b c d e f g h i j. (a -> r) -> (b -> r) -> (c -> r) -> (d -> r) -> (e -> r) -> (f -> r) -> (g -> r) -> (h -> r) -> (i -> r) -> (j -> r) -> Either10 a b c d e f g h i j -> r
either10 a b c d e f g h i j y = case y of
  Right r -> j r
  Left _9 -> case _9 of
    Right r -> i r
    Left _8 -> case _8 of
      Right r -> h r
      Left _7 -> case _7 of
        Right r -> g r
        Left _6 -> case _6 of
          Right r -> f r
          Left _5 -> case _5 of
            Right r -> e r
            Left _4 -> case _4 of
              Right r -> d r
              Left _3 -> case _3 of
                Right r -> c r
                Left _2 -> case _2 of
                  Right r -> b r
                  Left _1 -> case _1 of
                    Right r -> a r
                    Left _0 -> absurd _0
