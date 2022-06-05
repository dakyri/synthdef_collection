(
// modal space - jmc
// mouse x controls discrete pitch in dorian mode

SynthDef(\space_drone69, {
	var scale = FloatArray[0, 2, 3, 5, 7, 9, 10];
	var buffer = Buffer.alloc(s, scale.size, 1, {|b| b.setnMsg(0, scale) });
	var mix;

	// lead tone
	mix = SinOsc.ar((
		DegreeToKey.kr(
			buffer.bufnum,
			\deg.kr(0, \deglag.kr(1)) * 15,
			12,					// 12 notes per octave
			1,					// mul = 1
			72					// offset by 72 notes
		)
		+ LFNoise1.kr([3,3], 0.04)	// add some low freq stereo detuning
	).midicps, 0, 0.1)
	+ RLPF.ar(LFPulse.ar([48,55].midicps, 0.15),  /* drone 5ths */
		SinOsc.kr(0.1, 0, 10, 72).midicps, 0.1, 0.1);
	// add some 70's euro-space-rock echo
	Out.ar(\out.ir(0), CombN.ar(mix, 0.31, 0.31, 2, 1, mix))
}).add;
)


~spacey = Synth(\space_drone69);
~lfo1Bus = Bus.control(s, 1);
~spacey.map(\deg, ~lfo1Bus);
SynthDef(\lfo1, { Out.kr(~lfo1Bus, PinkNoise.kr(0.7, 0.4)); }).add;
~lfo1 = Synth(\lfo1);
~spacey.set(\deglag, 6)
~lfo1Bus.scope
~lfo1.free


e = Env([0, 10, 5, 15, 0], [4,2, 3, 5], \sin);
e = Env([0, 10, 0], [1,1], \sin)
e.plot
x = Synth(\space_drone69)
x.free
x.set(\deg, 0.5 )
x.set(\deglag, 10 )

s.reboot