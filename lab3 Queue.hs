module Queue (Queue, mtq, ismt, addq, remq) where

---- Interface ----------------
mtq  :: Queue a                  -- empty queue
ismt :: Queue a -> Bool          -- is the queue empty?
addq :: a -> Queue a -> Queue a  -- add element to front of queue
remq :: Queue a -> (a, Queue a)  -- remove element from back of queue;
                                 --   produces error on empty, "Can't remove
                                 --   an element from an empty queue"

{---- Implementation -----------

In this implementation, a queue is represented as an ordinary list.
The "front" of the queue is at the head of the list,
and the "back" of the queue is at the end of the list.

-}

data Queue a = Queue [a]

mtq = Queue [] 
ismt (Queue q) = length q == 0 
addq  x (Queue q) = Queue (x:q)  
remq (Queue q) = if (length q == 0)
	       then error "Can't remove an element from an empty queue"
	       else  (last q, Queue (init q))  
