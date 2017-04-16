[X Y Z VX VY VZ AX AY AZ t] = traj_planner( 1, [0 0 0;-1 5 9], 38.5, 0.2, 0.0001 );

subplot(2,2,1)
plot(t,VX)
subplot(2,2,2)
plot(t,VY)
subplot(2,1,2)
plot(t,X)

figure
plot(X,Y)

A = [AX AY AZ]
N_A = sqrt(sum(abs(A).^2,2));

V = [VX VY VZ]
N_V = sqrt(sum(abs(V).^2,2));

figure
plot(t,N_V)


%% Splines
[X Y Z VX VY VZ AX AY AZ t] = traj_planner( 2, [1 0 0;0 1 0.5;-1 0 1; 0 -1 1.5; 1 0 2], [0 1 2 3 8], [0 1 0;0 1 0], 0.01 );
plot3(X,Y,Z)

A = [AX AY AZ]
N_A = sqrt(sum(abs(A).^2,2));

V = [VX VY VZ]
N_V = sqrt(sum(abs(V).^2,2));

figure
hold on
plot(t,VX)
plot(t,AX)
plot(t,X)
figure
plot(t,N_V)
