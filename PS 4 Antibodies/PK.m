t = [0.5:0.5:4,5,6,7,8,10,12,14,16];
% days
Pancomab = [21 17 15 12 11 9 7 6 4 3 2 1 1 0.4 0.2 0.1;23 21 20 18 17 16 14 13 11 10 8 7 5 4 3 2;24 23 22 21 20 19 18 18 16 15 14 13 11 9 7 6;24 24 23 22 22 21 21 20 19 18 17 16 15 13 12 11];
% ug/mL
s = size(Pancomab);
weight = 5; %kg
Volperkg = 40; %mL/kg
Doseperkg = 1; %mg/kg
Vplasma = Volperkg * weight; %mL
Dose = 1000*Doseperkg * weight; %ug

colors = ['k';'b';'r';'g'];
figure;
hold on;
for i = 1:s(1)
   plot(t,log(Pancomab(i,:)),['o',colors(i)]); 
end
legend({'Pancomab','PancomabF','PancomabG','PancomabH'});
xlabel('Time (days)');
ylabel('Natural Log of Plasma Concentration');
hold off;

for i = 1:s(1)
    fit(i,:) = polyfit(t,log(Pancomab(i,:)),1);
end

k = -fit(:,1);
t12 = log(2)./k;
Vd = Dose./exp(fit(:,2));

tfit = 0:0.5:16;
modelfit = (Dose./Vd).*exp(-k*tfit);
figure;
hold on;
for i = 1:s(1)
    plot(t,Pancomab(i,:),['o',colors(i)]);
end
for i = 1:s(1)
    plot(tfit,modelfit(i,:),colors(i));
end
legend({'Pancomab','PancomabF','PancomabG','PancomabH'});
xlabel('Time (days)');
ylabel('Plasma Concentration (\mu g/mL)');