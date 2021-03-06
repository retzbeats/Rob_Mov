n = 8000; %N煤mero de iteraciones

%Creaci贸n de variables
H=zeros(n+1,1);
M=zeros(n+1,1);
X3=zeros(n+1,1);
M3=zeros(n+1,1);
T3=zeros(n+1,1);
F3=zeros(n+1,1);
t=0:Tm:80;

%Condiciones iniciales
Ks = 0.5; %Apertura de la salida (entre 0 y 1)
dens = 2; %densidad del fluido
A = 10; %area del tanque
g=9.8; %Gravedad
Tm = 0.01; % tiempo de muestreo

X1=50;
X2=50;
T1=60;
T2=60;
Q=1;
Cp=1;%Calor especifico del agua 1

H(1) = 0.1; %Altura inicial del fluido
M(1) = dens*A*H(1); %Masa total almacenada
X3(1) = 15; %concentracion inicial del soluto
M3(1) = dens*A*H(1)*X3(1);%Masa inicial en el tanque (cantidad de soluto)
T3(1) = 40; %Temperatura inicial

%%
%Caso 1 flujo 1 y 2 constantes
F1 = 2*ones(n+1,1);
F2= 2*ones(n+1,1);
%Iteraciones
for i=2:n+1
    F3(i)=Ks*sqrt(2*g*H(i-1));
    X3(i)=M3(i-1)/(dens*A*H(i-1));
    H(i) = Tm*(F1(i) + F2(i)-F3(i))/(dens*A) + H(i-1);
    M3(i) = Tm*(F1(i)*X1 + F2(i)*X2 - F3(i)*X3(i)) + M3(i-1);
    M(i) = dens*A*H(i);
    T3(i) = ( (F1(i)*T1 + F2(i)*T2 - F3(i)*T3(i-1)+Q/Cp)*Tm + M(i-1)*T3(i-1)  )/M(i);
    MT3(i)=M(i)*T3(i);
end

%Plot
figure
p1 = subplot(3,1,1)
plot(t,H)
title('Altura Caso 1: Flujo 1 y Flujo 2 constantes')
xlabel('t (s)')
ylabel('Altura (m)')

p2 = subplot(3,1,2)
plot(t,X3)
title('Concentracion Caso 1: Flujo 1 y Flujo 2 constantes')
xlabel('t (s)')
ylabel('% de X3 en solucion')

p3 = subplot(3,1,3)
plot (t, T3)
title('Temperatura Caso 1: Flujo 1 y Flujo 2 constantes')
xlabel('t (s)')
ylabel('Temperatura (癈)')

linkaxes([p1,p2,p3],'x')
%%
%Caso 2 flujo 1 aumentando y flujo 2 aumentando
F1 = 0.02*t;
F2 = 0.02*t;
%Iteraciones
for i=2:n+1
    F3(i)=Ks*sqrt(2*g*H(i-1));
    X3(i)=M3(i-1)/(dens*A*H(i-1));
    H(i) = Tm*(F1(i) + F2(i)-F3(i))/(dens*A) + H(i-1);
    M3(i) = Tm*(F1(i)*X1 + F2(i)*X2 - F3(i)*X3(i)) + M3(i-1);
    M(i) = dens*A*H(i);
    T3(i) = ( (F1(i)*T1 + F2(i)*T2 - F3(i)*T3(i-1)+Q/Cp)*Tm + M(i-1)*T3(i-1)  )/M(i);
    MT3(i)=M(i)*T3(i);
end

%Plot
figure
p1 = subplot(3,1,1)
plot(t,H)
title('Altura Caso 2: Flujo 1 aumentando y Flujo 2 aumentando')
xlabel('t (s)')
ylabel('Altura (m)')
p2 = subplot(3,1,2)
plot(t,X3)
title('Concentracion Caso 2: Flujo 1 aumentando y Flujo 2 aumentando')
xlabel('t (s)')
ylabel('% de X3 en solucion')
p3 = subplot(3,1,3)
plot (t, T3)
title('Temperatura Caso 2: Flujo 1 aumentando y Flujo 2 aumentando')
xlabel('t (s)')
ylabel('Temperatura (癈)')

linkaxes([p1,p2,p3],'x')
%plot (F1)
%figure 
%plot (F2)
%%
%Caso 3 flujo 1 aumentando y flujo 2 disminuyendo
F1 = 0.04*t
F2= (-0.04*t)+3 ;
%Iteraciones
for i=2:n+1
    F3(i)=Ks*sqrt(2*g*H(i-1));
    X3(i)=M3(i-1)/(dens*A*H(i-1));
    H(i) = Tm*(F1(i) + F2(i)-F3(i))/(dens*A) + H(i-1);
    M3(i) = Tm*(F1(i)*X1 + F2(i)*X2 - F3(i)*X3(i)) + M3(i-1);
    M(i) = dens*A*H(i);
    T3(i) = ( (F1(i)*T1 + F2(i)*T2 - F3(i)*T3(i-1)+Q/Cp)*Tm + M(i-1)*T3(i-1)  )/M(i);
    MT3(i)=M(i)*T3(i);
end

%Plot
figure
p1 = subplot(3,1,1)
plot(t,H)
title('Altura Caso 3: Flujo 1 aumentando y Flujo 2 disminuyendo')
xlabel('t (s)')
ylabel('Altura (m)')
p2 = subplot(3,1,2)
plot(t,X3)
title('Concentracion Caso 3: Flujo 1 aumentando y Flujo 2 disminuyendo')
xlabel('t (s)')
ylabel('% de X3 en solucion')
p3 = subplot(3,1,3)
plot (t, T3)
title('Temperatura Caso 3: Flujo 1 aumentando y Flujo 2 disminuyendo')
xlabel('t (s)')
ylabel('Temperatura (癈)')
%plot (F1)
%figure 
%plot (F2)
linkaxes([p1,p2,p3],'x')
%%
%Caso 4 flujo 1 disminuyendo y flujo 2 aumentando
F2 = 0.04*t
F1= (-0.04*t)+3 ;
%Iteraciones
for i=2:n+1
    F3(i)=Ks*sqrt(2*g*H(i-1));
    X3(i)=M3(i-1)/(dens*A*H(i-1));
    H(i) = Tm*(F1(i) + F2(i)-F3(i))/(dens*A) + H(i-1);
    M3(i) = Tm*(F1(i)*X1 + F2(i)*X2 - F3(i)*X3(i)) + M3(i-1);
    M(i) = dens*A*H(i);
    T3(i) = ( (F1(i)*T1 + F2(i)*T2 - F3(i)*T3(i-1)+Q/Cp)*Tm + M(i-1)*T3(i-1)  )/M(i);
    MT3(i)=M(i)*T3(i);
end

%Plot
figure
p1 = subplot(3,1,1)
plot(t,H)
title('Altura Caso 4: Flujo 1 disminuyendo y Flujo 2 aumentando')
xlabel('t (s)')
ylabel('Altura (m)')
p2 = subplot(3,1,2)
plot(t,X3)
title('Concentracion Caso 4: Flujo 1 disminuyendo y Flujo 2 aumentando')
xlabel('t (s)')
ylabel('% de X3 en solucion')
p3 = subplot(3,1,3)
plot (t, T3)
title('Temperatura Caso 4: Flujo 1 disminuyendo y Flujo 2 bajo')
xlabel('t (s)')
ylabel('Temperatura (癈)')
%plot (F1)
%figure 
%plot (F2)
linkaxes([p1,p2,p3],'x')
%%
%Caso 5 flujo 1 disminuyendo y flujo 2 disminuyendo
F1= (-0.04*t)+3 ;
F2= (-0.04*t)+3 ;
%Iteraciones
for i=2:n+1
    F3(i)=Ks*sqrt(2*g*H(i-1));
    X3(i)=M3(i-1)/(dens*A*H(i-1));
    H(i) = Tm*(F1(i) + F2(i)-F3(i))/(dens*A) + H(i-1);
    M3(i) = Tm*(F1(i)*X1 + F2(i)*X2 - F3(i)*X3(i)) + M3(i-1);
    M(i) = dens*A*H(i);
    T3(i) = ( (F1(i)*T1 + F2(i)*T2 - F3(i)*T3(i-1)+Q/Cp)*Tm + M(i-1)*T3(i-1)  )/M(i);
    MT3(i)=M(i)*T3(i);
end

%Plot
figure
p1 = subplot(3,1,1)
plot(t,H)
title('Altura Caso 5: Flujo 1 disminuyendo y Flujo 2 disminuyendo')
xlabel('t (s)')
ylabel('Altura (m)')
p2 = subplot(3,1,2)
plot(t,X3)
title('Concentracion Caso 5: Flujo 1 disminuyendo y Flujo 2 disminuyendo')
xlabel('t (s)')
ylabel('% de X3 en solucion')
p3 = subplot(3,1,3)
plot (t, T3)
title('Temperatura Caso 5: Flujo 1 disminuyendo y Flujo 2 disminuyendo')
xlabel('t (s)')
ylabel('Temperatura (癈)')
%plot (F1)
%figure 
%plot (F2)
linkaxes([p1,p2,p3],'x')
%% Control Caldera con FUZZY MF LOGIC Caso 1 Href=4m

n = 8000; %N煤mero de iteraciones
sys = readfis('caldera.fis')
%Condiciones iniciales
Href = 4;
dens = 2; %densidad del fluido
A = 10; %area del tanque
g=9.8; %Gravedad
Tm = 0.01; % tiempo de muestreo

%Creaci贸n de variables
H=zeros(n+1,1);
M=zeros(n+1,1);
X3=zeros(n+1,1);
M3=zeros(n+1,1);
T3=zeros(n+1,1);
F1=zeros(n+1,1);
F2=zeros(n+1,1);
F3=zeros(n+1,1);
Ks=zeros(n+1,1);%Apertura de la salida (entre 0 y 1)
H_error=zeros(n+1,1);
t=0:Tm:80;

X1=50;
X2=50;
T1=60;
T2=60;
Q=1;
Cp=1;%Calor especifico del agua 1

H(1) = 0.1; %Altura inicial del fluido
M(1) = dens*A*H(1); %Masa total almacenada
X3(1) = 15; %concentraci贸n inicial del soluto
M3(1) = dens*A*H(1)*X3(1);%Masa inicial en el tanque (cantidad de soluto)
T3(1) = 40; %Temperatura inicial

H_error(1) = Href - H(1);
u = evalfis(H_error(1),sys);
F1(2) = u(1);
Ks(2) = u(2);

%Iteraciones
for i=2:n+1
    F3(i)=Ks(i)*sqrt(2*g*H(i-1));
    X3(i)=M3(i-1)/(dens*A*H(i-1));
    H(i) = Tm*(F1(i) + F2(i)-F3(i))/(dens*A) + H(i-1);
    M3(i) = Tm*(F1(i)*X1 + F2(i)*X2 - F3(i)*X3(i)) + M3(i-1);
    M(i) = dens*A*H(i);
    T3(i) = ( (F1(i)*T1 + F2(i)*T2 - F3(i)*T3(i-1)+Q/Cp)*Tm + M(i-1)*T3(i-1)  )/M(i);
    MT3(i)=M(i)*T3(i);
    
    H_error(i) = Href - H(i);
    if(i<8000) %Calculus of the next output wil be made only until the 8000 iteration
        u = evalfis(H_error(i),sys);
        F1(i+1) = u(1);
        Ks(i+1) = u(2);
    end
end

figure
p1 = subplot(2,2,1);
plot(t, H);
title('Altura Caso 1 Href=4m')
xlabel('t (s)')
ylabel('Altura (m)')

p2 = subplot(2,2,2);
plot (t, H_error);
title('Error Caso 1 Href=4m')
xlabel('t (s)')
ylabel('Error (m)')

p3 = subplot(2,2,3)
plot (t, F1);
title('Salida control flujo 1 Href=4m')
xlabel('t (s)')
ylabel('Flujo 1 (m3/s)')

p4 = subplot(2,2,4)
plot (t, Ks);
title('Salida control valvula salida Href=4m')
xlabel('t (s)')
ylabel('Ks')

linkaxes([p1,p2,p3,p4],'x')
%% Control Caldera con FUZZY MF LOGIC Caso 2 Href rampa descendiente a 0m

n = 8000; %N煤mero de iteraciones
sys = readfis('caldera.fis')
%Condiciones iniciales
Href = (-0.04*t)+4;
dens = 2; %densidad del fluido
A = 10; %area del tanque
g=9.8; %Gravedad
Tm = 0.01; % tiempo de muestreo

%Creaci贸n de variables
H=zeros(n+1,1);
M=zeros(n+1,1);
X3=zeros(n+1,1);
M3=zeros(n+1,1);
T3=zeros(n+1,1);
F1=zeros(n+1,1);
F2=zeros(n+1,1);
F3=zeros(n+1,1);
Ks=zeros(n+1,1);%Apertura de la salida (entre 0 y 1)
H_error=zeros(n+1,1);
t=0:Tm:80;

X1=50;
X2=50;
T1=60;
T2=60;
Q=1;
Cp=1;%Calor especifico del agua 1

H(1) = 4; %Altura inicial del fluido
M(1) = dens*A*H(1); %Masa total almacenada
X3(1) = 15; %concentraci贸n inicial del soluto
M3(1) = dens*A*H(1)*X3(1);%Masa inicial en el tanque (cantidad de soluto)
T3(1) = 40; %Temperatura inicial

H_error(1) = Href(1) - H(1);
u = evalfis(H_error(1),sys);
F1(2) = u(1);
Ks(2) = u(2);

%Iteraciones
for i=2:n+1
    
    F3(i)=Ks(i)*sqrt(2*g*H(i-1));
    X3(i)=M3(i-1)/(dens*A*H(i-1));
    H(i) = Tm*(F1(i) + F2(i)-F3(i))/(dens*A) + H(i-1);
    M3(i) = Tm*(F1(i)*X1 + F2(i)*X2 - F3(i)*X3(i)) + M3(i-1);
    M(i) = dens*A*H(i);
    T3(i) = ( (F1(i)*T1 + F2(i)*T2 - F3(i)*T3(i-1)+Q/Cp)*Tm + M(i-1)*T3(i-1)  )/M(i);
    MT3(i)=M(i)*T3(i);
    
    H_error(i) = Href(i) - H(i);
    if(i<8000) %Calculus of the next output wil be made only until the 8000 iteration
        u = evalfis(H_error(i),sys);
        F1(i+1) = u(1);
        Ks(i+1) = u(2);
    end
end

figure
p1 = subplot(2,2,1);
plot(t, H);
title('Altura Caso 1 Href rampa descendente desde 4m')
xlabel('t (s)')
ylabel('Altura (m)')

p2 = subplot(2,2,2);
plot (t, H_error);
title('Error Caso 1 Href rampa descendente desde 4m')
xlabel('t (s)')
ylabel('Error (m)')

p3 = subplot(2,2,3)
plot (t, F1);
title('Salida control flujo 1 Href rampa descendente desde 4m')
xlabel('t (s)')
ylabel('Flujo 1 (m3/s)')

p4 = subplot(2,2,4)
plot (t, Ks);
title('Salida control valvula salida Href rampa descendente desde 4m')
xlabel('t (s)')
ylabel('Ks')

linkaxes([p1,p2,p3,p4],'x')