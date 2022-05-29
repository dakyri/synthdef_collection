(
// a random experiment with the gendy (xenakis) synth and mouse
SynthDef(\xendy, {
	var n = 50; //try changing me to 34, or 3, and then re-running...
	var sig = Resonz.ar(
		Mix.fill(n,{
			var freq=rrand(50,560.3);
			var numcps= rrand(2,20);
			Pan2.ar(
				Gendy1.ar(
					6.rand,6.rand,1.0.rand,1.0.rand,
					freq, freq,
					1.0.rand, 1.0.rand, numcps,
					SinOsc.kr(
						exprand(0.02,0.2), 0, numcps/2, numcps/2),
					0.5/(n.sqrt)), 1.0.rand2)
		}),
		MouseX.kr(100,2000),
		MouseY.kr(0.01,1.0)
	);
	Out.ar(\out.ir(0), sig);
}).add;
)

