(
SynthDef(\berlinb, { arg freq = 80, amp = 0.01, pan=0, gate=1;
    var synth, env;
    env = Decay2.kr(gate, 0.05, 8, 0.0003);
    synth = RLPF.ar(
        LFPulse.ar(freq, 0, SinOsc.kr(0.12, [0, 0.5pi], 0.48, 0.5)),
        freq * SinOsc.kr(0.21, 0, 18, 20),
        0.07
    );
    #a, b = synth*env;
    DetectSilence.ar(a, 0.1, doneAction: 2);
	Out.ar(\out.ir(0), amp * Mix.ar(PanAz.ar(4, [a, b], [pan, pan+1])));
}).add;
)
