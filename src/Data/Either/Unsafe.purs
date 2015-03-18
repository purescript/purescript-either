module Data.Either.Unsafe where

import Data.Either

fromRight :: forall a b. Either a b -> b
fromRight (Right a) = a

fromLeft :: forall a b. Either a b -> a
fromLeft (Left a) = a
