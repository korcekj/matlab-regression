% points=[1 1; 2 4; 4 2; 6 5];
xS=[1 2 4 6];
yS=[1 4 2 5];

lpop=30;
Space=[ones(1,5)*(-10);ones(1,5)*10]; % treba urcit rozsah hodnot
Pop=genrpop(lpop,Space);

Fit=fitness(Pop, xS, yS)

plot(xS, yS, ':s', 'MarkerSize', 6, 'MarkerFaceColor', 'b');
axis([0 8 0 8]);
hold on