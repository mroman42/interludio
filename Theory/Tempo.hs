module Theory.Tempo where

import Euterpea

data TimeSignature = TimeSignature { beats :: Int
                                   , value :: Dur
                                   } deriving (Eq)
