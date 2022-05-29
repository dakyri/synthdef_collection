
(
SynthDef(\acid, { | freq = 1000, gate = 1, pan = 0, cut = 4000, rez = 0.8, amp = 1, atk=0|
	Out.ar(\out.ir(0),
        Pan2.ar(
            RLPF.ar(
                Pulse.ar(freq, 0.05),
            cut, rez),
        pan) * EnvGen.kr( Env.adsr(atk, 0, 0.8, 0.4, 1, -4), gate, gate, amp, doneAction:2);
    )
}).add;
)
