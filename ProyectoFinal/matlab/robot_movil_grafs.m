figure %abre una ventana de la figura
%p1=subplot (3,2,1); %crea una subventana 2 filas, 1 columna, posicion 1
%plot(u);%grafica x,y en este caso time, la fila 1 de la variable1
%title('Velocidad espacial');
%xlabel('time (s)')
%ylabel('u(m/s)')

%p2=subplot (3,2,2);% subventana 2 filas, 1 columna, posicion 2
%plot (w);%grafica x,y en este caso time, la fila 2 de la variable1
%title ('Velocidad angular');
%xlabel('time (s)')
%ylabel('w(rad/s)')

p3=subplot (3,1,1);% subventana 2 filas, 1 columna, posicion 2
plot (x);%grafica x,y en este caso time, la fila 2 de la variable1
title ('Posicion en X');
xlabel('time (s)')
ylabel('m')

p4=subplot (3,1,2);% subventana 2 filas, 1 columna, posicion 2
plot (y);%grafica x,y en este caso time, la fila 2 de la variable1
title ('Posicion en Y');
xlabel('time (s)')
ylabel('m')

p5=subplot (3,1,3);% subventana 2 filas, 1 columna, posicion 2
plot (teta);%grafica x,y en este caso time, la fila 2 de la variable1
title ('Orientacion');
xlabel('time (s)')
ylabel('grados (°)')

linkaxes([p3,p4,p5],'x');