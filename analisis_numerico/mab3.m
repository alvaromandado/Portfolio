function [t,x]=mab3(f,intervalo,x0,N)
% La función mab3 resuelve un problema de valor inicial de la forma
% x'(t)=f(t,x(t)) en [t0,T]
% x(t0)=x0,
% con x0 en R^n, mediante el método de Adams-Bashford de 3 pasos.
%
% ENTRADA:
% f: función (definida en formato anónimo o como fichero de tipo función de Matlab) del
% problema que se quiere resolver, con dos argumentos de entrada: el primero es un número
% real y el segundo es un vector columna de tipo (n,1) o un vector fila de tipo (1,n)
% intervalo: [t0,T], donde está planteado el sistema de ecuaciones diferenciales
% x0: vector inicial de tipo (1,n)
% N: número de subintervalos
%
% SALIDA:
% t: vector, de tipo (N+1,1), de nodos de [t0,T] donde se va a aproximar la solución
% x: matriz, de tipo (N+1,n), de valores de la solución aproximada en los nodos
h=(intervalo(2)-intervalo(1))/N;
t=linspace(intervalo(1),intervalo(2),N+1);
x=zeros(N+1,length(x0));
x(1,:)=x0; y(1,:)=f(t(1),x(1,:))';
F1=y(1,:); F2=f(t(2),x(1,:)+h*F1)';
x(2,:)=x(1,:)+(h/2)*(F1+F2); y(2,:)=f(t(2),x(2,:))';
F3=y(2,:); F4=f(t(3),x(2,:)+h*F3')';
x(3,:)=x(1,:)+(h/2)*(F3+F4); y(3,:)=f(t(3),x(3,:))';

for i=1:N-2

    x(i+3,:)=x(i+2,:)+(h/12)*(23*y(3,:)-16*y(2,:)+5*y(1,:));

    if i+3<N+1

        for j=1:size(y,1)-1

        y(j,:)=y(j+1,:);

        end

        y(size(y,1),:)=f(t(i+2),x(i+2,:));

    end

end