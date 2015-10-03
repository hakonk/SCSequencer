/**
* A synthdef using pink noise for lo fi hihat sounds, envelope is percussive, also has an envelope for the band pass filter (needs tweaking).
*/
SynthDef(\noiseHat, {
	arg attackTime = 0.1, releaseTime = 0.2, level = 0.3, effectBus, outBus = 0;
	var env = EnvGen.ar(Env.perc(attackTime, releaseTime, level), doneAction: 2);
	var filterMod = EnvGen.ar(Env.perc(attackTime, releaseTime / 2, level: 1000));
	var source = BPF.ar(PinkNoise.ar * env, filterMod, 5);
	Out.ar(outBus, source);
}).add;
/**
* A synthdef for lo fi bass drum sounds. Using a distorted sine wave with a percussive temporal envelope.
*/
SynthDef(\sineBassDrum, {
	arg attackTime = 0.1, releaseTime = 0.2, level = 0.3, effectBus, outBus = 0, freq = 50;
	var env = EnvGen.ar(Env.perc(attackTime, releaseTime, level), doneAction: 2);
	var source = SinOsc.ar(freq).distort * env;
	Out.ar(outBus, source ! 2);
}).add;

// test sine bass drum
Synth(\sineBassDrum, [\releaseTime, 0.2, \attackTime, 0.01, \freq, 75]);

// test noiseHat synth
Synth(\noiseHat, [\attackTime, 0.5]);