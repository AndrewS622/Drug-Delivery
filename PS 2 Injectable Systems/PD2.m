Emax = 100;
n = 1;
Cp = [1.2,1.8,2.5,3,3.9,4.5,4.9,5.6,6.9,7.8,9,10.3,14.2,16.9];
D2 = [25,44,58,60,68,68,67,72,80,79,84,77,87,86];

figure;
hold on;
plot(Cp,D2,'ok','LineStyle','none');
xlabel('Steady-State C_p (ng/mL)');
ylabel('D2 Receptor Occupancy (%)');

E = @(coeff,C) Emax*C./(coeff+C);
cf = fitnlm(Cp,D2,E,2);

EC50 = cf.Coefficients.Estimate;

Cpmodel = [0:20];
D2model = E(EC50,Cpmodel);
plot(Cpmodel,D2model,'k');

bound1 = 65*ones(21,1);
bound2 = 80*ones(21,1);
plot(Cpmodel,bound1,'--b');
plot(Cpmodel,bound2,'--r');

hold off;