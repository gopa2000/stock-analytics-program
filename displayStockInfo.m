function [] = displayStockInfo(stock)
    clc;
    %% fprintf('Name:\t%s\n',Name);
    fprintf('Annual return:\t%.2f\n',stock.AnnualReturn);
    fprintf('Average Daily Return:\t%.2f\n', stock.AvgDailyReturn);
    fprintf('Average Annualised Return:\t%.2f\n',stock.AvgAnnualisedReturn);
    fprintf('Daily Volatility:\t%.2f\n',stock.DailyVolatility);
    fprintf('Annualised Volatility:\t%.2f\n', stock.AnnualisedVolatility);
    fprintf('Sharpe Ratio:\t%.2f\n', stock.SharpeRatio);
    
    %% I'm using pause since waitforbuttonpress opens an unwanted figure.
    fprintf('Press any key to continue.');
    pause('on');
    pause;
end