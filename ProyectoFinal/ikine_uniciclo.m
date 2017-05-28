function [ wr,wl ] = ikine_uniciclo(r,l,Vx,Vy,tm)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

n = size(Vx,1);
wl = zeros(n,1);
wr = zeros(n,1);
phi = zeros(n,1);
W = zeros(n,1);

phi(1) = atan2(Vy(1),Vx(1));
W(1) = 0;
wl(1) = ( Vy(1)/sin(phi(1)))/r;
wr(1) = ( 2*Vx(1)/cos(phi(1)) - Vy(1)/sin(phi(1)))/r;

for i = 2 : n
    phi(i) = atan2(Vy(i),Vx(i));
    W(i) = (abs(phi(i)) - abs(phi(i-1)))/tm;

    wl(i) = ( Vy(i)/sin(phi(i)) - W(i)*l)/r;
    wr(i) = ( 2*Vx(i)/cos(phi(i)) - Vy(i)/sin(phi(i)) + W(i)*l)/r;
end

end

