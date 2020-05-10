clc
clear all
close all
f=900 %frequency (assumed)
hm=1.5 %height of mobile receiver (assumed)
hb=50 %height of transmitter (base station) 
lambda=(3*10^8)/f %wavelength
for d=1:20 %integrating along the width of the road
        r=(1820+d)*0.001; %distance between transmitter and receiver
        Le=40*log(r)+20*log(f)-20*log(hb)+86.3-20*log(hm); %line of sight path loss
        Lf=32.4+20*log(r)+20*log(f); %free space path loss
        L=Le+Lf; %total path loss at point A
        E(d)=10*(1/(1i*lambda))*(exp(-1i*L*d))*10^5; %huygens-fresnel diffraction principle
        double(E)
        y=E;
        x=1:1:20;

      end
plot(x,y)
title('Signal Strength at Point A')
xlabel('Distance (m)')
ylabel('Signal Strength (dBm)')

