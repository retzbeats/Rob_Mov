pulse_duration= 2.1309e-005;
angle = 2.25*pi/180;

a_t(1,1) = a(1,2);
for i=2 : size(a,1)
    a_t(i,1) = a_t(i-1,1) + a (i,2);
    a_t(i,2) = a(i,2)
end
a_t=a_t*pulse_duration;
w=angle./a_t(:,2)
plot(a_t(:,1),w)

tau_level=0.63*w(199);

i = 1;
while w(i)<tau_level
    i=i+1;
end
tau = a_t(i,1)
