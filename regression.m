xS=[1 2 4 6];
yS=[1 4 2 5];

numcykle=1000;	% pocet generacii
lpop=30; % velkost populacie
Space=[ones(1,5)*(-6);ones(1,5)*6]; % rozsah hodnot urceny od -10 do 10 
Pop=genrpop(lpop,Space); % generovanie populacie z daneho rozsahu

Fit=fitness(Pop, xS, yS) ;% vyhodnotenie jedincov fitness funkciou
[minFit, indx]=min(Fit) ;% najdenie najlepsieho (minimalneho) retazca
minRet=Pop(indx,:); % ulozenie najlepsieho retazca do pomocnej premennej
grafFit=zeros(1,numcykle);

for i=1:numcykle
%     NewPop1=selbest(Pop, Fit, [3 1]) % 3 najlepsich a 1 nahodny vyber prvkov
    NewPop1 = selbest(Pop, Fit, [1 0]);
    NewPop3 = seltourn(Pop, Fit, 3);
    
    NewPop4 = [NewPop1; NewPop3];
    NewPop2=selrand(Pop, Fit, 26); % nahodne vybrane ostatne chybajuce prvky do poppulacie
    
    CrossedPop=crossov(NewPop2, 2, 1); % krizenie
    MutedPopX=mutx(CrossedPop, 0.2, Space); % mutacia
    MutedPopA=muta(MutedPopX, 0.3, [1 1 1 1 1]*0.3, Space); % mutacia
    
    Pop=[NewPop1; MutedPopA]; % Spojenie najlepsich a zmutovanych jedincov

    Fit=fitness(Pop, xS, yS); % znovu vyhodnotenie fitness funkcie
    [minFitnew,indx]=min(Fit); % najdenie najlepsieho (minimalneho) retazca
    if minFitnew<minFit % porovnanie min. a v pripade potreby zmena min. hodnoty
        minFit=minFitnew;
        minRet=Pop(indx,:);
    end
    grafFit(i)=minFit; % ulozenie minimalnej hodnoty po kazdej generacii (iteracii)
end
    
minFit
% minRet
    
plot(xS, yS, ':s', 'MarkerSize', 6, 'MarkerFaceColor', 'b');
axis([0 10 0 10]);
hold on
plot(xS, polyval(minRet, xS), 'r');
    
% plot(grafFit, 'r');