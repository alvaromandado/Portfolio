function [t,x]=mab4am4(f,intervalo,x0,N)

h=(intervalo(2)-intervalo(1))/N;
t=linspace(intervalo(1),intervalo(2),N+1);
x=zeros(N+1,length(x0));
%Preparacion
x(1,:)=x0; y(1,:)=f(t(1),x(1,:))';

for i=1:3

    F1=f(t(i),x(i,:));
    F2=f(t(i)+h/2,x(i,:)+(h/2)*F1');
    F3=f(t(i)+(h/2),x(i,:)+(h/2)*F2');
    F4=f(t(i+1),x(i,:)+h*F3');
    x(i+1,:)=x(i,:)+(h/6)*(F1+2*F2+2*F3+F4)'; y(i+1,:)=f(t(i+1),x(i+1,:))';

end


for i=1:N-3

    %Prediccion                                             %Evaluacion
    x(i+4,:)=x(i+3,:)+(h/24)*(55*y(4,:)-59*y(3,:)+37*y(2,:)-9*y(1,:)); y(5,:)=f(t(i+4),x(i+4,:))';
    %Correccion
    x(i+4,:)=x(i+3,:)+(h/720)*(251*y(5,:)+646*y(4,:)-264*y(3,:)+106*y(2,:)-19*y(1,:));

    if i+2<N+1

        for j=1:size(y,1)-1

        y(j,:)=y(j+1,:);

        end
        %Evaluacion 
        y(size(y,1),:)=f(t(i+4),x(i+4,:));

    end
    

end