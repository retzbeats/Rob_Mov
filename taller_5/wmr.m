%%Fuzzy control WMR

%XY plane graph of robot position
figure
plot(x.data,y.data)
title('Posicion WMR')
xlabel('x (m)')
ylabel('y (m)')
%Distance and angle error graphs
figure
p1 = subplot(2,1,1)
plot(d_error.time,d_error.data)
title('Error distancia WMR')
xlabel('t (s)')
ylabel('Magn. error distancia (m)')
p2 =subplot (2,1,2)
plot(theta_error.time,theta_error.data)
title('Error angulo WMR')
xlabel('t (s)')
ylabel('Error de angulo (rad)')
linkaxes([p1,p2],'x')
%Control outputs wr an wl
figure
p1 = subplot(2,1,1)
plot(wr.time,wr.data)
title('Salida de control Wr WMR')
xlabel('t (s)')
ylabel('Vel. angular m. derecho (rad/s)')
p2 =subplot (2,1,2)
plot(wl.time,wl.data)
title('Salida de control Wl WMR')
xlabel('t (s)')
ylabel('Vel. angular m. izquierdo (rad/s)')
linkaxes([p1,p2],'x')


