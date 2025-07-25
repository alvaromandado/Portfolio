function [t,x]=mab4(f,intervalo,x0,N)

h=(intervalo(2)-intervalo(1))/N;
t=linspace(intervalo(1),intervalo(2),N+1);
x=zeros(N+1,length(x0));
x(1,:)=x0; y(1,:)=f(t(1),x(1,:))';
F1=y(1,:);
F2=f(t(1)+h/2,x(1,:)+(h/2)*F1)';
F3=f(t(1)+(3*h/4),x(1,:)+(3*h/4)*F2')';
x(2,:)=x(1,:)+(h/9)*(2*F1+3*F2+4*F3); y(2,:)=f(t(2),x(2,:))';
F4=y(2,:);
F5=f(t(2)+h/2,x(2,:)+(h/2)*F4')';
F6=f(t(2)+(3*h/4),x(2,:)+(3*h/4)*F5')';
x(3,:)=x(2,:)+(h/9)*(2*F4+3*F5+4*F6); y(3,:)=f(t(3),x(3,:))';
F7=y(3,:);
F8=f(t(3)+h/2,x(3,:)+(h/2)*F7')';
F9=f(t(3)+(3*h/4),x(3,:)+(3*h/4)*F8')';
x(4,:)=x(3,:)+(h/9)*(2*F7+3*F8+4*F9); y(4,:)=f(t(4),x(4,:))';


for i=1:N-3

    x(i+4,:)=x(i+3,:)+(h/24)*(55*y(4,:)-59*y(3,:)+37*y(2,:)-9*y(1,:));

    if i+4<N+1

        for j=1:size(y,1)-1

        y(j,:)=y(j+1,:);

        end

        y(size(y,1),:)=f(t(i+3),x(i+3,:));

    end

end