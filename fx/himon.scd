(
SynthDef(\himon, {
	Out.ar(\out.ir(0), HPF.ar(In.ar(\in.ir(0), 2),1000)*4);
}).add;
)