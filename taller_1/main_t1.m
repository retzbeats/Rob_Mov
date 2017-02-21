t = [0:0.1:9.9]; %con fi obtengo 100 posiciones (q);
[p,d,d2,x,y]=serpenoid(100,pi/3,2*pi,1,3);
figure
plot(t,p(1,:));
figure
plot (x,y);