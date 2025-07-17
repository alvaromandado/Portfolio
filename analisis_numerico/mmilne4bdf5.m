function [t,x]=mmilne4bdf5(f,intervalo,x0,N)

h=(intervalo(2)-intervalo(1))/N;
t=linspace(intervalo(1),intervalo(2),N+1);
x=zeros(N+1,length(x0));
%Preparacion
x(1,:)=x0; y(1,:)=f(t(1),x(1,:))';

for i=1:4

    F1=f(t(i),x(i,:));
    F2=f(t(i)+h/2,x(i,:)+(h/2)*F1');
    F3=f(t(i)+(h/2),x(i,:)+(h/2)*F2');
    F4=f(t(i+1),x(i,:)+h*F3');
    x(i+1,:)=x(i,:)+(h/6)*(F1+2*F2+2*F3+F4)'; y(i+1,:)=f(t(i+1),x(i+1,:))';

end


for i=1:N-4

    %Prediccion                                             %Evaluacion
    x(i+5,:)=x(i+1,:)+(4*h/3)*(2*y(4,:)-y(3,:)+2*y(2,:)); y(6,:)=f(t(i+5),x(i+5,:))';
    %Correccion
    x(i+5,:)=(1/137)*(60*h*y(6,:)+300*x(i+4,:)-300*x(i+3,:)+200*x(i+2,:)-75*x(i+1,:)+12*x(i,:));

    if i+5<N+1

        for j=1:size(y,1)-1

        y(j,:)=y(j+1,:);

        end
        %Evaluacion 
        y(size(y,1),:)=f(t(i+5),x(i+5,:));

    end
    

end