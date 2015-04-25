function calData = getStockInfo(stock)
    % Calculated Stock Information according to stock prices from 1/4/14 -
    % 1/4/15
    Name = inputname(1);
    TradingDays = length(stock);
    AnnualReturn = ((stock(end).AdjClose/stock(1).AdjClose)-1)*100;
    AvgDailyReturn = ((sum([stock.DailyReturns]))/TradingDays)*100;
    AvgAnnualisedReturn = (AvgDailyReturn*TradingDays);
    DailyVolatility = (std([stock.DailyReturns]))*100;
    AnnualisedVolatility = (sqrt(TradingDays)*DailyVolatility);
    SharpeRatio = ((AvgAnnualisedReturn)-0.005)/AnnualisedVolatility;
    
    calData = struct('Name', Name,'TradingDays', TradingDays, 'AnnualReturn', AnnualReturn, 'AvgDailyReturn', AvgDailyReturn, 'AvgAnnualisedReturn', AvgAnnualisedReturn, 'DailyVolatility', DailyVolatility, 'AnnualisedVolatility', AnnualisedVolatility, 'SharpeRatio', SharpeRatio);
end