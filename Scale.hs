module Scale where

import Euterpea
import Chords

-- | Intervals of the Major/Minor scale
scaleIntervals :: Mode -> [Int]
scaleIntervals Major = [0,2,4,5,7,9,11]
scaleIntervals Minor = [0,2,3,5,7,8,10]


-- | Chords of the Major/Minor scale
scaleChords :: Mode -> [ChordMode]
scaleChords Major = [Maj, Min, Min, Maj, Dom7, Min, Dim]
scaleChords Minor = [Min, Dim, Maj, Min, Dom7, Maj, Maj]


-- | Chord of a given degree of the Major/Minor scale
scaleChord :: Mode -> Degree -> ChordMode
scaleChord m d = (scaleChords m) !! (fromEnum d)


-- | Absolute pitch of the given degree of the Major/Minor scale
--   upon a root absolute pitch
scaleNote :: Mode -> Degree -> AbsPitch -> AbsPitch
scaleNote m d = (+ ((scaleIntervals m) !! (fromEnum d)))
