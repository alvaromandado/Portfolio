clear all
close all
clc


color=['r','g','b']; N=200; mu=50; intervalo=[0,1]; x0=0;
fext=@(t) (mu^2/(1+mu^2))*(cos(t)-exp(-mu*t)+(1/mu)*sin(t));
figure
fplot(fext,intervalo,'r')
hold on
grid on


f=@(t,x) -mu*(x-cos(t));

h=(intervalo(2)-intervalo(1))/N;
t=linspace(intervalo(1),intervalo(2),N+1);
x=zeros(N+1,length(x0));
x(1,:)=x0;

for i=1:N

    x(i+1,:)=(1/(1+mu*h))*(x(i,:)+mu*h*cos(t(i+1)));

end

plot(t,x,'g');