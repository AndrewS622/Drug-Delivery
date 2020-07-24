t = [1,2,3,4,6,8,10,12,16,24];
time = 0:0.05:24;
DIR = 10*10^6;
DER = 30*10^6;
D = [DIR,DER,DER,DER];

Cp = [144,118,75,44,14,5,1,0,0,0;230,231,209,184,144,45,14,5,1,0;82,108,116,118,113,107,101,55,4,0;38,60,72,79,85,87,87,49,4,0];

figure;
hold on;
numform = size(Cp,1);
AUC = zeros(size(Cp,1),1);
AUCnorm = AUC;
RelExp = AUCnorm;
I = zeros(size(Cp,1),length(time));
Cmax = AUC;
Cmaxnorm = Cmax;
tabove40 = Cmax;
colors = ['y';'r';'b';'k'];
for i = 1:numform
    plot(t,Cp(i,:),['--o',colors(i)]);
    AUC(i) = trapz(t,Cp(i,:));
    AUCnorm(i) = AUC(i)./D(i);
    RelExp(i) = AUCnorm(i)/AUCnorm(1);
    I(i,:) = interp1(t,Cp(i,:),time,'pchip');
    Cmax(i) = max(I(i,:));
    Cmaxnorm(i) = Cmax(i)/Cmax(1);
    tabove40(i) = 0.05*sum(I(i,:)>40);
end
for i = 1:numform
     plot(time,I(i,:),colors(i));
end
xlabel('Time (hr)');
ylabel(['C_p (ng/mL)']);
title('Pharmacokinetic Analysis for 10 mg IR and 30 mg ER');
legend({'IR','ETHOCEL','METHOCEL','Osmotic Pump'});
tabove40data = [4;8;12;11];
