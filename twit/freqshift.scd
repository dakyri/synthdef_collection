(
/*
# <http://sctweets.tumblr.com/post/18024883685/freqshift>


      FreqShift

This one I never used. Makes some funny stuff though. Maybe not as
useful (for me) as PitchShift, but I can think of a quite nice effects
with this. This time I decided to trigger a *Blip* every 4 seconds and
make a feedback loop in the synth, changing the parameter of *FreqShift*
also every 4 seconds. The result is sometimes a nice deep bassy drone
and something a rising tone. It’s also nice making the *Blip* note a
little bit longer and maybe with less harmonics, so it’s deeper and has
a different quality.

play{a=Blip.ar(60,4,LFGauss.ar(4,1/8));a=a/4+LocalIn.ar(2);a=FreqShift.ar(a,LFNoise0.kr(1/4,90));LocalOut.ar(DelayC.ar(a,1,0.1,0.9));a}


*/
SynthDef(\freq_shift, {
	a= Blip.ar(60, 4, LFGauss.ar(4,1/8));
	a= a/4 + LocalIn.ar(2);
	a= FreqShift.ar(a, LFNoise0.kr(1/4, 90));
	LocalOut.ar(DelayC.ar(a, 1, 0.1, 0.9));
	Out.ar(\out.ir(0), a);
}).add;
)

x = Synth(\freq_shift);
x.free;