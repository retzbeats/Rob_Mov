n = 8000; %Número de iteraciones

%Creación de variables
H=zeros(n,1);
M=zeros(n,1);
X3=zeros(n,1);
M3=zeros(n,1);
T3=zeros(n,1);
F3=zeros(n,1);

%Condiciones iniciales
Ks = 0.5; %Apertura de la salida (entre 0 y 1)
dens = 1; %densidad del fluido
A = 1; %area del tanque
g=9.8; %Gravedad
Tm = 0.01; % tiempo de muestreo
F1 = 3*ones(n,1);
F2=0*ones(n,1);
X1=1;
X2=1;
T1=60;
T2=60;
Q=1;
Cp=1;

H(1) = 0.1; %Altura inicial del fluido
M(1) = dens*A*H(1); %Masa total almacenada
X3(1) = 15; %concentración inicial del soluto
M3(1) = dens*A*H(1)*X3(1);%Masa inicial en el tanque (cantidad de soluto)
T3(1) = 40; %Temperatura inicial

%Iteraciones
for i=2:n
    F3(i)=Ks*sqrt(2*g*H(i-1));
    X3(i)=M3(i-1)/(dens*A*H(i-1));
    H(i) = Tm*(F1(i) + F2(i)-F3(i))/(dens*A) + H(i-1);
    M3(i) = Tm*(F1(i)*X1 + F2(i)*X2 - F3(i)*X3(i)) + M3(i-1);
    M(i) = dens*A*H(i);
    T3(i) = ( (F1(i)*T1 + F2(i)*T2 - F3(i)*T3(i-1)+Q/Cp)*Tm + M(i-1)*T3(i-1)  )/M(i);
    MT3(i)=M(i)*T3(i);
end

%% Plot
plot(H)

plot(X3)