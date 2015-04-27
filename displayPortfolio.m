function [] = displayPortfolio(portfolio, list)
    clc;
    disp('List of Top 10 Performing Portfolios');
    fprintf('No.\tStocks\t\t\t\tReturn\n');
    for i = 1:10
       fprintf('%d\t',i); 
       for j = 1:5
            fprintf('%s ', list{portfolio(i).Set(j)});
       end
       fprintf('\t\t%.2f\n', portfolio(i).Ratio);
    end
    
    disp('Press any key to continue.');
    pause('on');
    pause;
end