module GFG.Array.ThirdLargestElement where

import Data.List (sortBy)
import Data.Ord (comparing)

dummyList :: [Int]
dummyList = [1,2, 3, 4, 5]

thirdLargestElementSim :: IO ()
thirdLargestElementSim = do
    let res = thirdLargestElement dummyList
    case res of
        Just x -> putStrLn ("thirdLargestElement found: "<> show x)
        Nothing -> putStrLn ("thirdLargestElement can't be found")

thirdLargestElement :: [Int] -> Maybe Int
thirdLargestElement ls = 
    if (length ls) >= 3
        then 
            let sortedArr = sortBy (flip compare) ls
            in (Just (sortedArr !! 2))
    else Nothing