xS=[1 2 4 6]; % x-hodnoty
yS=[1.005 3.94 1.62 4.58]; % y-hodnoty
alphas=[0.075 -0.57 0 5.8 -4.3]; % predpokladane hodnoty alpha

wx=-6:0.1:8;

numcykle=1000;	% pocet generacii
lpop=30; % velkost populacie
Space=[ones(1,5)*(-6);ones(1,5)*6]; % rozsah hodnot urceny od -6 do 6 
Pop=genrpop(lpop,Space); % generovanie populacie z daneho rozsahu

Fit=fitness(Pop, xS, yS); % vyhodnotenie jedincov fitness funkciou
[minFit, indx]=min(Fit); % najdenie najlepsieho (minimalneho) retazca
minRet=Pop(indx,:); % ulozenie najlepsieho retazca do pomocnej premennej
grafFit=zeros(1,numcykle); % vytvorenie grafu pre zobrazenie genetickeho algoritmu

for i=1:numcykle
    NewPop1 = selbest(Pop, Fit, [2 0]); % vyber 2 najlepsich jedincov
    NewPop3 = seltourn(Pop, Fit, 13); % vyber 13 jedincov turnajovym vyberom
    NewPopBest = [NewPop1; NewPop3]; % spojenie vybranych populacii do matice
    CrossedPop1=crossov(NewPopBest, 2, 0); % nahodne krizenie dvoch parentov
    MutedPopX1=mutx(CrossedPop1, 0.1, Space); % globalna mutacia
    MutedPopA1=muta(MutedPopX1, 0.05, [6 6 6 6 6]*0.05, Space); % aditivna mutacia
    
    NewPopRand=selrand(Pop, Fit, 15); % nahodne vybrane ostatne chybajuce jedince do populacie
    CrossedPop2=crossov(NewPopRand, 2, 0); % nahodne krizenie dvoch parentov
    MutedPopX2=mutx(CrossedPop2, 0.25, Space); % globalna mutacia
    MutedPopA2=muta(MutedPopX2, 0.05, [6 6 6 6 6]*0.05, Space); % aditivna mutacia
    
    Pop=[MutedPopA1; MutedPopA2]; % Spojenie zmutovanych a skrizenych jedincov do matice

    Fit=fitness(Pop, xS, yS); % znovu vyhodnotenie fitness funkcie
    [minFitnew,indx]=min(Fit); % najdenie najlepsieho (minimalneho) retazca
    if minFitnew<minFit % porovnanie min. a v pripade potreby zmena min. hodnoty
        minFit=minFitnew;
        minRet=Pop(indx,:);
    end
    grafFit(i)=minFit; % ulozenie minimalnej hodnoty po kazdej generacii (iteracii)
end

eqS=[minRet; alphas]
fxS=[polyval(minRet, xS); yS]
minFit
    
plot(xS, yS, ':s', 'MarkerSize', 6, 'MarkerFaceColor', 'b');
hold on
plot(wx, polyval(minRet, wx), 'r');
axis([-4 8 -4 8]);
xlabel('(x)');
ylabel('(y)');
legend('body', 'polynomialna regresia');
 
% plot(grafFit, 'r');