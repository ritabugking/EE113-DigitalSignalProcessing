% YI-JU WANG - 204617899

%% clear the workspace
clear all; close all; clc;

%% Setting
T = 5;
Fs = 5000;
N = T*Fs;

%% a) sin(2*pi*400*t) + sin(2*pi*1500*t)
f_analog_1 = 400;
f_analog_2 = 1500;
f_digital_1 = f_analog_1/Fs;
f_digital_2 = f_analog_2/Fs;

n = 0:N-1;
x1 = sin(2*pi*f_digital_1*n);
x2 = sin(2*pi*f_digital_2*n);
x = x1+x2;
f = linspace(-Fs/2,Fs/2,length(n)+1);
X = fftshift(fft(x));

%% b) band pass filter
n_h = -8:8;
N_h = length(n_h);
f_h = linspace(-Fs/2,Fs/2,length(n_h)+1);
modulation = cos(1500/2500*pi*n_h);

h = (400/2500)*sinc((400/2500)*n_h);
h2 = 2*h.*modulation;
H = fftshift(fft(h2));
figure(1)
subplot(2,2,1)
plot(n_h/Fs,h2,'LineWidth',2)
xlabel('Time (Second)','FontSize',16)
ylabel('Amplitude','FontSize',16)
title('Impulse Response','FontSize',20)
grid on
subplot(2,2,2)
plot(f_h(1:end-1),abs(H),'r','Linewidth',2);
xlabel('Frequency (Hz)','Fontsize',16);
ylabel('|H(f)|','FontSize',16);
title('Frequency Response','FontSize',20);
grid on
subplot(2,2,4)
plot(f_h(1:end-1),angle(H),'g','Linewidth',2);
xlabel('Frequency (Hz)','Fontsize',16);
ylabel('Phase of H(f) (rad)','FontSize',16);
grid on

%% c) DFT of y(n)
y = conv(h2,x);
n = 0:length(y)-1;
f = linspace(-Fs/2,Fs/2,length(n)+1);
Y = fftshift(fft(y));
figure(2)
subplot(2,2,1)
plot(n(101:300)/Fs,y(101:300),'LineWidth',2)
xlabel('Time (Second)','FontSize',16)
ylabel('Amplitude','FontSize',16)
title('Time Domain','FontSize',20)
grid on
subplot(2,2,2)
plot(f(1:end-1),abs(Y),'r','Linewidth',2);
xlabel('Frequency (Hz)','Fontsize',16);
ylabel('|Y(f)|','FontSize',16);
title('Frequency Domain','FontSize',20);
grid on
subplot(2,2,4)
plot(f(1:end-1),angle(Y),'g','Linewidth',2);
xlabel('Frequency (Hz)','Fontsize',16);
ylabel('Phase of Y(f) (rad)','FontSize',16);
grid on

