(
z = SynthDef(\tank_rvb, {
	var local, in_sig, amp;

	in_sig = SoundIn.ar([1,2]);

	amp = Amplitude.kr(Mix.ar(in_sig));
	in_sig = in_sig * (amp > \in_gate.kr(0.04)); // noise gate

	in_sig = in_sig * 0.4;

	local = LocalIn.ar(2) * \feedback.kr(0.5);

	local = OnePole.ar(local, \coef.kr(0.5));

	local = Rotate2.ar(local[0], local[1], 0.237);
	local = AllpassN.ar(local, 0.05, {Rand(0.01,0.05)}.dup, 2);

	local = DelayN.ar(local, 0.3, {Rand(0.15,0.33)}.dup);
	local = AllpassN.ar(local, 0.05, {Rand(0.03,0.15)}.dup, 2);

	local = LeakDC.ar(local);
	local = local + in_sig;

	4.do {
		var t;
		t = {Rand(0.005,0.02)}.dup;
		local = AllpassN.ar(local, t, t, 1);
	};

	LocalOut.ar(local);

	Out.ar(\out.ir(0), local);
}).add;
)

x = Synth(\tank_rvb)
x.free
