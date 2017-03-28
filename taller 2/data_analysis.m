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

for i=1 : size(raw_data,2)/2
    data(1,i*2-1) = raw_data(1,i*2);
    data(1,i*2) = raw_data(1,i*2);
    for j=2:size(raw_data,1)
        data(j,i*2-1) = data(j-1,i*2-1) + raw_data(j,i*2);
        data(j,i*2) = raw_data(j,i*2);
    end
end
data=data.*pulse_duration;
w = [angle./data(:,2) angle./data(:,4) angle./data(:,6) angle./data(:,8) angle./data(:,10)];
plot(data(:,1),w(:,1),data(:,3),w(:,2),data(:,5),w(:,3),data(:,7),w(:,4),data(:,9),w(:,5))
legend('motor at 20 percent','motor at 40 percent','motor at 60 percent','motor at 80 percent','motor at 100 percent')
%% Find tau of every signal

tau_levels=0.63*w(199,:);

for i=1:size(tau_levels,2)
    j = 1;
    while w(j,i)<tau_levels(i)
        j=j+1;
    end
    tau(i) = data(j,i);
end

plot(data(:,1),w(:,1))
hold on
plot(tau(i),'-o')


