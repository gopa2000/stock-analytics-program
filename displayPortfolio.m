function [] = displayPortfolio(list)
    global stockWeight Portfolio;
    clc;
    disp('List of Top 10 Performing Portfolios');
    fprintf('No.\tStocks\t\t\t\tReturn\n');
    for i = 1:10
       fprintf('%d\t',i); 
       for j = 1:5
            fprintf('%s ', list{Portfolio(i).Set(j)});
       end 
       fprintf('\t\t%.2f\n\t', Portfolio(i).Ratio);
       for k = 1:5
            fprintf('%d%% ', stockWeight(Portfolio(i).Weight,k)*100);
       end
       fprintf('\n\n');
    end
    
    disp('Press any key to continue.');
    pause('on');
    pause;
end