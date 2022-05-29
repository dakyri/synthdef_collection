(
SynthDef(\var_duty_saw, { arg bpmSaw=3, bpmCycle=2, freq1=100, freq2=50, atk=0.1, gate=1, amp=0.1, pbend=0, phase=0;
	var  lfo, env;
	lfo = 1/bpmCycle;		// freq of the modulating SinOsc  i.e 1/16, or 1/8 etc
	a = VarSaw.ar(
		LFPulse.kr(bpmSaw, phase, 0.3, {freq1+pbend}, {freq2+(pbend/2)}),
		0,
		SinOsc.kr(lfo).range(0,1), //width
		amp);
	env = EnvGen.kr( Env.adsr(atk, 0, 1, 0.1, 1.0), gate, doneAction: 2 );
	Out.ar(\out.ir(0), Pan2.ar(a*env, 0));
}).add;
)
