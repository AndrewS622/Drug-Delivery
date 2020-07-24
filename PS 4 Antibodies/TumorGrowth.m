t = [0 3 6 9 12 15 18 21];
time = 0:0.5:21;
%days
Pancomab = [190 240 330 440 600 820 NaN NaN;170 230 290 370 480 600 770 NaN;160 220 270 350 430 500 640 780;180 210 270 310 370 450 520 640;170 200 240 280 320 380 440 500;190 190 210 240 280 300 330 360]';
%mm^3
Pancomabnorm = Pancomab./Pancomab(1,:);
s = size(Pancomab);

for i = 1:s(2)
    valid(i) = nnz(~isnan(Pancomab(:,i)));
    fit(i,:) = polyfit(t(2:valid)',log(Pancomab(2:valid,i)),1);
end

figure;
modelfit = exp(fit(:,2)).*exp(fit(:,1)*time);
hold on;
r = fit(:,1);
V0 = exp(fit(:,2));
colors = ['k';'b';'r';'g';'y';'c'];
for i = 1:s(2)
    plot(time,modelfit(i,:),colors(i));
end
for i = 1:s(2)
    plot(t,Pancomab(:,i),['o',colors(i)]);
end
xlabel('Time (days)');
ylabel('Tumor volume (mm^3)');
legend({'Pancomab','Pancomab8a','Pancomab8b','Pancomab8c','Pancomab8d','Pancomab8e'});
hold off;
ylim([0 1000]);

[p,t,stats]=anova2(Pancomab(1:6,:));
c = multcompare(stats);