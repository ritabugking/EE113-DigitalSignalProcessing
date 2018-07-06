%demo
%functions:
%disp, plot, hold, stem, length, zeros, ones, : operator, linspace, .* operator, transpose and
%hermitian operators, filter, fvtool, 
% sin, square, 1i
% conv, circ-conv, fft, ifft, fftshift, resample, repmat, upfirdn, 

close all;
f1 = 2e3;
f2 = 12e3;
fs = 40e3;
N = 10e3; %10k samples

t = 0:1/fs:(N-1)/fs; Ts = 1/fs;
t = 0: Ts: (N-1)*Ts;
x = cos(2*pi*f1*t) + cos(2*pi*f2*t);

plot(t,x);
% % 
% sq = square(2*pi*f2*t);
%     hold on;
% stem(t, sq);
% % 
Nfft = 2^nextpow2(N);
Nfft = N;
xpad = [x, zeros(1,Nfft-N)];
length(xpad)
Xf = fft(xpad, Nfft);
figure;
freq = linspace(0,fs, Nfft+1); 
plot(freq(1:end-1), abs(Xf)/N); 
Xf = round(Xf, 3); 
figure;
plot(freq(1:end-1), angle(Xf))
% % 
% figure;
% Xf = fftshift(Xf);
% freqnew = -fs/2:fs/N:fs/2;
% plot(freqnew(1:end-1), abs(Xf)/N);
% title('shifted');
% % 
% % filter at [-pi/2, pi/2] = 0.5 sin(pi n/2)/ (pi n/2) => first null at n =
% % %2.
n = -40:40;
sincfilter = 1/2*sinc(n/2);
LPF = fft(sincfilter);
omega = -pi:2*pi/length(n):pi;
figure;
LPF = fftshift(LPF);
plot(omega(1:end-1), abs(LPF));
y = conv(x, sincfilter);
% 
% % y = filter(sincfilter, 1, x);
Yf = fft(y);
Ny = length(y);
Yf = fftshift(Yf);
figure;
freq = -fs/2:fs/Ny:fs/2;
plot(freq(1:end-1), abs(Yf)/N);
% % 
% % y2 = conv(x, sincfilter);
% % figure;
% % plot(abs(y2));
% % hold on
% % plot(abs(y),'r');