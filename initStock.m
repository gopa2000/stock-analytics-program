function stock = initStock(input)
    Name = inputname(1);
    Name = Name(1:end-4);
    tmp = struct('Data', extractData(input)); 
    tmp.Info = getStockInfo(tmp.Data);
    tmp.Info.Name = Name;
    
    stock = tmp;
end