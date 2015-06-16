module Main where

import Euterpea
import RandomChord
import Chords
import Scale

randomSequence :: IO ()
randomSequence = do d <- chords 6 I
                    let c = d ++ [V,I]
                    let m = map (scaleChord Major) c
                    let n = map (\d -> scaleNote Major d 40) c
                    let musicl = map (flip (uncurry cchord) wn) (zip m n)
                    let music = foldl (:+:) (rest 0) musicl
                    print c
                    play music
                    writeMidi "main.midi" music

main :: IO ()
main = randomSequence
