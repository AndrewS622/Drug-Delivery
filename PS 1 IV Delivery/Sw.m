l10Sw = @(Tm,T,lP) 0.8-0.01*(Tm-T)-lP

T = 25;
Tm = [343,205,195];
lp = [1.5,2.2,5.6];
Sw = zeros(1,3);

for i = 1:3
    lSw = l10Sw(Tm(i),T,lp(i));
    Sw(i) = 10^lSw;
end