clc
clear all
close all
f=900  %frequency (assumed)
hm=1.5 %height of mobile receiver (assumed)
hb=50  %height of transmitter (base station)
h0=30 %height of the building
ds=20  %distance between two buildings
nb=1   %the number of buildings (edges) that are close enough to
        %the direct path to cause significant diffraction
db=1820 %the spacing between adjacent edges
lambda=(3*10^8)/f %wavelength
for d=1:20 %integrating along the width of the road
        r=(1820+d)*0.001; %distance between transmitter and receiver
        s=atand((hb-h0)/r); %the angle between the direct path and a horizontal line across
                            %the tops of the buildings
        k=-s*(sqrt((pi*db*f)/(3*10^8))); %wave number
        Li=10*log(f)+20*log(h0-hm)-10*log(ds)-22.7; %Ikegami model
        Lf=32.4+20*log(r)+20*log(f); %free space 
        Ln=-(3.29+9.9*log(nb))*log(-k)-(0.77+0.26*log(nb)); %flat edge model
        L=Ln+Li+Lf; %total path loss at point B
        E(d)=10*(1/(1i*lambda))*(exp(-1i*L*d))*10^5; %huygens-fresnel diffraction principle
        double(E)
        y=E;
        x=1:1:20;

      end
plot(x,y)
title('Signal Strength at Point B')
xlabel('Distance (m)')
ylabel('Signal Strength (dBm)')

