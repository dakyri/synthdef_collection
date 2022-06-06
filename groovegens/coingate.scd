(
/*
# <http://sctweets.tumblr.com/post/27397544499/coingate>


      CoinGate

This one is really cool for filtering triggers. Specially if you have a
rythmic trigger (like an Impulse, you can make some fun rhythms. I put a
feedback onto it so the created rhythm from the CoinGate and Impulse
repeats at least once. The feedback changes the delay time which adds
more complexity to the rhythm. You could expand this into a really cool
rhythm generator, but I’m quite happy with the results. Ah, better to
hear with a sub or headphones, don’t try to use your laptop speakers, it
won’t sounds as good.

play{l=LocalIn.ar(2)+Decay.ar(CoinGate.ar(0.3,Impulse.ar(8)));l=BPF.ar(l,99,2);LocalOut.ar(DelayN.ar(l,1,LFPulse.kr(1/4,1/4,1/2)));l}

*/
SynthDef(\coin_gate, {
	l=LocalIn.ar(2)+Decay.ar(
		CoinGate.ar(0.3,Impulse.ar(8)));
	l=BPF.ar(l,99,2);
	LocalOut.ar(DelayN.ar(l,1,LFPulse.kr(1/4,1/4,1/2)));
	Out.ar(\out.ir(0), l);
}).add;

)
x = Synth(\coin_gate);
x.free