function [t,x]=mpuntomedio(f,intervalo,x0,N)


h=(intervalo(2)-intervalo(1))/N;
t=linspace(intervalo(1),intervalo(2),N+1);
x=zeros(N+1,length(x0));
x(1,:)=x0;
[t1,x1]=meuler(f,[0,t(2)],x0,1);
x(2,:)=x1(2,:);

for i=1:N-1

    x(i+2,:)=x(i,:)+2*h*f(t(i+1),x(i+1,:))';

end