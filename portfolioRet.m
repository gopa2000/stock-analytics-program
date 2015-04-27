function maxReturn = portfolioRet(a,b,c,d,e)
    a1 = [10 10 10 10 60]; a2 = [10 10 10 20 50]; a3 = [10 10 10 30 40]; a4 = [10 10 20 20 40]; a5 = [10 20 20 20 30]; a6 = [20 20 20 20 20];
    a1 = perms(a1); a2 = perms(a2); a3 = perms(a3); a4 = perms(a4); a5 = perms(a5); a6 = perms(a6);
    a1 = unique(a1,'rows'); a2 = unique(a2,'rows'); a3 = unique(a3,'rows'); a4 = unique(a4,'rows'); a5 = unique(a5,'rows'); a6 = unique(a6,'rows');
    
    stockWeight = vertcat(a1,a2,a3,a4,a5,a6);
    clearvars a1 a2 a3 a4 a5 a6;
    
    for i = 1:length(stockWeight)
        expReturn(i,:) = [i  stockWeight(i,1)*a.Info.AnnualisedVolatility + stockWeight(i,2)*b.Info.AnnualisedVolatility + stockWeight(i,3)*c.Info.AnnualisedVolatility + stockWeight(i,4)*d.Info.AnnualisedVolatility + stockWeight(i,5)*e.Info.AnnualisedVolatility];
        %%stanDev(i,:) = [i std()];
    end
    risk=1;
    expReturnRatio = expReturn./risk;
    expReturnRatio = sortrows(expReturnRatio,-2);
    maxReturn = expReturnRatio(1,2);
end