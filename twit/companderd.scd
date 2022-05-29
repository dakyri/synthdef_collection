(
/*
 # <http://sctweets.tumblr.com/post/27398203531/companderd>

     CompanderD

I’ve used Compander quite often, but never saw this CompanderD. Is
actually very useful for tweets, because it uses the input signal also
as process signal, which is what I do all the time. It adds a delay to
the input signal, but I would have to test this out how it differs from
the normal Compander setup with my usual sounds. So, for the tweet, just
a ultra compressed and filtered brown noise, which reminded me of a
microphone in a very windy environment :)

play{LeakDC.ar(CompanderD.ar(LPF.ar(Normalizer.ar(CompanderD.ar(BrownNoise.ar!2,0.1,0.1,4)),LFDNoise3.kr(8,90,150)),0.1,1,0.5))}//

*/
SynthDef(\compander_d, {
	var sig = LeakDC.ar(
		CompanderD.ar(
			LPF.ar(
				Normalizer.ar(
					CompanderD.ar(
						BrownNoise.ar!2,0.1,0.1,4)),
				LFDNoise3.kr(8,90,150)),
			0.1,1,0.5));
	Out.ar(\out.ir(0), sig);
}).add;
)
x = Synth(\compander_d)
x.free