function [t,x,U]=hopfcole(L,T,N,u0)

% Definimos los parámetros del problema

h = L / N;       % Paso espacial
x = linspace(0, L, N+1);        % Definimos el mallado espacial

nu = 0.05;                      % Coeficiente de difusión
dt = 0.4 * h^2 / nu ;           % Paso temporal (para cumplir CFL)
M = round(T / dt);              % Número de puntos temporales
t = linspace(0, T, M+1);        % Definimos el mallado temporal

% Condición inicial para u:

u = u0(x); U0=max(abs(u));

% Calculamos la conficion inicial para phi, prefijando todos los valores a
% cero, luego haciendo la suma mediante el método del trapecio y por último
% aplicando la exponencial.

phi=zeros(size(u));

for i=2:N+1
    phi(i)=phi(i-1)+(h/2)*(u(i-1)+u(i));
end

phi=exp((-1/(2*nu))*phi)';

% Construimos la matriz A=1-rL con B el laplaciano discreto

r = nu * dt / h^2;

B = zeros(N+1, N+1);

for i = 2:N
    B(i,i-1) = 1;    % Coeficiente de la diagonal inferior
    B(i,i)   = -2;   % Coeficiente de la diagonal principal
    B(i,i+1) = 1;    % Coeficiente de la diagonal superior
end

%Completamos la diagonal principal

B(1,1)=-2; B(N+1,N+1)=-2;

% Aplicamos las condiciones de contorno de Neumann: 

B(1,2)   = 2;
B(N+1,N)   = 2;

% Construimos la matriz A del método:

A=eye(N+1)+r*B;

% Pasamos a calcular PHI, la aproximacion numérica de phi, inicializandola
% a cero y imponiendo el perfil inicial calculado.

PHI = zeros(N+1, M+1);
PHI(:,1) = phi;

% Aplicamos la evolución temporal

for n = 2:M+1
    PHI(:,n) = A*PHI(:,n-1);
end

% Queremos recuperar u(x,t), para lo cual la inicializamos a cero y
% colocamos ya el perfil inicial

U = zeros(N+1, M+1);
U(:,1)=u;

% Calculamos U usando la aproximacion de la derivada de phi con diferencias
% centradas y aplicando las condiciones de contorno.

for n = 2:M+1

    U(2:N, n) = - nu * (PHI(3:N+1, n) - PHI(1:N-1, n)) ./ ( h*PHI(2:N,n));
    U(1, n) = 0;
    U(N+1, n) = 0;

end

% Ahora que tenemos U, podemos representar la evolución del campo de
% velocidades para el perfil inicial.

% figure
% grid on
% hold on
% 
% for n = 1:length(t)
% 
%     % Para cada iteración borramos la anterior antes de dibujarla
% 
%     cla;
% 
%     % Dibujamos la curva de velocidad actual
% 
%     plot(x, U(:,n), 'b', 'LineWidth', 1.5);
% 
%     % Añadimos ejes y título
% 
%     xlim([0 L]);
%     ylim([-1.1*U0, 1.1*U0]);
%     xlabel('Posición (x)');
%     ylabel('Velocidad (u)');
%     title({['Hopf-Cole: \nu=',num2str(nu),', L=',num2str(L),', T=',num2str(T),', N=', num2str(N)],[' t = ', num2str(t(n))]});
% 
%     % Dibujamos y añadimos una pausa para obtener la animación completa
% 
%     drawnow;
% 
% end
% 
% % Dibujaremos también en una misma figura estática el campo de velocidades
% % a distintas fracciones del tiempo total. El color será una interpolación
% % de los dos tripletes de abajo.
% 
% numfrac=5; beta=linspace(0,1,numfrac); coloru=zeros(numfrac,3);
% 
% color1=[0,1,1]; color2=[1,0,1];
% 
% for k=1:numfrac
% 
%     coloru(k,:)=color1*beta(k)+color2*(1-beta(k));
% 
% end
% 
% figure
% grid on
% hold on
% 
% xlim([0 L]);
% ylim([-1.1*U0, 1.1*U0]);
% xlabel('Posición (x)');
% ylabel('Velocidad (u)');
% title(['Evolución para distintos tiempos']);
% 
% % Dibujamos el perfil inicial
% 
% plot(x,U(:,1)','color',coloru(1,:),'DisplayName',['t = 0']);
% 
% % Dibujamos los perfiles intermedios
% 
% for j=2:numfrac
% 
%     indicetemp(j)=floor(length(t)*((j-1)/numfrac))+1;
%     plot(x,U(:,indicetemp(j))','color',coloru(j,:),'DisplayName',['t = (dt/T)*', num2str(indicetemp(j)-1)]);
% 
% end
% 
% % Dibujamos el perfil final
% 
% plot(x,U(:,end)','color',coloru(end,:),'DisplayName',['t = T']);
% 
% % Incluimos la leyenda
% 
% legend


% Por último, si interpretamos u como una cierta congestión (no es el campo
% de velocidades, sino una perturbacion que disminuye el valor del campo),
% podemos dibujar tanto la velocidad como el movimiento de las partículas.
% Dibujaremos la curva de velocidades dada por 1-U, y sobre el eje X
% dibujaremos las partículas

% Definimos el número de partículas y sus posiciones

% np = 40;
% posiciones = linspace(0, L, np);
% 
% % Dibujamos la figura y actualizamos para cada tiempo
% 
% figure
% grid on
% hold on
% 
% for n = 1:length(t)
% 
%     % Para cada iteración borramos la anterior antes de dibujarla
% 
%     cla;
% 
%     % Dibujamos la curva de velocidad actual
% 
%     plot(x, ones(size(U(:,n)))-U(:,n), 'b', 'LineWidth', 1.5);
% 
% 
%     % Actualizamos las posiciones de las partículas según la velocidad que
%     % tienen por estar en esa posicion. La velocidad se calcula
%     % interpolando los valores de U en el mallado, y la posicion como la
%     % posicion anterior más la velocidad calculada en ese punto
%     % multiplicada por el paso temporal.
% 
%     velocidades = zeros(1, np);
% 
%     for p = 1:np
% 
%         velocidadinterp = interp1(x,ones(size(U(:,1)))-U(:,n), posiciones(p));
%         velocidades(p) = velocidadinterp;
%         posiciones(p) = posiciones(p) + velocidadinterp * dt;
% 
%     end
% 
%     % Vamos a darle un color a cada partícula en función de su velocidad.
%     % Para velocidades por debajo de 0.5 las dibujamos de azul puro, y para
%     % velocidades por encima de 1 de rojo puro. Entre medias interpolaremos
%     % los colores. Usaremos el comando scatter para dibujarlas,
%     % introduciendo los colores en formato RGB.
% 
%     color = zeros(np, 3);
% 
%     for p = 1:np
% 
%         if velocidades(p) <= 0.5
% 
%             color(p, :) = [0, 0, 1]; % Azul puro
% 
%         elseif velocidades(p) >= 1
% 
%             color(p, :) = [1, 0, 0]; % Rojo puro
% 
%         else
% 
%             % Interpolación entre azul y rojo
% 
%             alpha = (velocidades(p) - 0.5) / (1 - 0.5);
%             color(p, :) = [alpha, 0, (1 - alpha)];
% 
%         end
%     end
% 
%     % Dibujamos las partículas en sus nuevas posiciones con los
%     % correspondientes colores (todas a altura cero, sobre el eje X).
% 
%     scatter(posiciones, zeros(1, np), 50, color, 'filled');
% 
%     % Añadimos ejes y título
% 
%     xlim([0 L]);
%     ylim([0 1.2]);
%     xlabel('Posición (x)');
%     ylabel('Velocidad (u)');
%     title(['Evolución de la congestión (t = ', num2str(t(n)), ')']);
% 
%     % Dibujamos y añadimos una pausa para obtener la animación completa
% 
%     drawnow;
% 
%     pause(0.005);
% 
% end