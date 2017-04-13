%% Import data
importfile('20percent.txt');
importfile('40percent.txt');
importfile('60percent.txt');
importfile('80percent.txt');
importfile('100percent.txt');

raw_data = [x20percent x40percent x60percent x80percent x100percent];
plot(raw_data(:,1),raw_data(:,2),raw_data(:,3),raw_data(:,4),raw_data(:,5),raw_data(:,6),raw_data(:,7),raw_data(:,8),raw_data(:,9),raw_data(:,10))
legend('motor at 20 percent','motor at 40 percent','motor at 60 percent','motor at 80 percent','motor at 100 percent')
%% Process data

pulse_duration= 2.1309e-005; %found experimental
angle = 2.25*pi/180; %from encoder

for i=1 : size(raw_data,2)/2 %to eliminate the "items" columns moves only on the 5 columns of encoder data
    data(1,i*2-1) = raw_data(1,i*2); %data fila 1 columna impar = primer dato en la columna par raw (encoder pulse) 
    data(1,i*2) = raw_data(1,i*2); %data fila 1 columna par = primer dato en la columna par?? raw (encoder pulse)
    for j=2:size(raw_data,1)% data fila j (arrancando en la 2) recorriendo todas las filas de raw
        data(j,i*2-1) = data(j-1,i*2-1) + raw_data(j,i*2);
        % data fila j columna impar = dato fila anterior columna impar + raw en columna par (encoder pulse)
        data(j,i*2) = raw_data(j,i*2); % data fila j columna par = raw columna par
    end
end
%data: primera fila son los primeros datos de pulsos del encoder
%segunda fila es el dato anterior de pulsos del encoder más el dato actual
%cada columna impar es el tiempo total (pulsos) hasta ese punto
%cada columna par es el delta de tiempo (pulsos)
data=data.*pulse_duration;
w = [angle./data(:,2) angle./data(:,4) angle./data(:,6) angle./data(:,8) angle./data(:,10)];
%la velocidad angular es el angulo recorrido sobre el delta de tiempo
figure
plot(data(:,1),w(:,1),data(:,3),w(:,2),data(:,5),w(:,3),data(:,7),w(:,4),data(:,9),w(:,5))
%la grafica es del tiempo total vs la velocidad angular en ese momento
legend('motor at 20 percent','motor at 40 percent','motor at 60 percent','motor at 80 percent','motor at 100 percent')
hold on
%% Find gain(k) and tau of every signal

tau_levels=0.63*w(199,:);
%el punto para hallar los tau es el 63% del valor final

for i=1:size(tau_levels,2)
    %recorre las columnas de tau levels (cada columna corresponde
    %a un w con diferente ciclo util
    %La ganancia de la planta sera el valor final de velocidad sobre el ciclo
    %util empleado
    k(i)= w(199,i)/(0.2*i);
    
    j = 1;
    while w(j,i)<tau_levels(i)
        j=j+1;
    end
    %tau(i) = data(j,i);%deberia ser solo de las columnas impares porque en las pares esta es el delta de tiempo
    tau(i) = data(j,i*2-1);
    plot(tau(i),1,'-o')%grafica sobre linea de valor 1 los tau para los diferentes ciclos utiles
    k_const = k(i)*ones(1,size(data,1)) ;% para dibujar linea constante representando la ganancia
    plot(data(:,i*2-1),k_const);
end
%% Plot the average values

tau_ave = mean(tau);
k_ave = mean(k);
plot(tau_ave,1,'-x')%grafica sobre linea de valor 1 el tau promedio
k_const = k_ave*ones(1,size(data,1));
plot(data(:,i*2-1),k_const,'-o');
hold off



