(
SynthDef(\dubstep_bass, { arg freq=80, gate=1, atk=0.1, amp=0.2, pbend=0, bpmSaw=3, bpmCycle=3;
	var bass, env, sweep, sweepArr, trig, tempo, rate;
	var fx1, fx2, fx3;

	// fxIndx is an index for choosing the highfilter :
	// (a), sweep (b), or decimate (c). 0=none, 1=a, 2=b, c=3, ab=4, ac=5, abc=6, bc=7
	//  bpmSaw is the 'wobble rate' for the basic synth here
	// bpmCycle is the cycle repeat time for the sweeping filter effect

	tempo = 80;
	rate = tempo/120;
	trig = Impulse.kr(rate); // set up the trigger for the Select() on fx selection test

	sweep = LFSaw.ar(bpmCycle).exprange(40, 5000); // rate for the sweeping filter

	bass = LFSaw.ar({freq+pbend} * [0.99, 1, 1.01]).sum;
	bass = LPF.ar(bass, sweep);
	//bass = Normalizer.ar(bass);
	bass = bass + BPF.ar(bass, 2000, 2);

	bass = (bass * 5).tanh;
	// son = son + GVerb.ar(son, 10, 0.1, 0.7, mul: 0.3);
	bass.dup;

	env = EnvGen.kr( Env.adsr(atk, 0, 0.8, 3, 1, -4), gate, doneAction: 2 );

	Out.ar(\out.ir(0), Pan2.ar(bass*env, 0, amp));
}).add;
)
