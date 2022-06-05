(
SynthDef(\kalimba_pulse, {
//----------------------mallet / kalimba type sound
	var exc, amp, harm;
	amp = LFPulse.kr(4,0,0.1,0.002);
	exc = LPZ1.ar(GrayNoise.ar([amp,amp]));
	harm = `[FloatArray.fill(4, { rrand(80.0,400.0) }),
		nil,
		FloatArray[1, 1, 1, 1]];
	Out.ar(\out.ir(0), Klank.ar(harm, exc));
}).add;
)
x = Synth(\kalimba_pulse)