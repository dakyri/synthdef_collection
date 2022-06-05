(
SynthDef(\bata_bot, {
	var trig, seq;
	trig = Impulse.kr(\trig_rate.kr(8));
	seq = Drand([
		Dseq([4,0,0,1,2,1,0,1]),
		Dseq([4,0,2,0,1,0,1,1]),
		Dseq([4,0,0,2,0,0,1,1]),
		Dseq([4,0,1,2,0,1,2,0]),
		Dseq([4,1,1,1,2,2,3,3]),
		Dseq([4,1,0,1,0,1,0,1])
	], 1/0);

	trig = Demand.kr(trig, 0, seq * 0.4)* trig;
	Out.ar(
		\out.ir(0),
		Pan2.ar(
			{LPF.ar(PinkNoise.ar, 5000)} * Decay.kr(trig, \decay.kr(0.5)),
			TRand.kr(-1, 1, Pulse.kr(\pan_rate.kr(2))).lag(\lag_rate.kr(0.3))));
}).add;
)
x.free
x = Synth(\bata_bot)
x.set(\pan_rate, 3)
