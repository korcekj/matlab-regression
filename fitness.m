% Fitness function of polynomial regression
% Search space: -10 < x(i) < 10

function[Fit]=fitness(Pop, x, y)

    [lpop,lstring]=size(Pop); % Zistenie velkosti matrice Pop -> pocet riadkov, stlpcov
    
    for i = 1:lpop
        alphas=Pop(i,:);
        Fx(i,:)=polyval(alphas, x); % Vypocet funkcnych hodnot pre kazde x
        diff=abs(Fx(i,:)-y); % Vypocet rozdielu funkcnych hodnot 
        Fit(i)=sum(diff(:));
%         Fit(i)=0; % Inicializacia premennej k potrebnym vypoctom
%         for j = 1:lstring-1
%             Fit(i)=Fit(i)+diff(j); % spocitanie hodnot rozdielu -> vyhodnotenie fitness pre aktualny retazec
%         end
    end
    
end