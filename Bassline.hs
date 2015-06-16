module Bassline where

import Euterpea
import Chords
import Scale

bassline :: AbsPitch -> Dur -> [Degree] -> Music Pitch
bassline n d ch = line $ map tr ch
    where tr = Prim . (Note d) . pitch . (+n) . fromEnum . sn
          sn = (\x -> scaleNote Major x 0)

