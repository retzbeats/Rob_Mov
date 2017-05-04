%% Splines trayectoria de retorno a home
% Puntos de control en x, y
x_points = [50  25 50 150 250 275 275 275];
y_points = [105 65 25 25  25  65  150 275];
z_points = zeros(size(x_points));
points = [x_points;y_points;z_points]';
t_points = [0 1 2 3 4 5 6 7]; %tiempos para los puntos de control
v_ini_fin =  [0 0 0;0 0 0]; % velocidad inicial y final
t_m = 0.2; % tiempo de muestreo

%Trajectory Plot
figure
[X Y Z VX VY VZ AX AY AZ t] = traj_planner( 2, points, t_points, v_ini_fin, 0.2 );
plot(X,Y, X,Y,'.',50, 105,'o',25, 65,'o',50, 25,'o', 150, 25,'o',250, 25,'o',275, 65,'o', 275, 150,'o',275, 275,'o')
title ('X vs Y. tiempos [0 1 2 3 4 5 6 7]');
xlabel('cm')
ylabel('cm')
axis equal

%Determine Aceleration and Speed
A = [AX AY AZ]
N_A = sqrt(sum(abs(A).^2,2));

V = [VX VY VZ]
N_V = sqrt(sum(abs(V).^2,2));

figure
%X coordinate plots
p1 = subplot (3,1,1)
hold on
plot(t,X)
plot(t,VX)
plot(t,AX)
xlabel('tiempo (s)')
legend('Posicion x (cm)','Velocidad x (cm/s)','Aceleracion x (cm/s2)')
%Y coordinate plots
p2 = subplot (3,1,2)
hold on
plot(t,Y)
plot(t,VY)
plot(t,AY)
xlabel('tiempo (s)')
legend('Posicion y (cm)','Velocidad y (cm/s)','Aceleracion y (cm/s2)')
%Total speed plot
p3 = subplot (3,1,3)
plot(t,N_V)
xlabel('tiempo (s)')
ylabel('cm/s')
legend('Velocidad total')

linkaxes([p1,p2, p3],'x');
%% Splines trayectoria recorrido de surcos
% Puntos de control en x, y
x_points = [275 150 50  25  50  150 250 275 250 150 50];
y_points = [275 275 275 225 185 185 185 145 105 105 105];
z_points = zeros(size(x_points));
points = [x_points;y_points;z_points]';
t_points = [0 1 2 3 4 5 6 7 8 9 10]; %tiempos para los puntos de control
v_ini_fin =  [0 0 0;0 0 0]; % velocidad inicial y final
t_m = 0.2; % tiempo de muestreo

%Trajectory plot
figure
[X Y Z VX VY VZ AX AY AZ t] = traj_planner( 2, points, t_points, v_ini_fin, 0.2 );
plot(X,Y, X,Y,'.',275, 275,'o',150, 275,'o',50, 275,'o', 25, 225,'o',50, 185,'o',150, 185,'o', 250, 185,'o',275, 145,'o', 250, 105,'o', 150, 105,'o', 50, 105,'o')
title ('X vs Y. tiempos [0 1 2 3 4 5 6 7 8 9 10]');
xlabel('cm')
ylabel('cm')
axis equal

%Determine Aceleration and Speed
A = [AX AY AZ]
N_A = sqrt(sum(abs(A).^2,2));

V = [VX VY VZ]
N_V = sqrt(sum(abs(V).^2,2));

figure
%X coordinate plots
p1 = subplot (3,1,1)
hold on
plot(t,X)
plot(t,VX)
plot(t,AX)
xlabel('tiempo (s)')
legend('Posicion x (cm)','Velocidad x (cm/s)','Aceleracion x (cm/s2)')
%Y coordinate plots
p2 = subplot (3,1,2)
hold on
plot(t,Y)
plot(t,VY)
plot(t,AY)
xlabel('tiempo (s)')
legend('Posicion y (cm)','Velocidad y (cm/s)','Aceleracion y (cm/s2)')
%Total speed plot
p3 = subplot (3,1,3)
plot(t,N_V)
xlabel('tiempo (s)')
ylabel('cm/s')
legend('Velocidad total')

linkaxes([p1,p2, p3],'x');
