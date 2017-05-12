n = 8000; %NÃºmero de iteraciones

%CreaciÃ³n de variables
H=zeros(n+1,1);
M=zeros(n+1,1);
X3=zeros(n+1,1);
M3=zeros(n+1,1);
T3=zeros(n+1,1);
F3=zeros(n+1,1);
t=0:Tm:80;
%%
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
X3(1) = 15; %concentraciÃ³n inicial del soluto
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
plot(t,H)
title('Altura Caso 1: Flujo 1 y Flujo 2 constantes')
xlabel('t (s)')
ylabel('Altura (m)')
figure
plot(t,X3)
title('Concentración Caso 1: Flujo 1 y Flujo 2 constantes')
xlabel('t (s)')
ylabel('% de X3 en solución')
figure
plot (t, T3)
title('Temperatura Caso 1: Flujo 1 y Flujo 2 altos')
xlabel('t (s)')
ylabel('Temperatura (°C)')
%%
%Caso 2 flujo 1 aumentando y flujo 2 aumentando
F1 = 0.04*t;
F2= 0.04*t;
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
plot(t,H)
title('Altura Caso 2: Flujo 1 alto y Flujo 2 bajo')
xlabel('t (s)')
ylabel('Altura (m)')
figure
plot(t,X3)
title('Concentración Caso 2: Flujo 1 alto y Flujo 2 bajo')
xlabel('t (s)')
ylabel('% de X3 en solución')
figure
plot (t, T3)
title('Temperatura Caso 2: Flujo 1 alto y Flujo 2 bajo')
xlabel('t (s)')
ylabel('Temperatura (°C)')
plot (F1)
figure 
plot (F2)
%%
%Caso 2 flujo 1 aumentando y flujo 2 disminuyendo
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
plot(t,H)
title('Altura Caso 2: Flujo 1 alto y Flujo 2 bajo')
xlabel('t (s)')
ylabel('Altura (m)')
figure
plot(t,X3)
title('Concentración Caso 2: Flujo 1 alto y Flujo 2 bajo')
xlabel('t (s)')
ylabel('% de X3 en solución')
figure
plot (t, T3)
title('Temperatura Caso 2: Flujo 1 alto y Flujo 2 bajo')
xlabel('t (s)')
ylabel('Temperatura (°C)')
plot (F1)
figure 
plot (F2)
%%
%Caso 2 flujo 1 disminuyendo y flujo 2 aumentando
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
plot(t,H)
title('Altura Caso 2: Flujo 1 alto y Flujo 2 bajo')
xlabel('t (s)')
ylabel('Altura (m)')
figure
plot(t,X3)
title('Concentración Caso 2: Flujo 1 alto y Flujo 2 bajo')
xlabel('t (s)')
ylabel('% de X3 en solución')
figure
plot (t, T3)
title('Temperatura Caso 2: Flujo 1 alto y Flujo 2 bajo')
xlabel('t (s)')
ylabel('Temperatura (°C)')
plot (F1)
figure 
plot (F2)
%%
%Caso 2 flujo 1 disminuyendo y flujo 2 disminuyendo
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
plot(t,H)
title('Altura Caso 2: Flujo 1 alto y Flujo 2 bajo')
xlabel('t (s)')
ylabel('Altura (m)')
figure
plot(t,X3)
title('Concentración Caso 2: Flujo 1 alto y Flujo 2 bajo')
xlabel('t (s)')
ylabel('% de X3 en solución')
figure
plot (t, T3)
title('Temperatura Caso 2: Flujo 1 alto y Flujo 2 bajo')
xlabel('t (s)')
ylabel('Temperatura (°C)')
plot (F1)
figure 
plot (F2)