MW = [422,394,388,465];
So = [11.2,4.6,2.9,5.8];
pka = [8.6,9.1,9.3,8.6];
ka = 10.^-(pka);

pH = [5,6,7];
H = 10.^-(pH);

Sw = zeros(length(pH),length(So));

for i = 1:length(pH)
    Sw(i,:) = So.*(1+H(i)./ka);
end