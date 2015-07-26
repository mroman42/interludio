module Main where

import Euterpea
import RandomChord
import Chords
import Scale
import Bassline
import Tempo
import Arpeggio
import Drumkit

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
                       let b = bassline Major bass wn c
                       
                       let commusic = music :=: b
                       print c
                       play commusic
                       writeMidi "main.midi" music


randomPraeludium :: IO ()
randomPraeludium = do  let bas = 62
                       let bass = bas-12*2
                       let dur = wn
                       let mod = Major

                       -- Chords
                       d <- chords 6 I
                       let c = d ++ [V,I]
                       let m = map (scaleChord mod) c
                       let n = map (\x -> scaleNote mod x bas) c
                       let musicl = map (flip (uncurry cchord) dur) (zip m n)
                       let music = line musicl

                       -- Bassline
                       let bmusic = Modify (Instrument Contrabass) $ bassline mod bass wn c

                       -- Arpeggio
                       let arp = map (flip (uncurry arpeggio) praeludium) (zip n m)
                       let arpmusic = Modify (Instrument AcousticGrandPiano) $ line arp

                       -- Drums
                       let drums = line (replicate 16 pattern)

                       -- Total
                       let commusic = chord [music, arpmusic, bmusic, drums]
                       print c
                       play commusic
                       writeMidi "main.midi" commusic

main :: IO ()
main = randomPraeludium
