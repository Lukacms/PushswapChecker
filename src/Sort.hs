{-
-- EPITECH PROJECT, 2023
-- Rush1
-- File description:
-- Operations
-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use :" #-}

module Sort
  ( treeSort,
  )
where

data Tree a = Empty | Node (Tree a) a (Tree a) | Tree deriving (Show)

instance Functor Tree where
  fmap func (Node Empty x Empty) = Node Empty (func x) Empty
  fmap func (Node x y Empty) = Node (fmap func x) (func y) Empty
  fmap func (Node Empty y z) = Node Empty (func y) (fmap func z)
  fmap func (Node x y z) = Node (fmap func x) (func y) (fmap func z)
  fmap _ _ = Empty

addInTree :: Ord a => a -> Tree a -> Tree a
addInTree a Empty = Node Empty a Empty
addInTree a (Node x y z)
  | a >= y = Node x y (addInTree a z)
  | otherwise = Node (addInTree a x) y z
addInTree _ _ = Empty

listToTree :: Ord a => [a] -> Tree a
listToTree [] = Empty
listToTree a = addInTree (last a) (listToTree (init a))

treeToList :: Tree a -> [a]
treeToList Empty = []
treeToList (Node Empty y Empty) = [y]
treeToList (Node x y Empty) = treeToList x ++ [y]
treeToList (Node Empty y z) = [y] ++ treeToList z
treeToList (Node x y z) = treeToList x ++ [y] ++ treeToList z
treeToList _ = []

treeSort :: Ord a => [a] -> [a]
treeSort [] = []
treeSort a = treeToList (listToTree a)
