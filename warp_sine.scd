(
SynthDef(\warp_sine, { arg freq=70, atk=0.1, amp = 0.1, pbend=0, gate=1, bpmSaw=1, bpmCycle=0;
var env;

	env = EnvGen.kr( Env.adsr(atk, 0, 0.8, 0.3, 1, -4), gate, doneAction: 2 );
	// original values bpmsaw/cycle- Line.kr(1,0,0.5). reverse them to get reverse effect i.e.  (0,1,0.5)
	//a = FSinOsc.ar(freq).fold2(Line.kr(1,0,1));

	a = SinOsc.ar({freq+pbend}).fold2(Line.kr(bpmSaw,bpmCycle,1));
	Out.ar(\out.ir(0), Pan2.ar(a*env, 0, amp));
}).add;
)