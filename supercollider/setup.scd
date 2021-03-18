// This code forwards messages from tidal to an additional port via OSC.
// From https://github.com/tado/ofxTidalCycles

var addr = NetAddr.new("127.0.0.1", 3333);
OSCFunc({ |msg, time, tidalAddr|
	var latency = time - Main.elapsedTime;
	msg = msg ++ ["time", time, "latency", latency];
	msg.postln;
	addr.sendBundle(latency, msg)
}, '/play2').fix;

// Start SuperDirt environment for Tidalcycles
SuperDirt.start

// initialise midi client
// eval each line by itself
// more info here:
// https://tidalcycles.org/index.php/SuperDirt_MIDI_Tutorial

MIDIClient.init;

~midiOut = MIDIOut.newByName("IAC Driver", "Bus 1");

~dirt.soundLibrary.addMIDI(\midi, ~midiOut);
