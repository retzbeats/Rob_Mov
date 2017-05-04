%% Lineas Rectas
[X Y Z VX VY VZ AX AY AZ t] = traj_planner( 1, [0 0 0;3 2 0], 1, 0.2, 0.05 );

subplot(2,2,1)
plot(t,VX)
title ('Velocidad X');
xlabel('time (s)')
ylabel('m/s')
subplot(2,2,2)
plot(t,VY)
title ('Velocidad Y');
xlabel('time (s)')
ylabel('m/s')
subplot(2,2,3)
plot(t,X)
title ('tiempo vs posición en X');
xlabel('time (s)')
ylabel('m')
subplot(2,2,4)
plot(t,Y)
title ('tiempo vs posición en Y');
xlabel('time (s)')
ylabel('m')

figure
plot(X,Y,X,Y,'.')
title ('X vs Y');
xlabel('m')
ylabel('m')
axis equal

A = [AX AY AZ]
N_A = sqrt(sum(abs(A).^2,2));

V = [VX VY VZ]
N_V = sqrt(sum(abs(V).^2,2));

figure
plot(t,N_V)
title ('Velocidad total');
xlabel('m')
ylabel('m/s')

%% Splines

subplot(2,2,1)
[X Y Z VX VY VZ AX AY AZ t] = traj_planner( 2, [1 0 0;sin(pi/4) cos(pi/4) 0;0 1 0;-sin(pi/4) cos(pi/4) 0; -1 0 0], [0 2 4 6 8], [0 0 0;0 0 0], 0.2 );
plot(X,Y, X,Y,'.',1,0,'o',sin(pi/4), cos(pi/4),'o',0,1,'o', -sin(pi/4), cos(pi/4),'o',-1,0,'o')
title ('X vs Y. tiempos [0 2 4 6 8]');
xlabel('m')
ylabel('m')
axis equal

subplot(2,2,2)
[X Y Z VX VY VZ AX AY AZ t] = traj_planner( 2, [1 0 0;sin(pi/4) cos(pi/4) 0;0 1 0;-sin(pi/4) cos(pi/4) 0; -1 0 0], [0 1 4 7 8], [0 0 0;0 0 0], 0.2 );
plot(X,Y, X,Y,'.',1,0,'o',sin(pi/4), cos(pi/4),'o',0,1,'o', -sin(pi/4), cos(pi/4),'o',-1,0,'o')
title ('X vs Y. tiempos [0 1 4 7 8]');
xlabel('m')
ylabel('m')
axis equal

subplot(2,2,3)
[X Y Z VX VY VZ AX AY AZ t] = traj_planner( 2, [1 0 0;sin(pi/4) cos(pi/4) 0;0 1 0;-sin(pi/4) cos(pi/4) 0; -1 0 0], [0 1 2 3 8], [0 0 0;0 0 0], 0.2 );
plot(X,Y, X,Y,'.',1,0,'o',sin(pi/4), cos(pi/4),'o',0,1,'o', -sin(pi/4), cos(pi/4),'o',-1,0,'o')
title ('X vs Y. tiempos [0 1 2 3 8]');
xlabel('m')
ylabel('m')
axis equal

subplot(2,2,4)
[X Y Z VX VY VZ AX AY AZ t] = traj_planner( 2, [1 0 0;sin(pi/4) cos(pi/4) 0;0 1 0;-sin(pi/4) cos(pi/4) 0; -1 0 0], [0 5 6  7 8], [0 0 0;0 0 0], 0.2 );
plot(X,Y, X,Y,'.',1,0,'o',sin(pi/4), cos(pi/4),'o',0,1,'o', -sin(pi/4), cos(pi/4),'o',-1,0,'o')
title ('X vs Y. tiempos [0 5 6 7 8]');
xlabel('m')
ylabel('m')
axis equal

%% 
A = [AX AY AZ]
N_A = sqrt(sum(abs(A).^2,2));

V = [VX VY VZ]
N_V = sqrt(sum(abs(V).^2,2));

figure
hold on
plot(t,X)
plot(t,VX)
plot(t,AX)
xlabel('tiempo (s)')
legend('Posición x (m)','Velocidad x (m/s)','Aceleración x (m/s²)')
figure
plot(t,N_V)
xlabel('tiempo (s)')
ylabel('m/s')
legend('Velocidad total')
