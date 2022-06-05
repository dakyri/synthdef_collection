(
SynthDef(\metal_beats, {
	// metallic random beats. every definition of the synthdef changes the tone
	// original is a 1 line play quickie
	var trig, p, exc, sig, harm;
	exc = BrownNoise.ar(
		Decay2.kr(
			Impulse.kr(
				Duty.kr(0.5, 0, Drand([1.5, 2, 1, 8, 16], inf)),
				// #[0.125,0.25,0.375,0.5,0.75,1,1.5,2].choose,
				0,
				[0.04,0.04]),
			0.005,
			0.05));
// randomly generate some resonators
	harm = `[Array.fill(16, {linrand(8000.0)+60}),
			nil,
			Array.fill(16, {rrand(0.1,2.0)})];
// and print these creation side values so we can maybe build up a catalogue of preset
	harm[0].postln;
	harm[2].postln;
	sig = (Klank.ar(harm, exc) * 0.1).softclip;
	Out.ar(\out.ir(0), sig);
}).add;
)
x = Synth(\metal_beats)
x.free
