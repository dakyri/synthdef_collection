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

(
s.sendBundle(nil,
	["/s_new", \a_pad, 2000, 1, 0, \freq, 80], // start note
	// set geometric series harmonics
	["/n_setn", 2000, \harm, 4] ++ Array.geom(4,1,1.61)
	);
)

s.sendMsg("/n_free", 2000);

(
// set harmonics, ring times and amplitudes
s.sendBundle(nil,
	["/s_new", \a_pad, 2000, 1, 0, \freq, 80], // start note
	["/n_setn", 2000, \harm, 4, 1, 3, 5, 7, 8], // set odd harmonics
	["/n_setn", 2000, \ring, 4] ++ Array.fill(4,0.9), // set shorter ring time
	["/n_setn", 2000, \amp, 4] ++ Array.fill(4,0.2) // set louder amps
	);
)

s.sendMsg(\n_trace, 2000);
s.sendMsg(\n_free, 2000);

(
// same effect as above, but packed into one n_setn command
s.sendBundle(nil,
	["/s_new", \a_pad, 2000, 1, 0, \i_freq, 500], // start note
	["/n_setn", 2000, \harm, 4, 1, 3, 5, 7,
		\ring, 4] ++ Array.fill(4,0.1)
		++ [\amp, 4] ++ Array.fill(4,0.2)
	);
)

s.sendMsg(\n_trace, 2000);
s.sendMsg(\n_free, 2000);
