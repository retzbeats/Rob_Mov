%% Calculate the inverse kinematics of the 

r = 2.25;
l=16.3/2;
tm=0.05;
x_points = [275 150 50  25  50  150 250 275 250 150 50]/1.7;
y_points = [275 275 275 225 185 185 185 145 105 105 105]/1.7;
z_points = zeros(size(x_points));
points = [x_points;y_points;z_points]';
t_points = [0 5 10 15 20 25 30 35 40 45 50]/1.5; %tiempos para los puntos de control
v_ini_fin =  [0 0 0;0 0 0]; % velocidad inicial y final
t_m = 0.2; % tiempo de muestreo

[X Y Z VX VY VZ AX AY AZ t] = traj_planner( 2, points, t_points, v_ini_fin,tm);
[wr,wl]=ikine_uniciclo(r,l,VX,VY,tm);
t=linspace(0,t_points(end),size(wl,1));
t = t';
Data = [t abs(round(wl*100)) abs(round(wr*100))];

figure
plot(wr)
hold on
plot(wl)
legend('wr','wl')

%% Second trajectory

% Puntos de control en x, y
x_points = [50  30 10 50 150 250 275 275 275]/1.7;
y_points = [105 105 65 25 25  25  65  150 250]/1.7;
z_points = zeros(size(x_points));
points = [x_points;y_points;z_points]';
t_points = [0 1 2 3 4 5 6 7 8]*3; %tiempos para los puntos de control
v_ini_fin =  [0 0 0;0 0 0]; % velocidad inicial y final

[X Y Z VX VY VZ AX AY AZ t] = traj_planner( 2, points, t_points, v_ini_fin, tm );
[wr,wl]=ikine_uniciclo(r,l,VX,VY,tm);
t=linspace(0,t_points(end),size(wl,1));
t = t';
Data2 = [t abs(round(wl*100)) abs(round(wr*100))];

figure
plot(wr)
hold on
plot(wl)
legend('wr','wl')

%% Sum trajectories without CP

%Data2(:,1) = Data2(:,1) + Data(end,1);
Data_total = [Data ;zeros(15,3); Data2];
Data_total(:,1) = (0:tm:tm*(size(Data_total,1)-1))';
figure
plot(Data_total(:,1),Data_total(:,2))
hold on
plot(Data_total(:,1),Data_total(:,3))
legend('wl','wr')


%% CP

data_cp = [wl_ref.time round(wl_ref.data*100) round(wr_ref.data*100)]
figure
plot (data_cp(:,1),data_cp(:,2))
hold on
plot (data_cp(:,1),data_cp(:,3))

%% Sum of all trajectories

Data_final = [Data ;zeros(15,3); Data2(1:390,:); data_cp];
Data_final(:,1) = (0:tm:tm*(size(Data_final,1)-1))';
figure
plot(Data_final(:,1),Data_final(:,2))
hold on
plot(Data_final(:,1),Data_final(:,3))
legend('wl','wr')