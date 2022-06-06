(
/*
 <http://sctweets.tumblr.com/post/14135841546/lastvalue>


      LastValue

I’m probably not using this UGen in a very good way, but anyway I liked
the results, so… I can imagine using *LastValue* with a controller or a
kind of amplitude trigger. I am using it here to analyze an *LFNoise0*.
I put the threshold bigger than the round factor, cause that way I get
less changes, and using the same number as threshold and round factor
would probably have the same effect as just using round. So now 4
different voices move around 50 and 300 Hz in 50Hz steps, but the rhythm
is much interesting with the filtering done by the LastValue threshold,
also ensuring me that the jumps will be of 100Hz or more.

play{Splay.ar(SinOsc.ar(LastValue.kr(LFNoise0.kr(3!4,250,220),200).round(50)*LFPar.kr((1..4)/8,0,{0.02.rand}!4,1),0,1/2))}

*/
SynthDef(\last_value, {
	var sig = Splay.ar(
		SinOsc.ar(
			LastValue.kr(
				LFNoise0.kr(3!4,250,220),
				200).round(50)
			* LFPar.kr((1..4)/8, 0,{0.02.rand}!4,1),
			0,1/2));
	Out.ar(\out.ir(0), sig);
}).add;

)

x = Synth(\last_value)
x.free