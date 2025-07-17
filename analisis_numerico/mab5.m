function [t,x]=mab5(f,intervalo,x0,N)

h=(intervalo(2)-intervalo(1))/N;
t=linspace(intervalo(1),intervalo(2),N+1);
x=zeros(N+1,length(x0));
x(1,:)=x0; y(1,:)=f(t(1),x(1,:))';

for i=1:4

    F1=y(i,:);
    F2=f(t(i)+h/2,x(i,:)+(h/2)*F1)';
    F3=f(t(i)+(h/2),x(i,:)+(h/2)*F2)';
    F4=f(t(i+1),x(i,:)+h*F3)';
    x(i+1,:)=x(i,:)+(h/6)*(F1+2*F2+2*F3+F4); y(i+1,:)=f(t(i+1),x(i+1,:));

end


for i=1:N-4

    x(i+5,:)=x(i+4,:)+(h/720)*(1901*y(5,:)-2774*y(4,:)+2616*y(3,:)-1274*y(2,:)+251*y(1,:));

    if i+5<N+1

        for j=1:size(y,1)-1

        y(j,:)=y(j+1,:);

        end

        y(size(y,1),:)=f(t(i+5),x(i+5,:));

    end

end