clear all
close all
clc

color=['r','g','b']; N=[24 26]; mu=50; intervalo=[0,1]; x0=0;
fext=@(t) (mu^2/(1+mu^2))*(cos(t)-exp(-mu*t)+(1/mu)*sin(t));
figure
fplot(fext,intervalo,'r')
hold on
grid on

for i=1:2

f=@(t,x) -mu*(x-cos(t));
[t,x]=meuler(f,intervalo,x0,N(i));
plot(t,x,color(i+1));

end
