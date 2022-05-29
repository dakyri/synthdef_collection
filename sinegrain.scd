(
SynthDef(\sinegrain, { |freq = 440, amp = 0.2, sustain = 1|
    var sig, env;
	env = EnvGen.kr(Env.perc(0.01, sustain), doneAction: 2);
	sig = SinOsc.ar(freq, 0, amp) * env;
    Out.ar(0, sig ! 2);    // sig ! 2 is the same as [sig, sig]
}).add;
)
