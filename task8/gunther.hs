import Data.Function(on)
import Data.List(sortBy)

data LeftistHeap a = Leaf | Branch
  { item::a
  , left::(LeftistHeap a)
  , right::(LeftistHeap a)
  } deriving (Show)


empty :: Ord a => LeftistHeap a
empty = Leaf


rank :: Ord a => LeftistHeap a -> Int
rank (Branch _ _ right) = 1 + rank right
rank Leaf = 0

node :: Ord a => a -> LeftistHeap a -> LeftistHeap a -> LeftistHeap a
node item left right = merge' (insert item left) right

insert :: Ord a => a -> LeftistHeap a -> LeftistHeap a
insert item tree = merge' (Branch item Leaf Leaf) tree


merge' :: Ord a => LeftistHeap a -> LeftistHeap a -> LeftistHeap a
merge' branch Leaf = branch
merge' Leaf branch = branch
merge' b1 b2 = let
  [min, max] = sortBy (compare `on` item) [b1, b2]
  low = item min
  old = left min
  new = merge' max (right min)
  in if rank old >= rank new then Branch low old new else Branch low new old
