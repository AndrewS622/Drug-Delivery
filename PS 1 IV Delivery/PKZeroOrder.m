tinf = [1,2,3,4,6,8,12];
D = 10;
num = length(tinf);
R = zeros(num,1);
ke = 0.1839;
V1 = 93.7881;
tmax = 24;
ttot = 0:0.01:24;
tlength = length(ttot);
Cp = zeros(num+1,tlength);
Cmax = zeros(num+1,1);
Cp(1,:)=(D/V1)*exp(-ke*ttot);
Cmax(1) = (D/V1);
figure;
plot(ttot,Cp(1,:),'k');
hold on;
for i = 1:num
    R(i) = D/tinf(i);
    ton = 0:0.01:tinf(i);
    Cp(i+1,1:length(ton)) = (R(i)/(V1*ke))*(1-exp(-ke*ton));
    toff = [tinf(i)+0.01:0.01:tmax];
    Cp(i+1,(length(ton)+1):tlength) = Cp(i+1,length(ton))*exp(-ke*(toff-tinf(i)));
    plot(ttot,Cp(i+1,:));
    Cmax(i+1) = Cp(i+1,length(ton));
end
title('Zero-Order Pharmacokinetics for Pacific1');
xlabel('Time (hr)');
ylabel(['C_p (',char(181),'g/mL)']);
legend('Bolus','1','2','3','4','6','8','12');
hold off;

figure;
plot([0,tinf],Cmax,'k');
xlabel('Infusion Time (hr)');
ylabel(['C_{max} (',char(181),'g/mL)']);
title('Maximum Concentration vs. Infusion Duration');