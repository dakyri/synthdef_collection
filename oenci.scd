(

Ndef(\oenci, {
	var seed = thisThread.randSeed = 100000000.rand.debug('seed');
	var tempo = 156/60;
	var freq = [20, 7200];
	var atk = 0.1;
	var decay = (tempo.reciprocal / 1.5); // 0.3
	var bands = [32, 32];
	var sorted = 0.5.coin.debug('sorted');
	var sig = Klank.ar(
		{ `[Array.exprand(bands[1], freq[0], freq[1]),
			Array.exprand(bands[1], 0.1, 1),
			Array.exprand(bands[1], 0.1, 1)] } ! 2,
		{ BPF.ar(
			SelectX.ar(
				SinOsc.kr(
					tempo / Lag.kr(Duty.kr(
						tempo.reciprocal * Drand((16,20..48), inf),
						0, Drand((10,12..24), inf)
					)) * LFNoise2.kr(tempo/16, 0.2.rrand(0.4).debug('es'), 1),
					Lag.kr(Duty.kr(
						tempo.reciprocal * Drand((1,4..48), inf),
						0, Drand((0..10).linlin(0,10,0,2*pi),inf)
					)) // not sure
				).range(-0.5,5.5),
				[ // perc
					BrownNoise.ar(LFNoise2.kr(0.1.exprand(1)).range(0.3,0.75)),
					WhiteNoise.ar(LFNoise2.kr(0.1.exprand(1)).range(0.3,0.75)),
					PinkNoise.ar(LFNoise2.kr(0.1.exprand(1)).range(0.3,0.75)),
				].addAll({ // noises
					var i = 1;
					[LFSaw,LFPulse,Saw,Pulse].choose.ar(
						{ [LFNoise2,LFNoise0].choose.kr( 0.1.exprand(10) ! i).exprange(freq[0], freq[1]) } ! i,
						mul: { [LFNoise2,LFNoise0].choose.kr(0.1.exprand(10)).range(0.5,0.9) } ! i
					).mean
				} ! 3).perform(sorted.if({\value},{\scramble}))
			),
			Array.exprand(bands[0], freq[0], freq[1]).perform(sorted.if({\sort},{\scramble}))
			* LFNoise2.kr(tempo, 0.03, 1)
			* Duty.kr(tempo.reciprocal * 4, 0, Drand([-1,0,1,2], inf).midiratio),
			LFNoise2.kr(tempo/4, 0.5, 1),
			Lag.kr(
				Decay.kr(
					Impulse.kr(
						({ tempo / Array.geom(8, 0.25, 2).choose } ! bands[0]).perform(sorted.if({\sort},{\scramble})),
						0, { LFNoise2.kr(0.1.exprand(1)).range(0.3,0.1) } ! bands[0]
					), // Duty??
					Array.rand(bands[0], 0.01, decay).perform(sorted.if({\sort},{\scramble})).reverse
				),
				Array.rand(bands[0], 0.01, atk).perform(sorted.if({\sort},{\scramble})).reverse
			)
		).mean } ! 2,
		{ LFNoise2.kr(0.1.exprand(1), 0.1, 1) } ! 2,
		{ LFNoise2.kr(0.1.exprand(1)).exprange(0.1,40) } ! 2,
		{ LFNoise2.kr(0.1.exprand(1)).range(0.5,1.5) } ! 2
	);
	sig = Rotate2.ar(
		sig[0], sig[1],
		LFSaw.kr(
			Lag.kr(
				Duty.kr(Drand([2,4,8],inf), 0, Drand([-1,1,0],inf))
				* LFNoise2.kr(tempo/12).exprange(pi/8, 2*pi),
				LFNoise2.kr(tempo/24).range(1,8)
			)
		)
	);
	Limiter.ar(BhobHiShelf.ar(BhobLoShelf.ar(sig, 10, -20.dbamp), LFNoise2.kr(0.1.exprand(1)).exprange(15000,19000), -10.dbamp) * 0.8);
}).play
)