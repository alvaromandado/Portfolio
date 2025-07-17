function comp2ode45(g)

datos

color=['r','g','b'];

if length(x0)==1

    [t1,x1]=g(f,intervalo,x0,N);
    [t2,x2]=ode45(f,t1,x0);

    figure
    

    subplot(2,1,1)
    plot(t1,x1(:,1),color(1))
    hold on
    grid on
    title('Soluciones para ambos métodos')
    subplot(2,1,2)
    plot(t2,x2(:,1),color(1))
    hold on 
    grid on


    pause(3)

    figure

    plot(t1,x1(:,1)-x2(:,1),color(1))
    hold on
    grid on

    title(sprintf(['Diferencia entre las soluciones']))

    y=abs(x2-x1);
    normainf=max(y)

else

    [t1,x1]=g(f,intervalo,x0,N);
    [t2,x2]=ode45(f,t1,x0);

    figure(1)

    for i=1:size(x1,2)

    subplot(length(x0),1,i)
    hold on
    grid on
    
    

    plot(t1,x1(:,i),color(1))
    plot(t1,x2(:,i),color(2))

    

    title(sprintf('Coordenada %d de las soluciones',i))
    legend(['x1(',num2str(i),')(t)'],['x2(',num2str(i),')(t)'])

    end

    pause(3)

    figure(2)

    for i=1:size(x1,2)

    subplot(length(x0),1,i)
    plot(t1,x1(:,i)-x2(:,i),color(1))

    hold on
    grid on

    title(sprintf('Coordenada %d de la diferencia',i))
    legend(['[x1(',num2str(i),')-x2(',num2str(i),')](t)'])

    end

    pause(3)

    figure(3)

    if size(x1,2)==2

        plot(x1(:,1),x1(:,2),color(1))
        hold on
        grid on
        plot(x2(:,1),x2(:,2),color(2))

        title(sprintf('Trayectoria de las soluciones'))
        legend('x1','x2')

    elseif size(x1,2)==3

        plot3(x1(:,1),x1(:,2),x1(:,3),color(1))
        hold on
        grid on
        plot(x2(:,1),x2(:,2),x2(:,3),color(2))

        title(sprintf('Trayectoria de las soluciones'))
        legend('x1','x2')

    end

    for i=1:size(x1,2)

    normainf(i)=max(abs(x1(:,i)-x2(:,i)));

    end

    normainf=max(normainf)

end

end