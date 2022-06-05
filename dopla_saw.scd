(
SynthDef(\dopla_saw, {
	var x, y, distance, velocity, pitchRatio, amplitude, motorSound, sig, panValue, azimuth;
	// object travels 200 meters in 6 secs (=120kph) passing 10 meters
	// from the listener
	x = 10;
	y = LFSaw.kr(1/LinLin.kr(\period.kr(0.5), 0, 1, 1, 12), 0, 100);
	distance = hypot(x, y);
	amplitude = 40 / distance.squared;
	motorSound = RLPF.ar(FSinOsc.ar(200, 0, LFPulse.ar(31.3, 0, 0.4)), 400, 0.3);
	sig = DelayL.ar(motorSound, 110/344, distance/344);

	azimuth = atan2(y, x); // azimuth in radians
	panValue = (azimuth / 0.5pi).clip2(1); // make a value for Pan2 from azimuth

	Out.ar(\out.ir(0), Pan2.ar(sig, panValue, amplitude));
}).add;
)
x = Synth(\dopla_saw)
x.set(\period, 0.2)
x.free