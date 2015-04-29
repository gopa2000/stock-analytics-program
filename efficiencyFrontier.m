function [x y] = efficiencyFrontier()
    global HSI MTR CLP CPC AIA HUT ICB TEN LEN SWP WHS stockWeight Portfolio;
    pu = 0:0.1:1;
    od = 1:-0.1:0;
    
     %ibondInt = 0.0450;
     %ibondRis = 0.1250;
    pRet1 = Portfolio(1).Return;
    pRis1 = Portfolio(1).Risk;
    pRet2 = Portfolio(200).Return;
    pRis2 = Portfolio(200).Risk;
    
    for i=1:11
        y(i) = pu(i)*pRet1 + od(i)*pRet2;
        if i==1
            x(i) = pRis2;
        else if i == 11
            x(i) = pRis1;
        else
            x(i) = sqrt((pu(i)^2)*((pRis1)^2) + ((od(i)^2)*(pRis2^2))+(2*od(i)*pRis1*pu(i)*pRis2*0.28));
        end
    end
   
    figure
    plot(x,y);
    xlabel('Risk');
    ylabel('Return');
end
