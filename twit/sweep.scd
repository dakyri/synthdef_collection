(
/*
# <http://sctweets.tumblr.com/post/13823869653/sweep>


      Sweep

So, this is kind of nice, it’s a resetable ramp, like *Phasor* but much
easier to understand ;) First thing that came to my mind testing around
was like a sports car / bike shifting gears. So yo dawg, I put 6 of them
(you can make more or less) with  the good old *Gendy* generator, and
some panning to make it more exciting…

play{a=0;6.do{x=Sweep.ar(Dust2.kr(0.1+2.0.rand),9.rand+9)+LFNoise1.kr(0.1,60,80);a=a+Pan2.ar(Gendy1.ar(1,1,1,1,x,x+9),LFNoise2.kr(1))};a}

*/
SynthDef(\sweep, {
	a=0;
	6.do{
		x=Sweep.ar(Dust2.kr(0.1+2.0.rand),
			9.rand+9)
		+LFNoise1.kr(0.1,60,80);
		a=a+Pan2.ar(
			Gendy1.ar(1,1,1,1,x,x+9),
			LFNoise2.kr(1))
	};
	Out.ar(\out.ir(0), a);

}).add;

)
x = Synth(\sweep);