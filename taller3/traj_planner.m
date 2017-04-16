function [ X Y Z VX VY VZ AX AY AZ t ] = traj_planner( type, arg1, arg2, arg3, arg4 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if type == 1 %Tipo lineal
    P0 = arg1(1,:); %Punto inicial
    Pf = arg1(2,:); %Punto final
    Vk = arg2; %Velocidad máxima
    pt=arg3; %porcentaje de velocidad
    t_muestreo = arg4; %tiempo de muestreo
    
    T = norm(Pf - P0)/(Vk * (1-pt)) %tiempo total
    tau = T * pt; %tiempo aceleracion
    n = ceil(T / (t_muestreo)) %puntos totales
    k = round(pt*n) %puntos aceleracion
    a = Vk/tau; %aceleracion
    t_muestreo = T/n%recalcular t_muestreo
    
    a_vect = a*(Pf-P0)/norm(Pf-P0);
    v_vect = Vk*(Pf-P0)/norm(Pf-P0);
    
    t = linspace(0,T,n)';
    X = zeros(n,1);
    Y = zeros(n,1);
    Z = zeros(n,1);
    VX = zeros(n,1);
    VY = zeros(n,1);
    VZ = zeros(n,1);
    AX= zeros(n,1);
    AY = zeros(n,1);
    AZ = zeros(n,1);
    

    AX(1:k) = a_vect(1);
    AX(n-k+1:n) = -a_vect(1);
    AY(1:k) = a_vect(2);
    AY(n-k+1:n) = -a_vect(2);
    AZ(1:k) = a_vect(3);
    AZ(n-k+1:n) = -a_vect(3);
    
    X(1) = P0(1);
    Y(1) = P0(2);
    Z(1) = P0(3);
    for i=2 : n
        if i <= k
            %Velocidades
            VX(i) = a_vect(1)*t_muestreo + VX(i-1);
            VY(i) = a_vect(2)*t_muestreo + VY(i-1);
            VZ(i) = a_vect(3)*t_muestreo + VZ(i-1);
        elseif i <= n-k
            VX(i) = v_vect(1);
            VY(i) = v_vect(2);
            VZ(i) = v_vect(3);
        else
            VX(i) = -a_vect(1)*t_muestreo + VX(i-1);
            VY(i) = -a_vect(2)*t_muestreo + VY(i-1);
            VZ(i) = -a_vect(3)*t_muestreo + VZ(i-1);
        end
        
        X(i)= (AX(i-1)*t_muestreo^2)/2 + VX(i-1)*t_muestreo + X(i-1);
        Y(i)= AY(i-1)*t_muestreo^2/2 + VY(i-1)*t_muestreo + Y(i-1);
        Z(i)= AZ(i-1)*t_muestreo^2/2 + VZ(i-1)*t_muestreo + Z(i-1);
        
    end
    
else %tipo spline
    d = arg1; %Puntos de control
    Tiempos = arg2; %Vector de tiempos para cada punto de control
    Vi = arg3(1,:); %velocidad Inicial
    Vf = arg3(2,:); %Velocidad final
    t_muestreo = arg4; %tiempo de muestreo
    n=size(d,1); %numero de puntos
    
    h = zeros(n-1,1);
    A = zeros(n,n);
    f = zeros(n,3);
    
    %calculate h
    h = diff(Tiempos);
    
    % Calculate the matrix A
    A(1,1) = 2*h(1);
    A(1,2) = h(1);
    for i = 2 : n-1
        A(i,i-1) = h(i-1);
        A(i,i) = 2*(h(i-1) + h(i));
        A(i,i+1) = h(i);
    end
    A(n,n-1) = h(n-1);
    A(n,n) = 2*h(n-1);
    
    %Calculate f
    f(1,:) = 3*(d(2,:)-d(1,:))/h(1) - 3*Vi;
    for i = 2 : n-1
       f(i,:) = 3*(d(i+1,:) - d(i,:))/h(i) - 3*(d(i,:) - d(i-1,:))/h(i-1);
    end
    f(n,:) = 3*Vf - 3*(d(n,:) - d(n-1,:))/h(n-1);
    
    
    
    X = zeros(n,1);
    Y = zeros(n,1);
    Z = zeros(n,1);
    t = [Tiempos(1):t_muestreo:Tiempos(n)];
    
    b=inv(A)*f;
    
    Polx = zeros(n-1,4);
    Poly = zeros(n-1,4);
    Polz = zeros(n-1,4);
    
    for i = 1: n-1
        Polx(i,1) = (b(i+1,1)-b( i,1)) / ( 3 * h(i)); %calculate coefficient a
        Polx(i,2) = b(i,1); %calculate coefficient b
        Polx(i,3) = (d(i+1,1) - d(i,1))/h(i) - h(i)*(2*b(i,1)+b(i+1,1))/3; %calculate coefficient c
        Polx(i,4) = d(i,1); %calculate coefficient d
        
        Poly(i,1) = (b(i+1,2)-b( i,2)) / ( 3 * h(i)); %calculate coefficient a
        Poly(i,2) = b(i,2); %calculate coefficient b
        Poly(i,3) = (d(i+1,2) - d(i,2))/h(i) - h(i)*(2*b(i,2)+b(i+1,2))/3; %calculate coefficient c
        Poly(i,4) = d(i,2); %calculate coefficient d
        
        Polz(i,1) = (b(i+1,3)-b( i,3)) / ( 3 * h(i)); %calculate coefficient a
        Polz(i,2) = b(i,3); %calculate coefficient b
        Polz(i,3) = (d(i+1,3) - d(i,3))/h(i) - h(i)*(2*b(i,3)+b(i+1,3))/3; %calculate coefficient c
        Polz(i,4) = d(i,3); %calculate coefficient d
    end
    
    % Evaluate point in polynomials 
    k = 1; 
    for i=1 : size(t,2)
        X(i) = polyval(Polx(k,:),t(i)-Tiempos(k));
        Y(i) = polyval(Poly(k,:),t(i)-Tiempos(k));
        Z(i) = polyval(Polz(k,:),t(i)-Tiempos(k));
        
        if t(i) > Tiempos(k+1)
            k = k + 1;
        end
    end
    
    VX=diff(X)/t_muestreo;
    VY=diff(Y)/t_muestreo;
    VZ=diff(Z)/t_muestreo;
    
    AX=diff(VX)/t_muestreo;
    AY=diff(VY)/t_muestreo;
    AZ=diff(VZ)/t_muestreo;
    
    VX=[VX ; VX(size(VX,1))]
    VY=[VY ; VY(size(VY,1))]
    VZ=[VZ ; VZ(size(VZ,1))]
    
    AX=[AX(1) ; AX ; AX(size(AX,1))]
    AY=[AY(1) ; AY ; AY(size(AY,1))]
    AZ=[AZ(1) ; AZ ; AZ(size(AZ,1))]
end


end

