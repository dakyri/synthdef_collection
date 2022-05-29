(
/*
# <http://sctweets.tumblr.com/post/13822611758/setresetff>
      SetResetFF

Like *ToggleFF*, *SetResetFF* gives me 0 and 1, but not from a single
trigger. It receiver a trigger for the ons, and a trigger for the offs,
so it’s kind of nice to combine this with regular triggers and random
triggers. In this case I used it with random triggers, sifferent
frequencies with some slow wandering, and a reverb.

play{GVerb.ar(Mix(9.collect{SetResetFF.ar(Dust.ar(8.rand+1),Dust.ar(8.rand+1)).lag*SinOsc.ar(LFNoise2.kr(0.1,25,exprand(40,1500)))/9}))}

*/
SynthDef(\setresetff, {
	var sig = GVerb.ar(
		Mix(
			9.collect {
				SetResetFF.ar(
					Dust.ar(8.rand+1),
					Dust.ar(8.rand+1)).lag
				*SinOsc.ar(LFNoise2.kr(0.1,25, exprand(40,1500)))/9
			}
		)
	);
	Out.ar(\out.ir(0), sig);
}).add;
)
x = Synth(\setresetff);
x.free;

play{GVerb.ar(Mix(9.collect{SetResetFF.ar(Dust.ar(8.rand+1),Dust.ar(8.rand+1)).lag*SinOsc.ar(LFNoise2.kr(0.1,25,exprand(40,1500)))/9}))}
