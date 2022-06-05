(			// star trek ish ... metal mallet and trippy panning stereo
{
	LPF.ar(
		DynKlank.ar(
			`[[900, 971, 1153, 1823, 1401], nil, [
				SinOsc.kr(0.2).range(0.1,1),
				SinOsc.kr(0.6).range(0.1,1),
				SinOsc.kr(0.8).range(0.1,1),
				SinOsc.kr(1.2).range(0.1,1),
				SinOsc.kr(2).range(0.1,1)]
			],
			Limiter.ar(Dust.ar(2, 0.65) + Impulse.ar(1,0,0.9))
		)
	) ! 2
}.play;

// nice trippy stereo below


{
	Pan2.ar(
		DynKlank.ar(
			`[[800, 1071, 1353, 723 + SinOsc.ar(SinOsc.ar(0.2).range(0, 10)).range(0,330)],
				nil,
				[1, 1, 0.5, 1]],
			PinkNoise.ar(0.007)),
		TRand.kr(-1, 1, trig: Pulse.ar(6))
	)
}.play;
)
