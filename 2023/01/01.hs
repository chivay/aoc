#!/usr/bin/env nix-shell
#!nix-shell --pure -i runghc -p ghc

import Data.List
import Data.Char

lineToNum :: String -> Int
lineToNum s = read [head x, last x]
    where x = filter isDigit s

solveDay1 :: String -> Int
solveDay1 input = sum $ lineToNum <$> lines input

solveDay1Plus :: String -> Int
solveDay1Plus = solveDay1 . normalize

normTail :: String -> String
normTail = normalize . tail

normalize :: String -> String
normalize s@('o':'n':'e':_) = '1':(normTail s)
normalize s@('t':'w':'o':_) = '2':(normTail s)
normalize s@('t':'h':'r':'e':'e':_) = '3':(normTail s)
normalize s@('f':'o':'u':'r':_) = '4':(normTail s)
normalize s@('f':'i':'v':'e':_) = '5':(normTail s)
normalize s@('s':'i':'x':_) = '6':(normTail s)
normalize s@('s':'e':'v':'e':'n':_) = '7':(normTail s)
normalize s@('e':'i':'g':'h':'t':_) = '8':(normTail s)
normalize s@('n':'i':'n':'e':_) = '9':(normTail s)
normalize (s:ss) = s:(normalize ss)
normalize [] = []

main :: IO ()
main = do
    content <- readFile "input"
    putStrLn . show $ solveDay1 content
    putStrLn . show $ solveDay1Plus content
    pure ()
