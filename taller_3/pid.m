%%PID Controller
Gp = tf([1],[1,1])
Gc = tf([7,16],[1,0])%mejora a kp=10 y ki=13
Gt = feedback(Gc*Gp,1)
step(Gt)
grid
title('Respuesta escalón unitario con Kp=7 y Ti=16 seg')
%%Following reference
figure
%t=[0:0.01:10];
plot (w)
hold on
plot(input)
plot(u)
plot (error)
legend ('w','input','u','error')
%A=4;
%f=1;
%y=A*sin(2*pi*f*t);
%plot(input)
%plot(error)
%plot(u)