{-# LANGUAGE BangPatterns #-}

module Main where

import Text.Read (readMaybe)
import Data.Maybe 
import Data.List

main :: IO ()
main = do
    putStrLn "Rom Rom Bhaiyo!"

simFindKth :: IO ()
simFindKth = do
    findKthElement [1, 2, 3, 4] 1
    findKthElement [1,2,3,4] 2
    findKthElement [1,2,3,4] 4
    findKthElement [1,2,3,4] 5


findKthElement :: [Int] -> Int -> IO ()
findKthElement ls k =
    if (length ls) < k
        then do
            putStrLn $ "length ls : " <> (show $ length ls)
            putStrLn $ "k: "<> (show k)
            putStrLn "invalid k given"
    else
        case listToMaybe (drop (k-1) ls) of
            Just x -> putStrLn ("kth element is " <> (show x))
            Nothing -> putStrLn "No element left"



simulateFindLastButOne :: IO ()
simulateFindLastButOne = do
    let valid1 = findLastButOne [1, 2, 3]
    let valid2 = findLastButOne [1,2,3,4]
    let valid3 = findLastButOne[1,2]
    let !invalid1 = findLastButOne []
    putStrLn $ show valid1
    putStrLn $ show valid2
    putStrLn $ show valid3

simulateFindLastWithUserInput :: IO()
simulateFindLastWithUserInput = do
    input <- getListInput ::  IO [Int]
    let x = findLastInList input
    putStrLn $ show x

simulateFindLast :: IO ()
simulateFindLast = do
    let x = findLastInList dummyList
    putStrLn $ show x 

findLastButOne :: [a] -> a
findLastButOne (x:_:[]) = x
findLastButOne (_:y:xs) = findLastButOne (y:xs)
findLastButOne [] = error "Invalid list given"
findLastButOne [x] = error "Invalid list given"

findLastInList :: [a] -> a
findLastInList (x: []) = x
findLastInList (_ : xs) = findLastInList xs
findLastInList [] = error "Empty List Given"

dummyList :: [Int]
dummyList = [1, 2, 3, 4]

getListInput :: Read a => IO ([a])
getListInput = do
    input <- getLine
    return $ mapMaybe readMaybe (words input)
    
