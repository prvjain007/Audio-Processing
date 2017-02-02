%z = filter(b,a,y);
% audio signal filtering in Matlab

clear all
clc

% Read sound file

[x,Fs] = mp3read('E:\F\Downloads\1.wav');

% Perform FFT

X = fft(x);

N = length(X);

Xmag = abs(X);
Xmagn = Xmag/length(Xmag);
Xang = angle(X);

wn = 0:1/(N/2 - 1):1;

figure(1)
% time domain plot
plot(x)
title('Audio Signal samples x')
xlabel('sample')
ylabel('Magnitude')

figure(2)
% normal magnitude plot
plot(Xmag)
title('Magnitude spectrum of audio signal x')
xlabel('DFT bins')
ylabel('Magnitude')

figure(3)
% normalized magnitude plot
plot(wn,Xmagn(1:N/2))
title('Normalized Magnitude Spectrum of audio signal x')
xlabel('\pi radian/sample')
ylabel('Magnitude')

% generate noise

n = awgn(x,10);

% add noise to the signal

y = x + n;

% play the sound

% soundsc(y,Fs)


% FFT of noisy sound

Y = fft(y);
Ymag = abs(Y);
Ymagn = Ymag/length(Ymag);

figure(4)

plot(y)
title('Noisy signal y')
xlabel('sample')
ylabel('Magnitude')

figure(5)
plot(Ymag)
title('Magnitude Spectrum of noisy signal y')
xlabel('DFT bins')
ylabel('Magnitude')

figure(6)
plot(wn, Ymagn(1:N/2))
title('Normalized Magnitude Spectrum of noisy signal y')
xlabel('\pi radian/sample')
ylabel('Magnitude')

%filtering

% find filter order for given normalized cutoff frequency and passband
% ripple of 3dB and stopband attenuation of 60dB

[nth, wc] = buttord(0.1, 0.2, 3, 60);

[b,a] = butter(nth,wc, 'low');

H = freqz(b,a, floor(N/2));

z = filter(b,a,y);

soundsc(z,Fs)

Z = fft(z);
Zmag = abs(Z);
Zmagn = Zmag/ length(Zmag);

figure(7)
plot(wn, abs(H), wn, Ymagn(1:N/2))
title('Filter Response H and Noisy Signal y')
xlabel('\pi radian/sample')
ylabel('Magnitude')

figure(8)
plot(wn, Zmagn(1:N/2))
title('Filtered Signal z')
xlabel('\pi radian/sample')
ylabel('Normalized Magnitude')
