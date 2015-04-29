function [maxReturn retWeight] = portfolioRet(a,b,c,d,e)
    global stockWeight;
    
    % Initialising variables.
    expReturn = zeros(length(stockWeight),2);
    expRisk = zeros(length(stockWeight),2);
    ratioMat = zeros(length(stockWeight),2);
    
    for i = 1:length(stockWeight)
        expReturn(i,:) = [i stockWeight(i,1)*a.Info.AnnualisedVolatility + stockWeight(i,2)*b.Info.AnnualisedVolatility + stockWeight(i,3)*c.Info.AnnualisedVolatility + stockWeight(i,4)*d.Info.AnnualisedVolatility + stockWeight(i,5)*e.Info.AnnualisedVolatility];
        expRisk(i,:) = [i calRisk(a,b,c,d,e,stockWeight(i,:))];
        ratioMat(i,1) = i;
        ratioMat(i,2) = expReturn(i,2)/expRisk(i,2);
    end
    ratioMat = sortrows(ratioMat,-2);
    retWeight = ratioMat(1,1);
    expReturn = sortrows(expReturn,-2);
    maxReturn = expReturn(1,2);
end