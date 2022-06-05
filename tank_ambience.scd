(
SynthDef(\tank_ambience, {
	var local, in;

	in = Mix.fill(8, {
		Pan2.ar(
			Decay2.ar(Dust.ar(0.02), 0.1, 0.5, 0.1) * FSinOsc.ar(ExpRand(300,2200)).cubed,
			Rand(-1,1))
	});
	in = in + Pan2.ar(Decay2.ar(Dust.ar(0.01), 0.04, 0.3) * BrownNoise.ar,
0);

	4.do { in = AllpassN.ar(in, 0.03, {Rand(0.005,0.02)}.dup, 1); };

	local = LocalIn.ar(2) * 0.98;
	local = OnePole.ar(local, 0.33);

	local = Rotate2.ar(local[0], local[1], 0.23);
	local = AllpassN.ar(local, 0.05, {Rand(0.01,0.05)}.dup, 2);

	local = DelayN.ar(local, 0.3, [0.17,0.23]);
	AllpassN.ar(local, 0.05, {Rand(0.03,0.15)}.dup, 2);

	local = LeakDC.ar(local);
	local = local + in;

	LocalOut.ar(local);

	Out.ar(\out.ir(0), local);
}).add;
)
