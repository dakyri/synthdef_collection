(
SynthDef(\crickets, {
// ---------------quiet rhythmical electronic sound
// randomization is done at time of defining the synthdef in the server
	var s = Pan2.ar(
		HPZ1.ar(
			LFTri.ar(rrand(24, 128).midicps, 2pi.rand,
				Mix.ar(
					SinOsc.ar(exprand(0.3, 8) * [rrand(0.7, 1.3), 1],
						[2pi.rand, 2pi.rand],
						0.04)).max(0)
				* Mix.ar(SinOsc.ar(exprand(6,24) * [rrand(0.7, 1.3), 1],
					[2pi.rand,2pi.rand])).abs
	)), 1.0.rand2, 6);
	Out.ar(\out.ir(0), s);
}).add;
)
x = Synth(\crickets)
