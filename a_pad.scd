(
SynthDef(\a_pad, { arg freq=2000, gate=1, atk=0.1, amp=0.2, pbend=0;
	var klank, n, harm, amps, ring, env;
	n = 9;

	// harmonics
	harm = Control.names([\harm]).ir(Array.series(4,1,1));
	// amplitudes
	amps = Control.names([\amps]).ir(Array.fill(4, 0.32));
	// ring times
	ring = Control.names([\ring]).ir(Array.fill(4,1));

	klank = Klank.ar(`[harm,amps,ring], {ClipNoise.ar(0.01)}.dup, {freq+pbend});
	env = EnvGen.kr( Env.adsr(atk, 0, 0.8, 3, 1, -4), gate, doneAction: 2 );

	Out.ar(\out.ir(0), klank*env*amp);
}).add;
)
