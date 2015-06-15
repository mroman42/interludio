module Chords where

import Euterpea

data Degree = I | II | III | IV | V | VI | VII
            deriving (Show, Eq, Enum)

data ChordMode = Maj  | Maj7 | Maj9 | Maj6
               | Min  | Min7 | Min9 | Min7b5 | MinM7
               | Dim  | Dim7
               | Dom7 | Dom9 | Dom7b9
                 deriving (Show, Eq)


{- Intervals for a given chord mode. -}                 
chordIntervals :: ChordMode -> [Int]
chordIntervals Maj    = [4,3,5]
chordIntervals Maj7   = [4,3,4,1]
chordIntervals Maj9   = [4,3,4,3]
chordIntervals Maj6   = [4,3,2,3]
chordIntervals Min    = [3,4,5] 
chordIntervals Min7   = [3,4,3,2] 
chordIntervals Min9   = [3,4,3,4] 
chordIntervals Min7b5 = [3,3,4,2] 
chordIntervals MinM7  = [3,4,4,1] 
chordIntervals Dim    = [3,3,3] 
chordIntervals Dim7   = [3,3,3,3] 
chordIntervals Dom7   = [4,3,3,2] 
chordIntervals Dom9   = [4,3,3,4]
chordIntervals Dom7b9 = [4,3,3,3]

chordAbsBase :: ChordMode -> AbsPitch -> [AbsPitch]
chordAbsBase m n = map (+n) $ scanl (+) 0 (chordIntervals m)

absBase :: Dur -> [AbsPitch] -> [Music Pitch]
absBase d = map (Prim . Note d . pitch)

-- Chord to music
cchord :: ChordMode -> AbsPitch -> Dur -> Music Pitch
cchord mode pitch dur = foldl (:=:) (rest 0) $ absBase dur (chordAbsBase mode pitch)
