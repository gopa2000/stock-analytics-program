function [] = portfolioOptimisation(list)
    %% To access globals
    global HSI MTR CLP CPC AIA HUT ICB TEN LEN SWP CGL;
    
    %% Generate all possible combination of 5 in the given set of stocks.
    combos = nchoosek(1:8, 5);
    RatioMatrix = zeros(length(combos),2);
    for i = 1:length(combos)
        PortfolioRatio = portfolioRet(eval(list{combos(i,1)}),eval(list{combos(i,2)}),eval(list{combos(i,3)}),eval(list{combos(i,4)}),eval(list{combos(i,5)}));
        RatioMatrix(i,:) = [i PortfolioRatio];
    end
    
    RatioMatrix = sortrows(RatioMatrix, -2);
    Portfolio = struct('Ratio', RatioMatrix(1,2), 'Set', combos(RatioMatrix(1,1),:));
    
    for i=2:length(RatioMatrix)
        Portfolio(i).Ratio = RatioMatrix(i,2);
        Portfolio(i).Set = combos(RatioMatrix(i,1),:);
    end
    
    displayPortfolio(Portfolio, list);
end