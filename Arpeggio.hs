module Arpeggio where

import Euterpea
import Chords

type Motif = [(Int,Dur)]

praeludium :: Motif
praeludium = zip [0,1,2,3,4,2,3,4] [en,en..]

arpeggio :: AbsPitch -> ChordMode -> Motif -> Music Pitch
arpeggio base mode motif = line $ develop motif
    where develop = map (\(a,b) -> Prim $ Note b $ pitch $ posToNote a)
          posToNote = ((cycle $ chordAbsBase mode base) !!)
