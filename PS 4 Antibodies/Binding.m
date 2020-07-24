Patients = [1001:1008];
N = length(Patients);

tscoreinv = tinv([0.025 0.975],N-1);
hAbka = [3.1,4.6,5.6,4.2,8.9,3.4,4.5,7.2;1.5,4.1,3.2,1.8,1.9,2.4,1.5,3.2;3.5,4.1,2.8,5.7,4.1,3.2,5.5,8.2]*10^5;
hAbkd = [1.5,1.6,1.3,1.8,3.0,1.2,1.1,1.8;1.9,2.5,3.6,4.9,8.7,4.7,4.8,7.6;9.8,7.3,12.8,9.7,13.0,14.8,6.9,13.2]*10^-4;
%(Ms)^-1 and s^-1, respectively
hAbKD = hAbkd./hAbka;
%M

meanval = mean(hAbKD,2);
stdval = std(hAbKD,0,2);
CI = [meanval + tscoreinv.*stdval./sqrt(N)];