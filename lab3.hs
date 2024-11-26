-- CSci 117, Lab 3:  ADTs and Type Classes

import Data.List (sort)
import Queue
import Fraction

---------------- Part 1: Queue client

-- add a list of elements, in order, into a queue
adds :: [a] -> Queue a -> Queue a
adds [] q = q
adds (x:xs) q = addq x (adds xs q) --addq returns in Queue2 but we want queue

-- remove all elements of the queue, putting them, in order, into a list
rems :: Queue a -> [a] --use fst to get the first value and snd to get the second value of the tuple returned by remq
rems q = 	if ismt q 
		then []
		else [fst(remq q)] ++ rems (snd (remq q))


-- test whether adding a given list of elements to an initially empty queue
-- and then removing them all produces the same list (FIFO). Should return True.
testq :: Eq a => [a] -> Bool
testq xs = xs == rems (adds xs mtq)


---------------- Part 2: Using typeclass instances for fractions

-- Construct a fraction, producing an error if it fails
frac' :: Integer -> Integer -> Fraction
frac' a b = case frac a b of
             Nothing -> error "Illegal fraction"
             Just fr -> fr


-- Calculate the average of a list of fractions
-- Give the error "Empty average" if xs is empty
average :: [Fraction] -> Fraction
average [] = error "Empty Average"

-- Some lists of fractions
list1 = [frac' n (n+1) | n <- [1..20]]
list2 = [frac' 1 n | n <- [1..20]]
list3 = zipWith (+) list1 list2

-- Make up several more lists for testing


-- Show examples testing the functions sort, sum, product, maximum, minimum,
-- and average on a few lists of fractions each. Think about how these library
-- functions can operate on Fractions, even though they were written long ago
