module RandomChord where

import Control.Monad.Random
import System.Random
import Chords


-- | Probability distribution of the next chord given one.
--   Based on the classical harmonical rules.
nextChordDist :: Degree -> [(Degree, Rational)]
nextChordDist I   = [(II,1), (IV,1), (V,1), (VI,1)]
nextChordDist II  = [(V,1)]
nextChordDist III = [(VI,1)]
nextChordDist IV  = [(I,1), (II,1), (V,2)]
nextChordDist V   = [(I,3), (VI,1)]
nextChordDist VI  = [(I,2), (II,1), (V,1)]
nextChordDist VII = [(V,1)]


-- | Random next chord, following the probability distribution
nextChord :: Degree -> IO Degree
nextChord = fromList . nextChordDist


-- | A sequence of random chords, following the probability distribution
chords :: Int -> Degree -> IO [Degree]
chords n a
    | n==0       = return [a]
    | otherwise = do  x <- nextChord a
                      ls <- chords (n-1) x
                      return (a:ls)
