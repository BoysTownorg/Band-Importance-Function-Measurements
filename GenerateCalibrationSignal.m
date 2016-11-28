[S1  fs] = audioread('.\Sound Files\ieee\AW01.wav');
[S2  fs] = audioread('.\Sound Files\ieee\AW02.wav');
[S3  fs] = audioread('.\Sound Files\ieee\AW03.wav');
[S4  fs] = audioread('.\Sound Files\ieee\AW04.wav');
[S5  fs] = audioread('.\Sound Files\ieee\AW05.wav');
[S6  fs] = audioread('.\Sound Files\ieee\AW06.wav');
[S7  fs] = audioread('.\Sound Files\ieee\AW07.wav');
[S8  fs] = audioread('.\Sound Files\ieee\AW08.wav');
[S9  fs] = audioread('.\Sound Files\ieee\AW09.wav');
[S10 fs] = audioread('.\Sound Files\ieee\AW10.wav');
[S11 fs] = audioread('.\Sound Files\ieee\TA11.wav');
[S12 fs] = audioread('.\Sound Files\ieee\TA12.wav');
[S13 fs] = audioread('.\Sound Files\ieee\TA13.wav');
[S14 fs] = audioread('.\Sound Files\ieee\TA14.wav');
[S15 fs] = audioread('.\Sound Files\ieee\TA15.wav');
[S16 fs] = audioread('.\Sound Files\ieee\TA16.wav');
[S17 fs] = audioread('.\Sound Files\ieee\TA17.wav');
[S18 fs] = audioread('.\Sound Files\ieee\TA18.wav');
[S19 fs] = audioread('.\Sound Files\ieee\TA19.wav');
[S20 fs] = audioread('.\Sound Files\ieee\TA20.wav');
allSounds = [S1' S2' S3' S4' S5' S6' S7' S8' S9' S10' S11' S12' S13' S14' S15' S16' S17' S18' S19' S20']';
allSounds = allSounds(1:(2*floor(length(allSounds)/2)));
spectrum = fft(allSounds);
magnitude = abs(spectrum);
phase = angle(spectrum);
randphase = 2*3.14159.*(rand(length(phase)/2,1) - 0.5);
%make the phase symmetric
randphase = [randphase;(flipud(randphase))];
calibrationSpectrum = magnitude.*exp(randphase*i);
calibrationSignal = real(ifft(calibrationSpectrum));
audiowrite('Calibration_Signal.wav',calibrationSignal,fs);
