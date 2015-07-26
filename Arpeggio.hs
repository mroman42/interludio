module Arpeggio where

import Euterpea
import Theory.Chords

type Motif = [(Int,Dur)]

-- | Develops a motif upon a given chord and base note.
arpeggio :: AbsPitch -> ChordMode -> Motif -> Music Pitch
arpeggio base mode motif = line $ develop motif
    where develop = map (\(a,b) -> Prim $ Note b $ pitch $ posToNote a)
          posToNote = ((cycle $ chordAbsBase mode base) !!)


-- | Motif example. Taken from Praeludium 1, from The Well-Tempered Clavier
praeludium :: Motif
praeludium = zip [0,1,2,3,4,2,3,4] [en,en..]


