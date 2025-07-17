% Práctica 2

% f=@(t,x) [x(2);-9*x(1)+8*sin(t)];
% f1=@(t,x) [-9*x(1)+8*sin(t);8*cos(t)-9*x(2)];
% intervalo=[0,2*pi]; x0=[0,4]; N=1000; 
% Ejemplo

% k=1; m=1 ;f=@(t,x) [x(2);-(k/m).*x(1)]; 
% f1=@(t,x) -(k/m)*[x(1);x(2)];
% intervalo=[0,10]; x0=[1,0]; N=1000;
% Oscilador armónico

 alpha=0.1; beta=1; f=@(t,x) [x(2);-alpha*((x(1))^2-beta)*x(2)-x(1)];
 intervalo=[0,150]; x0=[0.1,0.1]; N=1000; 
% Van der Pol

% f=@(t,x) sin(t*x); f1=@(t,x) cos(t*x)*x+(t/2)*sin(2*t*x);
% intervalo=[0,10]; x0=1; N=1000;
% Ejercicio 2.8

% f=@(t,x) [-0.1*x(1)+2*x(2);-2*x(1)-0.1*x(2)];
% intervalo=[0 10]; x0=[0,1]; N=1000;
% fext=@(t) [exp(-0.1.*t).*sin(2*t);exp(-0.1.*t).*cos(2*t)];
% Ejercicio 2.11.a

% f=@(t,x) [x(2);-2*x(1)+cos(3.*t)];
% intervalo=[0 10]; x0=[1,0]; N=1000;
% fext=@(t) [(8/7)*cos(sqrt(2).*t)-(1/7)*cos(3.*t);-sqrt(2)*(8/7)*sin(sqrt(2).*t)+(3/7)*sin(3.*t)];
% Ejercicio 2.11.b

% F=1; L=1; m=1; g=9.8; T=10; theta0=0.1; omega0=0; beta=0.5;
% f=@(t,x) [x(2);(1/(m*L))*(F-m*g*sin(x(1))-2*L*beta*x(2))];
% intervalo=[0,T]; x0=[theta0,omega0]; N=1000;
% Ejercicio 14.1

% F=0; L=1; m=1; g=9.8; T=10; theta0=pi; omega0=0;
% f=@(t,x) [x(2);(1/(m*L))*(F-m*g*x(1)-2*L*beta*x(2))];
% intervalo=[0,T]; x0=[theta0,omega0];
% Ejercicio 14.2

% intervalo=[0,100]; N=5000; a=3; b=0.2; c=0.6; d=5; x0=[3.5,12];
% f=@(t,x) [a*x(1)-b*x(1)*x(2);-c*x(2)+d*x(1)*x(2)];
% Ejercicio 15.a

% intervalo=[0,100]; N=5000; a=1; b=a; c=a; d=a; e=0.4; g=0.02; x0=[12,3.5];
% f=@(t,x) [a*x(1)-b*x(1)*x(2)-e*(x(1))^2;-c*x(2)+d*x(1)*x(2)-g*(x(2))^2];
% Ejercicio 15.b

% intervalo=[0,10]; N=100; alfa=1; beta=1; A=0.2; w=3; x0=[0.1,0.2];
% f=@(t,x) [x(2);-alfa*((x(2))^2-beta)*x(2)-x(1)+A*cos(w*t)];
% Ejercicio 15.c

% intervalo=[0,100]; N=5000; alfa=1; x0=[0.1,0.1];
% f=@(t,x) [x(2);-alfa*x(2)-(x(1))^3+x(1)];
% Ejercicio 15.d

% intervalo=[0,100]; N=5000; sigma=10; beta=8/3; rho=30; x0=[0,5,75];
% f=@(t,x) [sigma*(x(2)-x(1));rho*x(1)-x(2)-x(1)*x(3);x(1)*x(2)-beta*x(3)];
% Ejercicio 15.e

% intervalo=[0,10]; N=5000; a=10; beta=0; A=1; w=10; x0=[0,0];
% f=@(t,x) [x(2);-2*beta*x(2)-a^2*x(1)+A*cos(w*t)];
% Ejercicio 16.a

% intervalo=[0,10]; N=5000; a=10; beta=15; A=1; w=9.8995; x0=[0,0];
% f=@(t,x) [x(2);-2*beta*x(2)-a^2*x(1)+A*cos(w*t)];
% Ejercicio 16.b

% Práctica 3

% intervalo=[0,10]; N=5000; lambda=10; beta=15; A=1; w=9.8995; x0=[0,0];
% f=@(t,x) [x(2);-2*beta*x(2)-a^2*x(1)+A*cos(w*t)];
% Ejercicio SC