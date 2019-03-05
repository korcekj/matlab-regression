% Fitness function of polynomial regression
% Search space: -6 < x(i) < 6

function[Fit]=fitness(Pop, x, y)

    [lpop,lstring]=size(Pop); % Zistenie velkosti matrice Pop -> pocet riadkov, stlpcov
    
    for i = 1:lpop
        alphas=Pop(i,:);
        Fx(i,:)=polyval(alphas, x); % Vypocet funkcnych hodnot pre kazde x
        diff=abs(Fx(i,:)-y); % Vypocet rozdielu funkcnych hodnot 
        Fit(i)=sum(diff(:));
    end
    
end