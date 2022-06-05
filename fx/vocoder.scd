(
// rq -> range 1..0.005, exponential, dflt 1
// bands -> range 1..50, linear, dflt 30
// lowband, highband -> range 20..20000, dflt 440
SynthDef(\vocoder, {
	var	sig, centerFreqs, splitFilt, amp;
	var	sig2, inSplit;
	var bands = \bands.kr(30);
	var lowBand = \lowBand.kr(440);
	var hiBand = \hiBand.kr(440);
	// analysis phase:
	// when bandwidth is small, need higher amplitude
	sig = In.ar(\vocbus.ir(0), 1) / \rq.kr(1);
	centerFreqs = Array.series(bands, lowBand, (hiBand - lowBand) / (bands-1));
	splitFilt = BPF.ar(sig, centerFreqs, rq);
	amp = Amplitude.ar(splitFilt);
	// resynthesis phase:
	sig2 = In.ar(\inbus.ir(1), 1);
	inSplit = BPF.ar(sig2, centerFreqs, rq);
	Out(\out.ir(0), Mix.ar(inSplit * amp))
}).add;
)
