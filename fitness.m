% Fitness function of polynomial regression
% Search space: -6 < x(i) < 6

function[Fit]=fitness(Pop, x, y)

    [lpop,lstring]=size(Pop); % zistenie velkosti matrice Pop -> pocet riadkov, stlpcov
    
    for i = 1:lpop
        alphas=Pop(i,:); % vybranie jedneho jedinca z populacie
        Fx(i,:)=polyval(alphas, x); % vypocet funkcnych hodnot pre kazde x ako parameter
        diff=abs(Fx(i,:)-y); % vypocet rozdielu funkcnych hodnot 
        Fit(i)=sum(diff(:)); % priradenie rozdielu funkcnych hodnot na riadok i
    end
    
end