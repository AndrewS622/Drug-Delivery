E0 = mean([2,2,3,1,2,2]);
Cmax = [0.107,0.097,0.089,0.082,0.076,0.065];
mTNS = [13,13,12,11,9,7];
plot(Cmax,mTNS,'xk','LineStyle','none');

E = @(coeff,C) E0+coeff(1)*C.^coeff(2)./(coeff(3).^coeff(2)+C.^coeff(2));
cf = fitnlm(Cmax,mTNS,E,[13, 5, 0.065]);

Emax = cf.Coefficients.Estimate(1);
n = cf.Coefficients.Estimate(2);
EC50 = cf.Coefficients.Estimate(3);

Cmodel = 0:0.001:0.200;
Effect = E0 + Emax*Cmodel.^n./(EC50^n+Cmodel.^n);
Epredict = E0 + Emax*Cmax.^n./(EC50^n+Cmax.^n);
hold on;
plot(Cmodel, Effect,'k');
xlabel(['C_{max} (',char(181),'g/mL)']);
ylabel('mTNS at Six Weeks');
title('Peripheral Neuropathy Pharmacodynamic Analysis');
hold off;
