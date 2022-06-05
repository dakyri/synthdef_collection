(
SynthDef(\spring, { |freq = 400, out = 0, pan = 0, gate = 1, dur = 0.15, curve = -4, amp = 1, index = 1|
	var sig = FreeVerb.ar(Pan2.ar(Blip.ar(freq, index), pan));
	var env = EnvGen.ar(Env.perc(0.01, dur, amp, curve), gate, doneAction:2);
	Out.ar(0, sig * env);
}).add;
)

TempoClock.default.tempo = 156/60;  // too fast for the Pbind below

(  // melodic 70s kind of feel
Pbind(*[
	instrument: \spring,
	dur: Pseq([4, 1, 2, 1, 1, 1].scramble/ 4 / TempoClock.default.tempo, inf),
	degree: Pseq(#[1,2,3,4], inf) * Pkey(\dur).reciprocal,
	octave: Pseq([2,3,4,4,4,3].scramble, inf),
	pan: Pxrand(Array.fill(100, { 0.gaussian(1).clip2(1) }), inf),
	amp: Pseq(#[0.95,1,0.8],inf),
	index: Pstutter(Pseq(#[4,8,12],inf), Pseq([2,3,4,5,6,8].scramble, inf))
]).play;
)
