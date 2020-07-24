Doses = [2:2:8];
Week = [0:12];
ALT = [41 42 40 39 45 43 42 45 41 39 37 45 42;46 48 51 41 39 38 44 43 38 38 45 49 38;44 44 49 48 42 56 41 52 54 56 41 40 42;45 48 65 58 68 56 75 52 89 54 42 41 44;39 39 141 134 168 120 178 109 169 115 96 89 82]';
%U/L
[p,t,stats]=kruskalwallis(ALT);
results = multcompare(stats);
s = size(ALT);

figure;
hold on;
colors = ['k';'b';'r';'g';'c'];
for i = 1:s(2)
    plot(Week,ALT(:,i),['o',colors(i)]);
    mdl{i} = fitlm(Week(3:10)',ALT(3:10,i));
end
legend({'0 mg/kg','2 mg/kg','6 mg/kg','12 mg/kg','24 mg/kg'});
xlabel('Time (Weeks)');
ylabel('ALT Concentration (U/L)');
hold off;

