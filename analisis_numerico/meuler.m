function [t,x]=meuler(f,intervalo,x0,N)
% La función meuler resuelve un problema de valor inicial de la forma
% x'(t)=f(t,x(t)) en [t0,T]
% x(t0)=x0,
% con x0 en R^n, mediante el método de Euler (explícito).
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
x(1,:)=x0;

for i=1:N

    x(i+1,:)=x(i,:)+h*f(t(i),x(i,:))';

end


