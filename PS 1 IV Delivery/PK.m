t = [1:4,6,8,12,16];
Cp = [0.088,0.075,0.061,0.051,0.034,0.026,0.0115,0];
D = 10;

figure;
plot(t,log(Cp),'xk','LineStyle','none');
xlabel('Time');
ylabel(['lnC_p']);
title('Pharmacokinetic Analysis of Pacific1');
hold on;

[fit,p] = polyfit(t(1:end-1),log(Cp(1:end-1)),1);
time = [0:0.1:16];
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
ylabel(['C_p (',char(181),'g/mL)']);
title('Predicted and Actual Concentrations');
