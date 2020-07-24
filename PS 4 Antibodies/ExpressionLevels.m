Patients = [1001:1008];
EHR1 = [76,103,36,85,77,102,45,72;1872,2085,1620,1540,1963,1452,3125,842]';
EHR2 = [655,136,89,1488,1672,89,705,968;1489,855,1540,1650,1430,102,1945,780]';
EHR3 = [89,94,54,78,65,15,56,90;654,56,410,580,68,54,62,48]';
% molecules/um2

EHRavg = [mean(EHR1(:,1)),mean(EHR1(:,2));mean(EHR2(:,1)),mean(EHR2(:,2));mean(EHR3(:,1)),mean(EHR3(:,2))];
EHRstd = [std(EHR1(:,1)),std(EHR1(:,2));std(EHR2(:,1)),std(EHR2(:,2));std(EHR3(:,1)),std(EHR3(:,2))];

RelExpavgEHR = EHRavg(:,2)./EHRavg(:,1);
RelExpstdEHR = EHRstd(:,2)./EHRstd(:,1);

RelExp = [EHR1(:,2)./EHR1(:,1),EHR2(:,2)./EHR2(:,1),EHR3(:,2)./EHR3(:,1)];
RelExpavg = [mean(RelExp(:,1)),mean(RelExp(:,2)),mean(RelExp(:,3))];
stdavg = [std(RelExp(:,1)),std(RelExp(:,2)),std(RelExp(:,3))];
stdavgnorm = stdavg./RelExpavg;