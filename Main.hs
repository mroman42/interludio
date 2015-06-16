module Main where

import Euterpea
import RandomChord
import Chords
import Scale
import Bassline
import Tempo
import Arpeggio

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
                       let b = bassline bass wn c
                       
                       let commusic = music :=: b
                       print c
                       play commusic
                       writeMidi "main.midi" music


randomPraeludium :: IO ()
randomPraeludium = do  let bas = 60
                       let bass = 60-12*2
                       let dur = wn

                       -- Chords
                       d <- chords 6 I
                       let c = d ++ [V,I]
                       let m = map (scaleChord Major) c
                       let n = map (\x -> scaleNote Major x bas) c
                       let musicl = map (flip (uncurry cchord) dur) (zip m n)
                       let music = foldl (:+:) (rest 0) musicl

                       -- Bassline
                       let bmusic = bassline bass wn c

                       -- Arpeggio
                       let arp = map (flip (uncurry arpeggio) praeludium) (zip n m)
                       let arpmusic = foldl (:+:) (rest 0) arp

                       let commusic = music :=: arpmusic :=: bmusic
                       print c
                       play commusic
                       writeMidi "main.midi" music

main :: IO ()
main = randomPraeludium
