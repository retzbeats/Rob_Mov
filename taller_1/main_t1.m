[SNAKE,PARAM]=snake_param();
t = [0:0.1:9.9]; %con fi obtengo 100 posiciones (q);
[q,qd,qdd,x,y]=serpenoid(12,pi/3,2*pi,1,1);
figure
plot(t,p(1,:));
figure
plot (x,y);
grav= [0,0,-9.81]
id = ID (SNAKE,PARAM,q, qd, qdd,grav,0)
figure
for i=1:11
    plot(t,id(i,:));
    hold on
end
hold off