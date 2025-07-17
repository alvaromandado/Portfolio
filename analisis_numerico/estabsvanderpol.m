clear all
close all
clc


opciones=odeset('Stats','off','AbsTol',1.e-5,'RelTol',1.e-5);

alpha=[0.1,30]; T=[150,250]; x0=[0.1,0.1]; beta=1;

for i=1:2

    f=@(t,x) [x(2);-alpha(i)*((x(1))^2-beta)*x(2)-x(1)];
 intervalo=[0,T(i)];

[t1,x1]=ode45(f,intervalo,x0,opciones);

figure
grid on
hold on
plot(t1,x1(:,1),'r')
figure
grid on
hold on
plot(t1,x1(:,2),'r')


[t2,x2]=ode15s(f,intervalo,x0,opciones);

figure
grid on
hold on

plot(t2,x2(:,1),'g')
figure
grid on
hold on

plot(t2,x2(:,2),'g')

figure
grid on
hold on

plot(x1(:,1),x1(:,2),'r')
plot(x2(:,1),x2(:,2),'g')

for i=1:length(t1)-1

    timespan1(i)=t1(i+1)-t1(i);

end


for i=1:length(t2)-1

    timespan2(i)=t2(i+1)-t2(i);

end


figure
grid on
hold on

plot(timespan1,'r')
plot(timespan2,'g')

end