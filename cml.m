function [] = cml(HSI)
    AV = HSI.AnnualisedVolatility;
    MarketWeight = 0:0.1:1.5;
    RiskFreeWeight = 1:-0.1:-0.5;
    Risk(1) = 0;
    Return(1) = 0.5;
    for i = 2:length(MarketWeight)
        Risk(i) = sqrt(MarketWeight(i)^(2)*AV^(2));
        Return(i) = (MarketWeight(i)*AV)+(RiskFreeWeight(i)*0.5);
    end
    
    figure
    plot(Risk,Return);
    title('Capital Market Line');
    xlabel('Risk');
    ylabel('Return');
    grid on;
    grid minor;
end