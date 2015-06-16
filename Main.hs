module Main where

import Euterpea
import RandomChord
import Chords
import Scale
import Bassline

randomSequence :: IO ()
randomSequence = do d <- chords 6 I
                    let c = d ++ [V,I]
                    let m = map (scaleChord Major) c
                    let n = map (\x -> scaleNote Major x 40) c
                    let musicl = map (flip (uncurry cchord) wn) (zip m n)
                    let music = foldl (:+:) (rest 0) musicl
                    print c
                    play music
                    writeMidi "main.midi" music

randomSeqWithBass :: IO ()
randomSeqWithBass = do let bas = 60
                       let bass = 60-12*2

                       -- Chords
                       d <- chords 6 I
                       let c = d ++ [V,I]
                       let m = map (scaleChord Major) c
                       let n = map (\x -> scaleNote Major x bas) c
                       let musicl = map (flip (uncurry cchord) wn) (zip m n)
                       let music = foldl (:+:) (rest 0) musicl
                    
                       -- Bassline
                       let b = bassline bass wn d
                       
                       let commusic = music :=: b
                       print c
                       play commusic
                       writeMidi "main.midi" music


main :: IO ()
main = randomSeqWithBass
