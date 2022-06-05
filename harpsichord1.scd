(
SynthDef(\harpsichord1, { arg freq = 440, amp = 0.1, pan = 0;
    var env, snd;
	env = Env.perc(level: amp).kr(doneAction: 2);
	snd = Pulse.ar(freq, 0.25, 0.75);
	snd = snd * env;
	Out.ar(\out.ir(0), Pan2.ar(snd, pan));
}).add;
)


(
// LFO defined as Function

f = { |x| (x * 2).sin * 3 + (x * 0.3).sin };

p = Pbind(
	\instrument, \harpsichord1,
    \dev, Ptime().collect(f), // current time passed to function
    \midinote, Pkey(\dev) + 60 + [0, 4],
    \amp, 0.05,
    \dur, 0.15
).play;
)