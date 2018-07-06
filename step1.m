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
sound(x1);
pause(5)
sound(x2);
pause(5)
sound(x);
pause(5)

f = linspace(-Fs/2,Fs/2,length(n)+1);
X = fftshift(fft(x));

figure(1)
plot(n(1:200)/Fs,x(1:200),'LineWidth',2)
xlabel('Time (Second)','FontSize',16)
ylabel('Amplitude','FontSize',16)
title('Time Domain','FontSize',20)

figure(2)
subplot(2,1,1)
plot(f(1:end-1),abs(X),'r','Linewidth',2);
xlabel('Frequency (Hz)','Fontsize',16);
ylabel('|X(f)|','FontSize',16);
title('Frequency Domain','FontSize',20);
grid on
subplot(2,1,2)
plot(f(1:end-1),angle(X),'g','Linewidth',2);
xlabel('Frequency (Hz)','Fontsize',16);
ylabel('Phase of X(f) (rad)','FontSize',16);
grid on