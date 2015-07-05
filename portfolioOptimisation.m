function [] = portfolioOptimisation(list)
    %% To access globals
    global HSI MTR CLP CPC AIA HUT ICB TEN LEN SWP WHS stockWeight Portfolio tmp;
    
    %% Initialise variables to optimize code.
    combos = zeros(252,5);
    RatioMatrix = zeros(length(combos),5);
    PortfolioReturn = zeros;
    retWeight = zeros;
    crisk = zeros;
    Ratio = zeros;
    
    %% Generate all possible combination of 5 in the given set of stocks.
    combos = nchoosek(1:10, 5);
    
    for i = 1:length(combos)
        [PortfolioReturn retWeight] = portfolioRet(eval(list{combos(i,1)}),eval(list{combos(i,2)}),eval(list{combos(i,3)}),eval(list{combos(i,4)}),eval(list{combos(i,5)}));
        crisk = calRisk(eval(list{combos(i,1)}),eval(list{combos(i,2)}),eval(list{combos(i,3)}),eval(list{combos(i,4)}),eval(list{combos(i,5)}),stockWeight(retWeight,:));
        Ratio = PortfolioReturn/crisk;
        RatioMatrix(i,1) = i;
        RatioMatrix(i,2) = PortfolioReturn;
        RatioMatrix(i,3) = crisk;
        RatioMatrix(i,4) = retWeight;
        RatioMatrix(i,5) = Ratio;
    end
      
    RatioMatrix = sortrows(RatioMatrix, -5);
    tmp = RatioMatrix;
    for i=1:length(RatioMatrix)
        Portfolio(i).Return = RatioMatrix(i,2);
        Portfolio(i).Risk = RatioMatrix(i,3);
        Portfolio(i).Ratio = RatioMatrix(i,5);
        Portfolio(i).Set = combos(RatioMatrix(i,1),:);
        Portfolio(i).Weight = RatioMatrix(i,4);
    end
    
    displayPortfolio(list);
end