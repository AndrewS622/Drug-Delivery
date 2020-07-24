t = [0,1,3,7,14,21,28,35];
Cp = [0,3.2,1.6,1.8,1.3,1.5,1.8,2.2;
    0,2.7,1.9,2.6,2.8,3.6,5.8,3.9;
    0,1.8,2.0,2.9,12.5,11.2,13.5,2.6;
    0,10.6,1.5,13.5,19.6,6.2,2.0,1.1;
    0,7.2,25.3,26.3,5.6,2.1,1.3,0.3;
    0,18.6,32.3,21.6,4.6,1.1,0.3,0.1];
numform = size(Cp,1);
AUC = zeros(size(Cp,1),1);
burst = [3,5,4,12,8,15];
figure;
hold on;
for i = 1:numform
    plot(t,Cp(i,:),'--o');
    AUC(i) = trapz(t,Cp(i,:));
end
AUCd = AUC(4);
AUCnorm = AUC/AUCd;
xlabel('Time (days)');
ylabel('Plasma Concentration (ng/mL)');
legend(['A';'B';'C';'D';'E';'F']);
hold off;

figure;
hold on;
plot(burst',Cp(:,2),'o','LineStyle','none');
xlabel('Burst (%)');
ylabel('C_p at 24 hr. (ng/mL)');
[fit,p] = polyfit(burst',Cp(:,2),1);
b = [3:1:15];
C = fit(1)*b+fit(2);
plot(b,C,'k');
[burstcorr,pval] = corr(burst',Cp(:,2));
