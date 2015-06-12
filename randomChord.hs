import Control.Monad
import System.Random

data Degree = I | II | III | IV | V | VI | VII
            deriving (Show, Eq)

nextChordDist :: Degree -> [(Degree, Rational)]
nextChordDist I   = [(II,1), (IV,1), (V,1), (VI,1)]
nextChordDist II  = [(V,1)]
nextChordDist III = [(VI,1)]
nextChordDist IV  = [(I,1), (II,1), (V,2)]
nextChordDist V   = [(I,3), (VI,1)]
nextChordDist VI  = [(I,2), (II,1), (V,1)]
nextChordDist VII = [(V,1)]

nextChord :: Degree -> Degree
nextChord = fromList . nextChordDist 
