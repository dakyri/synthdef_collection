(
SynthDef(\bowed_pad, {
	// bowed string
	var root, scale, oct;
	var harm, sig, exc, freq;
	root = \key.kr(5);
	scale = #[0,2,4,5,7,9,11];
	oct = #[24,36,48,60,72,84];
	freq = (scale.choose + oct.choose + root).midicps;
	exc = BrownNoise.ar([0.007,0.007]) * max(0, LFNoise1.kr(exprand(0.125,0.5), 0.6, 0.4));
	harm = `[
		Array.series(12, freq, freq),
		Array.geom(12,1,rrand(0.7,0.9)),
		Array.fill(12, {rrand(1.0,3.0)})
	];
	// output the bits related to timbre if we randomly generate something cool
	harm[1].postln;
	harm[2].postln;
	sig = (Klank.ar(harm, exc) * \gain.kr(0.4)).softclip;
	Out.ar(\out.ir(0), sig);
}).add;
)
x = Synth(\bowed_pad)
x.set(\gain, 0.3)