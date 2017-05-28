%% Spline. Curve 1
t = [0 1 2 3 4 5];
x = [275 50 50 250 250 50];
y = [275 275 185 185 105 105];
tq = 0:.1:5;
xq = spline(t,x,tq);
yq = spline(t,y,tq);
plot(x,y,'o',xq,yq,'.',xq,yq)

%% adding points but not there yet. Curve 1
t = [0 1 2 3 4 5 6 7];
%x = [275 150 50  25  50  150 250 275 250 150 50];
%y = [275 275 275 225 185 185 185 145 105 105 105];
x = [275  50  25  50  250 275 250 50];
y = [275  275 225 185 185 145 105 105];

tq = 0:.1:7;
xq = spline(t,x,tq);
yq = spline(t,y,tq);
plot(x,y,'o',xq,yq,'.',xq,yq)

%% Adding points for better results this is the one. Curve 1
t = [0 1 2 3 4 5 6 7 8 9 10];
x = [275 150 50  25  50  150 250 275 250 150 50];
y = [275 275 275 225 185 185 185 145 105 105 105];
tq = 0:.1:10;
xq = spline(t,x,tq);
yq = spline(t,y,tq);

plot(x,y,'o',xq,yq,'.',xq,yq)
figure

subplot(2,1,1)
plot(x,y,'o',xq,yq,'.',xq,yq)
axis('equal')
subplot(2,2,3)
plot(tq,xq,t,x,'o')
subplot(2,2,4)
plot(tq,yq,t,y,'o')

%xq = spline(t,x)
%yq = spline(t,y)

%% Integrate to find speed and acceleration. Curve 1

h=0.46; %this is the time between points in seconds
t=[0:h:h*size(tq,2)]
v_x=diff(xq)/h;
a_x=diff(v_x)/h;
v_y=diff(yq)/h;
a_y=diff(v_y)/h;
v_total = power(power(v_x,2) + power(v_y,2),1/2);
a_total = power(power(a_x,2) + power(a_y,2),1/2);

max_v = max(v_total)
max_a = max(a_total)

[hAx,hLine1,hLine2] = plotyy(t(:,1:length(v_total)),v_total,t(:,1:length(a_total)), a_total);
hold on
plot(t(find(max_v ==v_total)),max_v,'o')
ylabel(hAx(1),'Velocidad (cm/s)')
ylabel(hAx(2),'Aceleración (cm/s²)')
xlabel('time');
hold off

%% Spline Curve 2

t = [0 1 2 3 4 5 6 7];
x = [50  25 50 150 250 275 275 275];
y = [105 65 25 25  25  65  150 275];
tq = 0:.1:7;
xq = spline(t,x,tq);
yq = spline(t,y,tq);
plot(x,y,'o',xq,yq,'.',xq,yq)

%% Integrate to find speed and acceleration. Curve 2

h=0.6; %this is the time between points in seconds
t=[0:h:h*size(tq,2)]
v_x=diff(xq)/h;
a_x=diff(v_x)/h;
v_y=diff(yq)/h;
a_y=diff(v_y)/h;
v_total = power(power(v_x,2) + power(v_y,2),1/2);
a_total = power(power(a_x,2) + power(a_y,2),1/2);

max_v = max(v_total)
max_a = max(a_total)

[hAx,hLine1,hLine2] = plotyy(t(:,1:length(v_total)),v_total,t(:,1:length(a_total)), a_total);
hold on
plot(t(find(max_v ==v_total)),max_v,'o')
ylabel(hAx(1),'Velocidad (cm/s)')
ylabel(hAx(2),'Aceleración (cm/s²)')
xlabel('tiempo (s)');
hold off
