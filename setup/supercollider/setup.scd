// Start SuperDirt environment for Tidalcycles
SuperDirt.start

// initialise midi client
// eval each line by itself
// more info here:
// https://tidalcycles.org/index.php/SuperDirt_MIDI_Tutorial

MIDIClient.init;

~midiOut = MIDIOut.newByName("IAC Driver", "Bus 1");

~dirt.soundLibrary.addMIDI(\midi, ~midiOut);
