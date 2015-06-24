module Drumkit where

import Euterpea

hihat = 44
bassd = 35
snare = 38
ftoom = 41

pattern :: Music Pitch
pattern = foldr (:+:) (Prim $ Rest 0) (map hit [bassd,hihat,snare,hihat])
    where hit = Modify (Instrument Percussion) . Prim . (Note en) . pitch
