function[Fit]=fitness(Pop, x, y)

    [lpop,lstring]=size(Pop);
    
    for i = 1:lpop
        alphas=Pop(i,:);
        Fx(i,:)=polyval(alphas, x); % Vypocet funkcnych hodnot pre kazde x
        Fit(i,:)=abs(Fx(i,:)-y); % Vypocet rozdielu funkcnych hodnot 
    end
    
end