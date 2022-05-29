(
SynthDef(\blippy, { | freq = 440, amp = 0.1, nharms = 10, pan = 0, gate = 1 |
    var audio = Blip.ar(freq, nharms, amp);
    var env = Linen.kr(gate, doneAction: 2);
	OffsetOut.ar(\out.ir(0), Pan2.ar(audio, pan, env) );
}).add;
)
