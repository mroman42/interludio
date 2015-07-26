# interludio

*An experiment on random tonal music.*

Libraries and small programs composing random tonal music. Based on [the Euterpea
package](http://hackage.haskell.org/package/Euterpea-1.0.0) for music research.

## Usage

In this first version, the `Main.hs` code outputs a MIDI signal with a
random-generated preludium. To use it, and to transform the MIDI signal, the
following dependencies are necessary:

* **Euterpea**. Version 1.0.0.
* **qjackctl** or any other application to control the JACK audio sound server.
* **qsynth** or any other synthesiser.
* **freepats** or any other set of instrument patches.

To get the sound working, **qsynth** has to be connected to the *MIDI Through*
output in the JACK server. This can be done in the *connections tab* of the *JACK
Audio Connection Kit*.
