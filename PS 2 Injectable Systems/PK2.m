t = [1,2,4,8,24,48,72,96,120];
Cp = [9.9,9.6,8.9,7.8,5.4,2.4,1.2,0.6,0.2];
D = 2000000;

figure;
plot(t,log(Cp),'xk','LineStyle','none');
xlabel('Time');
ylabel(['lnC_p']);
title('Pharmacokinetic Analysis for 2 mg Bolus');
hold on;

[fit,p] = polyfit(t(1:end-1),log(Cp(1:end-1)),1);
time = [0:0.5:120];
modellogCp = fit(1)*time+fit(2);
SSE = 0;
for i = 1:length(Cp)-1
    SSE = SSE + (fit(1)*t(i)+fit(2)-log(Cp(i)))^2;
end
plot(time, modellogCp,'k');
hold off;
V1 = D/exp(fit(2));
ke = -fit(1);
t12 = log(2)/ke;

figure;
plot(t,Cp,'xk','LineStyle','none');
hold on;
modelCp = (D/V1)*exp(-ke*time);
plot(time,modelCp,'k');
xlabel('Time');
ylabel(['C_p (ng/mL)']);
title('Predicted and Actual Concentrations');
