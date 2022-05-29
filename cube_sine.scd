(
SynthDef(\cube_sine, { arg freq=70, atk=0.1, amp = 0.1, pbend=0, gate=1;
var env;

	env = EnvGen.kr( Env.adsr(atk, 0, 0.8, 0.4, 1, -4), gate, doneAction: 2 );
	a = SinOsc.ar({freq+pbend}, 0).cubed.cubed;
	Out.ar(\out.ir(0), Pan2.ar(a*env, 0, amp));
}).add
)