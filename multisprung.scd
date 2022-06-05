(
SynthDef(\multisprung, {
	var m0, m1, m2, m3, m4, d, k, t;
	var sig;
	k = LinExp.kr(\spring_const.kr(0.5), 0, 1, 0.5, 100); // spring constant
	d = LinExp.kr(\spring_damp.kr(0.5), 0, 1, 0.0001, 0.01); // damping
	t = Dust.ar(\trig_rate.kr(2));
	m0 = Spring.ar(ToggleFF.ar(t), 1 * k, 0.01);
	m1 = Spring.ar(m0, 0.5 * k, d);
	m2 = Spring.ar(m0, 0.6 * k, d);
	m3 = Spring.ar([m1,m2], 0.4 * k, d);
	m4 = Spring.ar(m3 - m1 + m2, 0.1 * k, d);
	sig = CombL.ar(t, 0.1, LinLin.ar(m4, -10, 10, 1/8000, 1/100), 12);
	Out.ar(\out.ir(0), sig);
}).add;
)

x = Synth(\multisprung)
x.free
x.set(\spring_const, 0)
x.set(\spring_damp, 0.4)
