%% Vehicle creation
V  = diag([0.005, 0.5*pi/180].^2)
%Diagonal elements are the variances of the distance and orientation
veh = Vehicle(V)
odo = veh.step(1, 0.3) 
%speed = 1 m/s, steering angle = 3 rad/s
%odo returns odometry with the noise specified by V
driver%points of trayectory
