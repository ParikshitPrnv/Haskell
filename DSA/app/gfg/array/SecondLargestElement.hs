module GFG.Array.SecondLargestElement where

import Data.List (sortBy)
import Data.Ord (comparing)

dummyList :: [Int]
dummyList = [1,2,3,4,5]

secondLargestElementSim :: IO ()
secondLargestElementSim = do
    let res = secondLargestElement dummyList
    case res of
        Just x -> putStrLn ("secondLargestElement found: "<> show x)
        Nothing -> putStrLn ("secondLargestElement can't be found")

secondLargestElement :: [Int] -> Maybe Int
secondLargestElement [] = Nothing
secondLargestElement [_] = Nothing
secondLargestElement x = 
    let sortedArr = (sortBy (flip compare) x)
    in Just (head (drop 1 sortedArr))


