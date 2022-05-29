(
SynthDef(\decimator, {
	Out.ar(\out.ir(0), In.ar(\in.ir(0),2).round(0.1));
}).add;
)
