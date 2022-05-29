(
SynthDef(\golden, { |freq=20, gate=1, atk=0.1|
	var phi, a=freq, env;
	var out_sig = 0;
	phi= (1 + (5.sqrt)) / 2;
	7.do({
		var sig = Pan2.ar(SinOsc.ar(a, rrand(0,1)), SinOsc.kr(rrand(0,3)), 0.023);
		a=a*phi;
		out_sig = out_sig + sig;
	});
	env =  EnvGen.kr( Env.adsr(atk, 0, 0.8, 3, 1, -4), gate, doneAction: 2 );
	Out.ar(\out.ir(0), out_sig * env);
}).add;
)
