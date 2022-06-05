(
//--------------------------powerful reverbed mettallic random sound
SynthDef(\metal_rand, {
	var mix, sig, n=8;
	r = LFNoise0.kr(rrand(0.2,1.0), 1,1).squared * \noise_gain.kr(0.5);
	mix = Klank.ar(
		`[ // note the back quote makes this array a ref, and so stops multi chan expansion
			Array.fill(n, { exprand(1.0,20.0) }),
			nil,
			Array.fill(n, { 0.2.rand })
		],
		Blip.ar(r, [rrand(2,5),rrand(2,5)], 0.1)
	).fold2(0.2).cubed * 12;
	mix = Mix.arFill(3, { CombL.ar(mix, 0.1, 0.03.linrand, 4.0.linrand) });
	sig = mix.distort * 0.5;
	6.do({
		sig = AllpassN.ar(sig, 0.05, [0.05.rand, 0.05.rand], 3)
	});
	sig = LeakDC.ar(sig);
	Out.ar(\out.ir(0), sig);
}).add;
)

x = Synth(\metal_rand);
x.set(\noise_gain, 0.3)