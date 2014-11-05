module Data.Either where
  import Control.Alt

  data Either a b = Left a | Right b

  either :: forall a b c. (a -> c) -> (b -> c) -> Either a b -> c
  either f _ (Left a) = f a
  either _ g (Right b) = g b

  isLeft :: forall a b. Either a b -> Boolean
  isLeft = either (const true) (const false)

  isRight :: forall a b. Either a b -> Boolean
  isRight = either (const false) (const true)

  instance functorEither :: Functor (Either a) where
    (<$>) _ (Left x) = Left x
    (<$>) f (Right y) = Right (f y)

  instance applyEither :: Apply (Either e) where
    (<*>) (Left e) _ = Left e
    (<*>) (Right f) r = f <$> r

  instance applicativeEither :: Applicative (Either e) where
    pure = Right

  instance altEither :: Alt (Either e) where
    (<|>) (Left _) r = r
    (<|>) l        _ = l

  instance bindEither :: Bind (Either e) where
    (>>=) = either (\e _ -> Left e) (\a f -> f a)

  instance monadEither :: Monad (Either e)

  instance showEither :: (Show a, Show b) => Show (Either a b) where
    show (Left x) = "Left (" ++ show x ++ ")"
    show (Right y) = "Right (" ++ show y ++ ")"

  instance eqEither :: (Eq a, Eq b) => Eq (Either a b) where
    (==) (Left a1)  (Left a2)  = a1 == a2
    (==) (Right b1) (Right b2) = b1 == b2
    (==) _          _          = false
    (/=) a          b          = not (a == b)

  instance ordEither :: (Ord a, Ord b) => Ord (Either a b) where
    compare (Left a1)  (Left a2)  = compare a1 a2
    compare (Right b1) (Right b2) = compare b1 b2
    compare (Left a)   _          = LT
    compare _          (Left b)   = GT

module Data.Either.Nested where
  import Data.Either

  choice2 :: forall a b z. (a -> z) -> (b -> z) -> Either a b -> z
  choice2 = either

  choice3 :: forall a b c z. (a -> z) -> (b -> z) -> (c -> z) -> Either a (Either b c) -> z
  choice3 a b c = either a (either b c)

  choice4 :: forall a b c d z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> Either a (Either b (Either c d)) -> z
  choice4 a b c d = either a (either b (either c d))

  choice5 :: forall a b c d e z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> Either a (Either b (Either c (Either d e))) -> z
  choice5 a b c d e = either a (either b (either c (either d e)))

  choice6 :: forall a b c d e f z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> Either a (Either b (Either c (Either d (Either e f)))) -> z
  choice6 a b c d e f = either a (either b (either c (either d (either e f))))

  choice7 :: forall a b c d e f g z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> Either a (Either b (Either c (Either d (Either e (Either f g))))) -> z
  choice7 a b c d e f g = either a (either b (either c (either d (either e (either f g)))))

  choice8 :: forall a b c d e f g h z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> (h -> z) -> Either a (Either b (Either c (Either d (Either e (Either f (Either g h)))))) -> z
  choice8 a b c d e f g h = either a (either b (either c (either d (either e (either f (either g h))))))

  choice9 :: forall a b c d e f g h i z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> (h -> z) -> (i -> z) -> Either a (Either b (Either c (Either d (Either e (Either f (Either g (Either h i))))))) -> z
  choice9 a b c d e f g h i = either a (either b (either c (either d (either e (either f (either g (either h i)))))))

  choice10 :: forall a b c d e f g h i j z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> (h -> z) -> (i -> z) -> (j -> z) -> Either a (Either b (Either c (Either d (Either e (Either f (Either g (Either h (Either i j)))))))) -> z
  choice10 a b c d e f g h i j = either a (either b (either c (either d (either e (either f (either g (either h (either i j))))))))