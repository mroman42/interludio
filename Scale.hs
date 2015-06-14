module Scale where

import Euterpea
import Chords

scaleIntervals :: Mode -> [Int]
scaleIntervals Major = [0,2,4,5,7,9,11]
scaleIntervals Minor = [0,2,3,5,7,8,10]

scaleNote :: Mode -> Degree -> AbsPitch -> AbsPitch
scaleNote m d = (+ ((scaleIntervals m) !! (fromEnum d)))
