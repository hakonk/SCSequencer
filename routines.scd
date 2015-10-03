// assign multiple values to multiple synth parameters by using an immutable array and a corresponding Ptuple

~bassBind = Pbind(*[
	instrument: \sineBassDrum,
	#[attackTime, freq], Ptuple([
		Pseq([0.01, 0.05, 0.01], 1),
		Pseq([50, 70, 100], 1)
	])
]);

~bassBind.play;

// using the event stream
~bassRoutine = ~bassBind.asStream;
~bassRoutine.next(());