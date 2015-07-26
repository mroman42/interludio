module Bassline where

import Euterpea
import Chords
import Scale


-- | Given a base note and a duration, creates a melodic
--   line with the roots of the chords.
bassline :: Mode -> AbsPitch -> Dur -> [Degree] -> Music Pitch
bassline m n d ch = line $ map tr ch
    where tr = Prim . (Note d) . pitch . (+n) . fromEnum . sn
          sn = (\x -> scaleNote m x 0)

