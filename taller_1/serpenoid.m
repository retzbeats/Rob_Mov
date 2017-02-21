function [q,qd,qdd,x,y] = serpenoid (n,a,b,c,w)
t = [0:0.1:9.9]; %con fi obtengo 100 posiciones (q);
beta = b/n;
gama = -c/n;
alpha = a*abs(sin(beta/2));
x(1) = 0;
y(1) = 0;

for ind=1:n
    for k=1:ind
    x(ind+1) = 1/n * cos(a*cos(k*b/n) + k*c/n)+x(ind);
    y(ind+1)= 1/n * sin(a*cos(k*b/n)+ k*c/n)+y(ind);
    end
end
    

for i=1:n-1
    for j=1:length(t)
    q(i,j) = alpha*sin(w*t(j)+(i-1)*beta)+gama;
    qd(i,j) = alpha*w*cos(w*t(j)+(i-1)*beta);
    qdd(i,j) = (-1)*alpha*w^2*sin(w*t(j)+(i-1)*beta);
    end
end
end