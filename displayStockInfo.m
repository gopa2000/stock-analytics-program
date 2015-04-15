function [] = displayStockInfo(stock)
    % Calculated Stock Information according to stock prices from 1/4/14 -
    % 1/4/15
    
    %% Still gotta figure this out.
    %% Name = varname('stock');
    TradingDays = length(stock);
    AnnualReturn = ((stock(end).AdjClose/stock(1).AdjClose)-1)*100;
    AvgDailyReturn = ((sum([stock.DailyReturns]))/TradingDays)*100;
    AvgAnnualisedReturn = (AvgDailyReturn*TradingDays);
    DailyVolatility = (std([stock.DailyReturns]))*100;
    AnnualisedVolatility = (sqrt(TradingDays)*DailyVolatility);
    SharpeRatio = ((AvgAnnualisedReturn)-0.005)/AnnualisedVolatility;
    
    clc;
    %% fprintf('Name:\t%s\n',Name);
    fprintf('Annual return:\t%.2f\n',AnnualReturn);
    fprintf('Average Daily Return:\t%.2f\n', AvgDailyReturn);
    fprintf('Average Annualised Return:\t%.2f\n',AvgAnnualisedReturn);
    fprintf('Daily Volatility:\t%.2f\n',DailyVolatility);
    fprintf('Annualised Volatility:\t%.2f\n', AnnualisedVolatility);
    fprintf('Sharpe Ratio:\t%.2f\n', SharpeRatio);
    
    %% I'm using pause since waitforbuttonpress opens an unwanted figure.
    fprintf('Press any key to continue.');
    pause('on');
    pause;
end