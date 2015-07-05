function [] = graphib()
    global HSI MTR CLP CPC AIA HUT ICB TEN LEN SWP WHS stockWeight Portfolio;
    pu = 0:0.1:1;
    od = 1:-0.1:0;
    
    iRet = 0.045;
    iRis = 0.090;cor=0.10;
    pRet = Portfolio(1).Return;
    pRis = Portfolio(1).Risk;
    
    for i=1:11
        y(i) = pu(i)*pRet + od(i)*iRet;
        if i==1
            x(i) = iRis;
        else if i == 11
            x(i) = pRis;
        else
            x(i) = sqrt((pu(i)^2)*((pRis)^2) + ((od(i)^2)*(iRis^2))+(2*od(i)*pRis*pu(i)*iRis*cor));
        end
    end
    
    [cmlRis cmlRet] = cml(HSI.Info);
    [porRis porRet] = efficiencyFrontier();
    
    %figure
    subplot(2,2,2);
    plot(x,y,cmlRis,cmlRet);
    xlabel('Risk');
    ylabel('Return'); 
    title('Ibond-Top Portfoio EF');
    
    subplot(2,2,1);
    plot(porRis,porRet);
    xlabel('Risk');
    ylabel('Return');
    title('Portfolio Return');
    
    weight = stockWeight(Portfolio(1).Weight,1:5);
    subplot(2,2,3);
    pie(weight);
    title('Stock weights of top portfolio');
    
    subplot(2,2,4);
    plot(y-0.5,x);
    title('Sharpe Ratio of I-Bond Portfolio');
    
end