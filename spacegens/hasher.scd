(
/*
# <http://sctweets.tumblr.com/post/27479268011/hasher>


      Hasher

Never used this one before. Apparently is for mapping an input value to
a random value, so when you send the same value, you get the same random
value. I used this to map an LFNoise0, cause I would have needed more
characters to use another UGen and Latch. Constantly changing UGens gave
me a lot of noise, so that’s why I used a step noise. Now, the hasher
gives a different melody than the normal LFNoise, with the rounding and
the random mapping, seems like the base note comes more often. Also the
whole scale isn’t used for some reason, but I kind of like the melody it
created.

play{GVerb.ar(SinOsc.ar(Select.kr(Hasher.kr(Duty.kr((1..4)/4,0,Dwhite(0,1)))*5,midicps([0,3,5,7,10]+60))).sum,200,3)/20}

*/
SynthDef(\hasher, {
	var sig;
	sig = GVerb.ar(SinOsc.ar(Select.kr(Hasher.kr(Duty.kr((1..4)/4,0,Dwhite(0,1)))*5,midicps([0,3,5,7,10]+60))).sum,200,3)/20;
	Out.ar(\out.ir(0), sig);
}).add;
)
x = Synth(\hasher);
x.free;
