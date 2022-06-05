(
SynthDef(\metal_arp, {
	var exc, amp, sig;
	amp = LFPulse.kr(\rate.kr(8), 0, 0.1, 0.002);
	exc = LPZ1.ar(GrayNoise.ar([amp,amp]));
	sig = Klank.ar(`[FloatArray.fill(4, { rrand(80.0, 400.0) }),
		nil,
		FloatArray[1, 1, 1, 1]], exc).abs;
	Out.ar(\out.ir(0), sig)
}).add;
)
x = Synth(\metal_arp)
x.set(\rate, 5)
x.free