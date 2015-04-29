function portfolioRisk = covar(a,b,c,d,e,stockWeight)
    correlationMat = [[a.Data.DailyReturns]' [b.Data.DailyReturns]' [c.Data.DailyReturns]' [d.Data.DailyReturns]' [e.Data.DailyReturns]'];
    correlationMat = corrcoef(correlationMat);
    wa = [stockWeight(1)*a.Info.AnnualisedVolatility stockWeight(2)*b.Info.AnnualisedVolatility stockWeight(3)*c.Info.AnnualisedVolatility stockWeight(4)*d.Info.AnnualisedVolatility stockWeight(5)*e.Info.AnnualisedVolatility];
    portfolioRisk = wa*correlationMat*wa'*10;
end
