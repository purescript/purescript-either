module Main where

import Data.Either
import Debug.Trace
import Control.Monad.Eff
import Test.QuickCheck
import Test.QuickCheck.Functions
import Test.QuickCheck.Classes

type Ty = Either Number Number

main = do

  let ty = Left 0 :: Ty

  trace "test equality"
  check1 $ \n -> Left n  == Left n :: Ty
  check1 $ \n -> Right n == Right n :: Ty

  trace "test inequality"
  check1 $ \n -> Left n  /= Right n :: Ty
  check1 $ \n -> Right n /= Left n :: Ty
  check1 $ \n -> Left n  /= Left (n + 1) :: Ty
  check1 $ \n -> Right n /= Right (n + 1) :: Ty
  
assert :: Boolean -> QC
assert = quickCheck' 1
  
check1 :: (Number -> Boolean) -> QC
check1 = quickCheck
