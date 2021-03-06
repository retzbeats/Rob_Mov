%% Evaluate all the values
%[SNAKE,PARAM]=snake_param();
t = [0:0.1:9.9]; %con fi obtengo 100 posiciones (q);
[q,qd,qdd,x,y]=serpenoid(12,pi/3,2*pi,1,1);
grav= [0,0,-9.81]
id = ID (SNAKE,PARAM,q, qd, qdd,grav,0)

%% Plot of q, qd and qdd under different parameters
figure
hold on
n=12;
a = pi/3;
b=10*pi;
c=0;
w=1;
[q,qd,qdd,x,y]=serpenoid(n,a,b,c,w);
plot(t,q(1,:),'color',rand(1,3), 'LineWidth',3);
plot(t,qd(1,:),'color',rand(1,3), 'LineWidth',3);
plot(t,qdd(1,:),'color',rand(1,3), 'LineWidth',3);
title('Comportamiento de q1, q1d, q1dd. ');
xlabel('tiempo (s)') % x-axis label
ylabel('sine and cosine values') % y-axis label
legend('q1','dq1','ddq1')
hold off

%% Serpenoid curve changing a
figure
hold on
n=12;
b=2*pi;
c=0;
w=1;
[q,qd,qdd,x,y]=serpenoid(n,pi/3,b,c,w); %a = pi/3
plot (x,y ,'color',rand(1,3), 'LineWidth',3);
[q,qd,qdd,x,y]=serpenoid(n,pi/2,b,c,w); %a = pi/2
plot (x,y , 'color',rand(1,3), 'LineWidth',3);
[q,qd,qdd,x,y]=serpenoid(n,2*pi/3,b,c,w); %a = 2pi/3
plot (x,y , 'color', rand(1,3), 'LineWidth',3);
title('Curvas serpenoides variando a. b=pi/2, c=0');
xlabel('x[m]') % x-axis label
ylabel('y[m]') % y-axis labe
legend('a=pi/3','a=pi/2','a=2pi/3')
hold off

%% Serpenoid curve changing b
figure
hold on
n=12;
a=pi/2;
c=0;
w=2;
[q,qd,qdd,x,y]=serpenoid(n,a,2*pi,c,w); %b = 2pi
plot (x,y ,'color',rand(1,3), 'LineWidth',3);
[q,qd,qdd,x,y]=serpenoid(n,a,3*pi,c,w); %b = 3pi
plot (x,y , 'color',rand(1,3), 'LineWidth',3);
[q,qd,qdd,x,y]=serpenoid(n,a,4*pi,c,w); %b = 4pi
plot (x,y , 'color', rand(1,3), 'LineWidth',3);
title('Curvas serpenoides variando b. a=pi/2, c=0');
xlabel('x[m]') % x-axis label
ylabel('y[m]') % y-axis labe
legend('b=2pi','b=3pi','c=4pi')
hold off

%% Serpenoid curve changing c
figure
hold on
n=12;
a=pi/3;
b=3*pi;
w=2;
[q,qd,qdd,x,y]=serpenoid(n,a,b,0,w); %b = 2pi
plot (x,y ,'color',rand(1,3), 'LineWidth',3);
[q,qd,qdd,x,y]=serpenoid(n,a,b,pi/2,w); %b = 3pi
plot (x,y , 'color',rand(1,3), 'LineWidth',3);
[q,qd,qdd,x,y]=serpenoid(n,a,b,pi,w); %b = 4pi
plot (x,y , 'color', rand(1,3), 'LineWidth',3);
title('Curvas serpenoides variando c. a=pi/3, b=3*pi');
xlabel('x[m]') % x-axis label
ylabel('y[m]') % y-axis labe
legend('c=0','c=pi/2','c=pi')
hold off

%% Behaviour of all qs
n=12;
a=pi/3;
b=3*pi;
w=1;
c=2;
[q,qd,qdd,x,y]=serpenoid(n,a,b,c,w); %b = 2pi

figure
for i=1:11
    plot(t,q(i,:),'color',rand(1,3));
    hold on
end
hold off
title('Graph of Sine and Cosine Between -2\pi and 2\pi');
xlabel('tiempo [s]') % x-axis label
ylabel('fi [rad]') % y-axis label
legend('q1','q2','q3','q4','q5','q6','q7','q8','q9','q10','q11')


%% Calculate torques 
n=12;
a = pi/3;
b=2*pi;
c=3;
w=1;
[q,qd,qdd,x,y]=serpenoid(n,a,b,c,w);
id = ID (SNAKE,PARAM,q, qd, qdd,grav,0);

figure
for i=1:11
    plot(t,id(i,:),'color',rand(1,3), 'LineWidth',1.5);
    hold on
end
legend('tau1','tau2','tau3','tau4','tau5','tau6','tau7','tau8','tau9','tau10','tau11')
xlabel('tiempo [s]') % x-axis label
ylabel('Torque [Nm]') % y-axis label
hold off