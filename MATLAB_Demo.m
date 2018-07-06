%% Section MATLAB Demo

%% Clear the workspace
clear all; close all; clc;

%% Set Parmaeters
T = 2;              % Duration of signal (seconds)
Fs = 5000;          % Sampling Frequency (Hz)
f_analog = 600;          % Frequency of the analog sinusoid signal
Num_samples = T*Fs; % Total number of samples
f_digital = f_analog/Fs;   % Frequency of digital signal

%% Time Break
disp('Press ENTER: Single Sinusoidal Signal...')
pause;

%% Single Sinusoidal Signal;

% time domain signal x(n)
n = (1:Num_samples)';               % time index 

x = sin(2*pi*f_digital*n);          % signal x(n) in time domain

% frequency domain signal X(f)
f = (1:Num_samples)/T-Fs/2;         % frequency range in Hz
X = fftshift(fft(x))/Num_samples;   % signal X(k) in freq. domain 

% plot the signal in both time and frequency domains
figure(1)
subplot(2,1,1)
plot(n(1:100)/Fs,x(1:100),'LineWidth',2)
xlabel('Time (Second)','FontSize',16)
ylabel('Amplitude','FontSize',16)
title('Signal in Time Domain','FontSize',20)
grid on
subplot(2,1,2)
plot(f,abs(X),'r','Linewidth',2);
xlabel('Frequency (Hz)','Fontsize',16);
ylabel('Amplitude','FontSize',16);
title('Signal in Frequency Domain','FontSize',20);
grid on

% play the sound of the signal
sound(x, Fs);
pause(T);

