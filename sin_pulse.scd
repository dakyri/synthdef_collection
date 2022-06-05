(
SynthDef(\sin_pulse, {
	var trig, rate, x;
	rate = LinExp.kr(\tr_rate.kr(0.5), 0, 1, 1, 200);//MouseX.kr(1, 200, 1);
	trig = Impulse.ar(rate);
	x = Phasor.ar(trig, rate / SampleRate.ir, 0, 1, [0, \rst_pos.kr(0)]);
	Out.ar(\out.ir(0), SinOsc.ar(x * 500 + 500, 0, 0.2));
}).add;
)
x = Synth(\sin_pulse)
x.set(\rst_pos, 0.5)
x.set(\tr_rate, 0.99)