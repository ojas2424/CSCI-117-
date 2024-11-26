module Fraction (Fraction, frac) where

-- Fraction type. ADT maintains the invariant that every fraction Frac n m
-- satisfies m > 0 and gcd n m == 1. For fractions satisfying this invariant
-- equality is the same as literal equality (hence "deriving Eq")

data Fraction = Frac Integer Integer deriving Eq


-- Public constructor: take two integers, n and m, and construct a fraction
-- representing n/m that satisfies the invariant, if possible
frac :: Integer -> Integer -> Maybe Fraction
frac n m  =	if (m > 0) &&(gcd n m == 1)
			then Just (Frac n m)
			else Nothing
			
-- Show instance that outputs Frac n m as n/m
instance Show Fraction where
	show (Frac n m) = show (div n (gcd n m)) ++ "/" ++ show (div m (gcd n m))
	
-- Ord instance for Fraction
instance Ord Fraction where
	compare (Frac n m) (Frac x y) = compare (n * y) (m * x) 
-- Num instance for Fraction
instance Num Fraction where
	(Frac n m) + (Frac x y) = Frac ((n * y) + (m * x)) (m * y)
	(Frac n m) - (Frac x y) = Frac ((n * y) - (m * x)) (m * y)
	(Frac n m) * (Frac x y) = Frac (n*x) (m*y)
	
	abs (Frac x y)	| (x < 0) && (y<0) = Frac (-x) (-y)
				| (x < 0) = Frac (-x) y
				| (y < 0) = Frac x (-y)
				| otherwise = Frac x y
	signum (Frac n m)	| (div n m) > 0 =1
					| (div n m) < 0 = (-1)
					| otherwise = 0
	fromInteger x	= Frac x 1
	negate (Frac n  m)	= Frac (-n) m