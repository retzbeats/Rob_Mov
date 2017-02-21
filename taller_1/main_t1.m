t = [0:0.1:9.9]; %con fi obtengo 100 posiciones (q);
[p,d,d2]=serpenoid(12,2*pi/3,2*pi,0,3);
figure
plot(t,p(1,:));