module Queue (Queue, mtq, ismt, addq, remq) where

---- Interface ----------------
mtq  :: Queue a                  -- empty queue
ismt :: Queue a -> Bool          -- is the queue empty?
addq :: a -> Queue a -> Queue a  -- add element to front of queue
remq :: Queue a -> (a, Queue a)  -- remove element from back of queue;
                                 --   produces error on empty, "Can't remove
                                 --   an element from an empty queue"

{--- Implementation -----------

In this implementation, a queue is represented as a pair of lists.
The "front" of the queue is at the head of the first list,
and the "back" of the queue is at the head of the second list.
When the second list is empty and we want to remove an element,
we reverse the elements in the first list and move them to the back,
leaving the first list empty. We can now process the removal request.

-}

data Queue a = Queue [a] [a]

mtq = Queue [][] 

ismt q@(Queue a b) = (length a == 0) && (length b == 0) 
 
addq x q@(Queue [] []) = (Queue [] [x]) 
addq x q@(Queue [] b) = (Queue [x] b)
addq x q@(Queue a []) = (Queue (x:a) [])
addq x q@(Queue a b) = (Queue (x:a) b)

remq q@(Queue [] []) = error "Can't remove from empty list"
remq q@(Queue [] (x:b)) = (x, (Queue [] b)) 
remq q@(Queue a []) = (last a, (Queue [] (reverse(init a))))
remq q@(Queue a (x:b)) = (b, (Queue a b)) 
