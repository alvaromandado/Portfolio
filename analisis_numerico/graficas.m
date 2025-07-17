function graficas(t,x)

% Esta función servirá para graficar.
figure(1)

color=['r','g','b'];

for i=1:size(x,2)

    subplot(size(x,2),1,i)
    plot(t,x(:,i),color(1))

    hold on
    grid on

    title(sprintf('Coordenada %d de la solución',i))
    legend(['x',num2str(i),'(t)'])

end

if size(x,2)>1

    pause(3)

    figure(2)

    if size(x,2)==2

        plot(x(:,1),x(:,2),'r')
        %comet(x(:,1),x(:,2),'r')

        hold on
        grid on

        legend('(x1(t),x2(t))')

    elseif size(x,2)==3

        plot3(x(:,1),x(:,2),x(:,3),'r')
        %comet3(x(:,1),x(:,2),x(:,3),'r')

        hold on
        grid on

        legend('(x1(t),x2(t),x3(t))')

    end

    title('Trayectoria de la solución')
end

end