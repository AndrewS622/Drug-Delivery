t = [24,48,96,168,336,504,672,840];
Cp = [0.3,0.2,0.3,8.2,9.0,7.5,0.2,0.1];
AUCLAI = trapz(t,Cp);
AUCLAImg = AUCLAI/35000000;
time = 0:840;
CpIV = (1/V1)*exp(-ke*time(1:673));
AUCIVmg = trapz(CpIV);

F = 100*AUCLAImg/AUCIVmg;
figure;
hold on;
plot(t,Cp,'-ok','LineStyle','none');
xlabel('Time (hr)');
ylabel('Plasma Concentration (ng/mL)');

%%%Interpolation stuff%%%
I1 = interp1(t,Cp,time,'linear');
I2 = interp1(t,Cp,time,'pchip');
I3 = interp1(t,Cp,time,'makima');
I4 = interp1(t,Cp,time,'spline');
plot(time,I1,'--r');
plot(time,I2,'--b');
plot(time,I3,'--k');
plot(time,I4,'--g');
%%%

legend({'Data','Linear','Pchip','Makima','Spline'});
hold off;

t1 = 0;
t2 = 336;
ttot = 0:(840+t2);
Cpinter = interp1(t,Cp,ttot,'pchip');
Cp1 = [zeros(1,t1),Cpinter(1:ttot(end)-t1+1)];
Cp2 = [zeros(1,t2),Cpinter(1:ttot(end)-t2+1)];
Cptot = Cp1+Cp2;
figure;
hold on;
plot(ttot,Cpinter,'--b');
plot(ttot,Cptot,'k');
xlabel('Time (hr.)');
ylabel('Predicted Plasma Concentration (ng/mL)');
hold off;
Cp504 = Cptot(505);
D2Occ = E(EC50,Cp504);