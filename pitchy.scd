
(
SynthDef(\pitchy, {arg ratio = 1, grainSize = 0.2;
	var son = SoundIn.ar;
	var result = PitchShift.ar(son, grainSize, ratio);
	Out.ar(\out.ir(0), result!2);
}).add;
)
