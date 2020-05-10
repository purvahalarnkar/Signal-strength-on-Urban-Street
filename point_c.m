clc
clear all
close all
f=900
hm=1.5
hb=50
h0=30
ds=20
nb=1
db=1820
lambda=(3*10^8)/f %wavelength
he=2
v=0.90
cv=0.7648
sv=0.3398
fv=0.5*(0.5+(cv^2)-cv+(sv^2)-sv)
for d=1:20
        r=(1820+d)*0.001;
        s=atand((hb-h0)/r);
        k=-s*(sqrt((pi*db*f)/(3*10^8)));
        Li=10*log(f)+20*log(h0-hm)-10*log(ds)-22.7;
        Lf=32.4+20*log(r)+20*log(f);
        Lg=6; %grazing path loss
        Ln=-(3.29+9.9*log(nb))*log(-k)-(0.77+0.26*log(nb));
        Lk=-20*log(fv)
        L=Ln+Li+Lf+Lg+Lk;
        E(d)=10*(1/(1i*lambda))*(exp(-1i*L*d));
        double(E)
        y=E;
        x=1:1:20;
      end
plot(x,y)
title('Signal Strength at Point C')
xlabel('Distance (m)')
ylabel('Signal Strength (dBm)')

