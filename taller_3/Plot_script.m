%% First yu have to run the CP_model (campos potenciales)


%% Plot X vs Y
plot(x.Data,y.data, 0.2, 0.4, 'o', x.Data,y.data,'.')
title ('Campos Potenciales. X vs Y');
xlabel('X (m)')
ylabel('Y (m)')
viscircles([0.2 0.4], 0.5)
axis equal
legend('Recorrido robot','Obstaculo')

%% Plot phi
figure
plot(phi.Time, phi.data)
title ('\phi');
xlabel('seg')
ylabel('rad')
legend('\phi')

%% Plot wl vs wlref
figure
plot(wl.Time,wl.data, wl_ref.time,wl_ref.data)
%title ('wl contra wl de referencia');
xlabel('seg')
ylabel('rad/seg')
legend('wl','wl referencia')

%% Plot wr vs wr_ref
figure
plot(wr.Time,wr.data, wr_ref.time,wr_ref.data)
%title ('wr contra wr de referencia');
xlabel('seg')
ylabel('rad/seg')
legend('wr','wr referencia')

%% Voltajes
figure
plot(ul.Time,ul.data, ur.time,ur.data)
xlabel('seg')
ylabel('V')
legend('u left','u right')
