
(
SynthDef(\harpsichord1, { arg freq = 440, amp = 0.1, pan = 0;
    var env, snd;
	env = Env.perc(level: amp).kr(doneAction: 2);
	snd = Pulse.ar(freq, 0.25, 0.75);
	snd = snd * env;
	Out.ar(\out.ir(0), Pan2.ar(snd, pan));
}).add;
)
