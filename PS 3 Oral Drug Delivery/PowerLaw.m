t = [1,2,3,4,6,8,10,12,16];
DER = 30; %mg

fit = zeros(3,2);

RETH = [42,56,70,82,101,99];
tvalid = t(1:length(RETH<0.9));
fit(1,:) = polyfit(log(tvalid),log(RETH(1:length(tvalid))),1);

RMETH = [13,25,31,42,58,70,85,101,100];
tvalid = t(1:length(RMETH<0.9));
fit(2,:) = polyfit(log(tvalid),log(RMETH(1:length(tvalid))),1);

ROS = [4,12,19,26,39,52,62,77,101];
tvalid = t(1:length(ROS<0.9));
fit(3,:) = polyfit(log(tvalid),log(ROS(1:length(tvalid))),1);

n = fit(:,1);

tpredict = 1:0.05:16;
Mpredict = zeros(3,length(tpredict));
figure;
hold on;
sz = 25;
scatter(t,[RETH,zeros(length(t)-length(RETH),1)'],'r');
scatter(t,[RMETH,zeros(length(t)-length(RMETH),1)'],'b');
scatter(t,[ROS,zeros(length(t)-length(ROS),1)'],'k');
colors = ['r';'b';'k'];
for i = 1:3
    Mpredict(i,:) = exp(fit(i,2))*tpredict.^(n(i));
    plot(tpredict,Mpredict(i,:),colors(i));
end
ylim([0 105])
xlabel('Time (hr)');
ylabel('Cumulative Release (%)');
legend({'ETHOCEL','METHOCEL','Osmotic Pump'});
lt12 = (log(50)-fit(:,2))./n;
t12 = exp(lt12);
tfull = exp(log(100)-fit(:,2))./n;