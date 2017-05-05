%% Parameters definition and vehicle creation
V  = diag([0.005, 0.5*pi/180].^2);
veh = Vehicle(V);
odo = veh.step(1, 0.3) ;
%Diagonal elements are the variances of the distance and orientation


%speed = 1 m/s, steering angle = 3 rad/s
%odo returns odometry with the noise specified by V
%points of trayectory


%% Part 1 - MAP
%Import raw_map.m
mapa_original = map_raw;
 map_raw_rescaled = imresize(mapa_original,0.1); %%scale map
 map_raw = round(map_raw_rescaled);
 
%Detect borders
map_clean = zeros(size(map_raw));
for i = 3: size(map_raw,1)-2
    for j = 3 : size(map_raw,2)-2
        if map_raw(i,j) == 1
            ind = 0;
            ind = map_raw(i-2,j-2) + map_raw(i-2,j-1) + map_raw(i-2,j) + map_raw(i-2,j+1) + map_raw(i-2,j+2);
            ind = ind + map_raw(i-1,j-2) + map_raw(i-1,j-1) + map_raw(i-1,j) + map_raw(i-1,j+1) + map_raw(i-1,j+2);
            ind = ind + map_raw(i,j-2) + map_raw(i,j-1) + map_raw(i,j+1) + map_raw(i,j+2);
            ind = ind + map_raw(i+1,j-2) + map_raw(i+1,j-1) + map_raw(i+1,j) + map_raw(i+1,j+1) + map_raw(i+1,j+2);
            ind = ind + map_raw(i+2,j-2) + map_raw(i+2,j-1) + map_raw(i+2,j) + map_raw(i+2,j+1) + map_raw(i+2,j+2);
            if ind == 24
                map_clean(i,j)=0;
            else
                map_clean(i,j)=1;
            end
        end
    end
end
%%
[row, col] = find(map_clean);
plot(row,col,'o');
features = [row' ; col'];

features = features/5 - 10;
plot(features(1,:),features(2,:),'o');

map = Map(20);
map.map = features;
map.nfeatures = size(features,2);

%% Part 2 - Map-based vehicle location

veh.add_driver( RandomPath(10, 2) );
W = diag([0.1, 1*pi/180].^2);
P0 = diag([0.005, 0.005, 0.001].^2);
sensor = RangeBearingSensor(veh, map, W, 'range',[0,4],'angle',pi/4,'animate');
ekf = EKF(veh, V, P0, sensor, W, map);
ekf.run(1000);

map.plot();

%% Part 2 - Vehicle-based map making
veh.add_driver( RandomPath(10, 2) );
sensor = RangeBearingSensor(veh, map, W, 'animate');
%sensor.r_range = 5;
ekf = EKF(veh, [], [], sensor, W, []);
ekf.run(200);
map.plot();
ekf.plot_map(3, 'g');