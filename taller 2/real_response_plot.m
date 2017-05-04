%% Import data
t_m = 0.0012;
importfile('pid_ver_263.txt');
importfile('pid_ver_551.txt');
importfile('pid_ver_841.txt');
importfile('pid_ver_1130.txt');
importfile('pid_ver_1428.txt');
w_1 = [pid_ver_263];
w_2 = [pid_ver_551];
w_3 = [pid_ver_841];
w_4 = [pid_ver_1130];
w_5 = [pid_ver_1428];
ref_1 =263 %w *100
ref_2 =551
ref_3 =841
ref_4 =1130
ref_5 =1428

%% Plot for 2.63 rad/s

figure
p1 = subplot (3,1,1)
plot(t_m.*w_1(:,1),w_1(:,2))
ts_line_up = hline(ref_1*1.02,'r')
%reference_line = hline(263,'g')
ts_line_down = hline(ref_1*0.98,'r')
title('Velocidad angular con referencia =2.63rad/s (20%)')
ylabel('w * 100(rad/s)')
xlabel('tiempo (s)')

p2 = subplot (3,1,2)
plot(t_m.*w_1(:,1),w_1(:,3))
title('Salida de control con referencia =2.63rad/s (20%)')
ylabel('Ciclo util PWM (%)')
xlabel('tiempo (s)')

p3 = subplot (3,1,3)
error = w_1(:,2)-ref_1;
plot(t_m.*w_1(:,1),error)
title('Error de control con referencia =2.63rad/s (20%)')
ylabel('Error *100 (rad/s) (%)')
xlabel('tiempo (s)')
linkaxes([p1,p2,p3],'x')
%% Plot for 5.51 rad/s

figure
p1 = subplot (3,1,1)
plot(t_m.*w_2(:,1),w_2(:,2))
ts_line_up = hline(ref_2*1.02,'r')
%reference_line = hline(551,'g')
ts_line_down = hline(ref_2*0.98,'r')
title('Velocidad angular con referencia = 5.51rad/s (40%)')
ylabel('w * 100(rad/s)')
xlabel('tiempo (s)')

p2 = subplot (3,1,2)
plot(t_m.*w_2(:,1),w_2(:,3))
title('Salida de control con referencia = 5.51rad/s (40%)')
ylabel('Ciclo util PWM (%)')
xlabel('tiempo (s)')

p3 = subplot (3,1,3)
error = w_2(:,2)-ref_2;
plot(t_m.*w_2(:,1),error)
title('Error de control con referencia = 5.51rad/s (40%)')
ylabel('Error *100 (rad/s) (%)')
xlabel('tiempo (s)')
linkaxes([p1,p2,p3],'x')

%% Plot for 8.41 rad/s

figure
p1 = subplot (3,1,1)
plot(t_m.*w_3(:,1),w_3(:,2))
ts_line_up = hline(ref_3*1.02,'r')
%reference_line = hline(551,'g')
ts_line_down = hline(ref_3*0.98,'r')
title('Velocidad angular con referencia = 8.41rad/s (60%)')
ylabel('w * 100(rad/s)')
xlabel('tiempo (s)')

p2 = subplot (3,1,2)
plot(t_m.*w_3(:,1),w_3(:,3))
title('Salida de control con referencia = 8.41rad/s (60%)')
ylabel('Ciclo util PWM (%)')
xlabel('tiempo (s)')

p3 = subplot (3,1,3)
error = w_3(:,2)-ref_3;
plot(t_m.*w_3(:,1),error)
title('Error de control con referencia = 8.41rad/s (60%)')
ylabel('Error *100 (rad/s) (%)')
xlabel('tiempo (s)')
linkaxes([p1,p2,p3],'x')
%% Plot for 11.3 rad/s

figure
p1 = subplot (3,1,1)
plot(t_m.*w_4(:,1),w_4(:,2))
ts_line_up = hline(ref_4*1.02,'r')
ts_line_down = hline(ref_4*0.98,'r')
title('Velocidad angular con referencia = 11.3rad/s (80%)')
ylabel('w * 100(rad/s)')
xlabel('tiempo (s)')

p2 = subplot (3,1,2)
plot(t_m.*w_3(:,1),w_3(:,3))
title('Salida de control con referencia = 11.3rad/s (80%)')
ylabel('Ciclo util PWM (%)')
xlabel('tiempo (s)')

p3 = subplot (3,1,3)
error = w_3(:,2)-ref_3;
plot(t_m.*w_3(:,1),error)
title('Error de control con referencia = 11.3rad/s (80%)')
ylabel('Error *100 (rad/s) (%)')
xlabel('tiempo (s)')
linkaxes([p1,p2,p3],'x')
%% Plot for 14.28 rad/s

figure
p1 = subplot (3,1,1)
plot(t_m.*w_5(:,1),w_5(:,2))
ts_line_up = hline(ref_5*1.02,'r')
ts_line_down = hline(ref_5*0.98,'r')
title('Velocidad angular con referencia = 14.28rad/s (100%)')
ylabel('w * 100(rad/s)')
xlabel('tiempo (s)')

p2 = subplot (3,1,2)
plot(t_m.*w_3(:,1),w_3(:,3))
title('Salida de control con referencia = 14.28rad/s (100%)')
ylabel('Ciclo util PWM (%)')
xlabel('tiempo (s)')

p3 = subplot (3,1,3)
error = w_3(:,2)-ref_3;
plot(t_m.*w_3(:,1),error)
title('Error de control con referencia = 14.28rad/s (100%)')
ylabel('Error *100 (rad/s) (%)')
xlabel('tiempo (s)')
linkaxes([p1,p2,p3],'x')