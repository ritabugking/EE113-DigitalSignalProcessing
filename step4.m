% YI-JU WANG - 204617899

%% clear the workspace
clear all; close all; clc;

%% Setting
N = 2000;
Fs = 5000;
T = N/Fs;

%% a) sin(2*pi*400*t) 
f_analog_1 = 400;
f_digital_1 = f_analog_1/Fs;

n = 0:N-1;
x = sin(2*pi*f_digital_1*n);

%% b) pass signal through nonlinearity 50% amplitude clipper
y=filter(x);

f = linspace(-Fs/2,Fs/2,length(n)+1);
Y = fftshift(fft(y));

figure(1)
plot(n(1:200)/Fs,y(1:200),'LineWidth',2)
xlabel('Time (Second)','FontSize',16)
ylabel('Amplitude','FontSize',16)
title('Time Domain','FontSize',20)

figure(2)
subplot(2,1,1)
plot(f(1:end-1),abs(Y),'r','Linewidth',2);
xlabel('Frequency (Hz)','Fontsize',16);
ylabel('|X(f)|','FontSize',16);
title('Frequency Domain','FontSize',20);
grid on
subplot(2,1,2)
plot(f(1:end-1),angle(Y),'g','Linewidth',2);
xlabel('Frequency (Hz)','Fontsize',16);
ylabel('Phase of X(f) (rad)','FontSize',16);
grid on

%% function of nonlinearity 50% amplitude clipper
function s = filter(s)
    for i=1:length(s)
        if (s(i)>0.5*max(s))
            s(i)=0.5*max(s);
        elseif (s(i)<0.5*min(s))
            s(i)=0.5*min(s);
        else
            s(i)=s(i);
        end
    end
end
