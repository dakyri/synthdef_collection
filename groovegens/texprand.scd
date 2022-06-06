(
/*
# <http://sctweets.tumblr.com/post/27479741119/texprand>


      TExpRand

This one goes without explanation. Very useful when used triggered
events (in this case grains), so they tend to be in the lower part (more
bassy), so it’s just a steady rhythm with some breaks, and the grains
are determined by the TExpRand function. A little bit of reverb is
(almost) never bad… ;)

play{t=Impulse.ar(6)+Dust.ar(1);x=(TExpRand.ar(_,_,t));Limiter.ar(GVerb.ar(GrainFM.ar(2,t,x.(1e-4,0.01),f=x.(80,400),f/4,9),9,0.5))};

*/
SynthDef(\texprand, {
	var sig;
	t=Impulse.ar(6)+Dust.ar(1);
	x=(TExpRand.ar(_,_,t));
	sig = Limiter.ar(
		GVerb.ar(
			GrainFM.ar(2, t, x.(1e-4,0.01), f=x.(80,400), f/4,9),
			9,0.5));
	Out.ar(\out.ir(0), sig);
}).add;
)
x = Synth(\texprand);
x.free;