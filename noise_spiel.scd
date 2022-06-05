(
Ndef(\a, { Limiter.ar(GVerb.ar(SinOsc.ar(Ndef(\d), 0, Ndef(\b), Ndef(\c)) )) });
Ndef(\b, { LFDNoise0.ar(500)});
Ndef(\c, { LFDNoise1.ar(10)});
Ndef(\d, { LFDNoise3.ar(SinOsc.kr(3, 0, 1000, 300), 200, 200)});
Ndef(\a).play;
)

( // dry, mono
Ndef(\a, { Limiter.ar(SinOsc.ar(Ndef(\d), 0, Ndef(\b), Ndef(\c)) ) });
Ndef(\b, { LFDNoise0.ar(500)});
Ndef(\c, { LFDNoise1.ar(10)});
Ndef(\d, { LFDNoise3.ar(SinOsc.kr(3, 0, 1000, 300), 200, 200)});
Ndef(\a).play;
)
/*
Ndef registers synths by key. All accesses to the registered synths go through the Ndef class via that key. Registered synths can be replaced with other synths while playing. A synth and its replacement can automatically crossfade and the replacement time can be quantized.
*/