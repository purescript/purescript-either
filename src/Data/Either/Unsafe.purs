module Data.Either.Unsafe
  ( fromLeft
  , fromRight
  ) where

import Prelude

import Data.Either

-- | A partial function that extracts the value from the `Left` data constructor.
-- | Passing a `Right` to `fromLeft` will throw an error at runtime.
fromLeft :: forall a b. Either a b -> a
fromLeft (Left a) = a
fromLeft _ = unsafeThrow "Data.Either.Unsafe.fromLeft called on Right value"

-- | A partial function that extracts the value from the `Right` data constructor.
-- | Passing a `Left` to `fromRight` will throw an error at runtime.
fromRight :: forall a b. Either a b -> b
fromRight (Right a) = a
fromRight _ = unsafeThrow "Data.Either.Unsafe.fromRight called on Left value"

foreign import unsafeThrow :: forall a. String -> a
