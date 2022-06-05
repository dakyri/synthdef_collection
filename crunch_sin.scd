(
SynthDef(\crunch_sin, {
	var sig;
	sig = FSinOsc.ar(\freq.kr(80)).fold2(Line.kr(1,0,0.5, doneAction:2));
	Out.ar(\out.ir(0), sig);
}).add;
)
x = Synth(\crunch_sin, [\freq, 610])
x.free