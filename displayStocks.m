function [] = displayStocks(inp,list)
    %% Access global variables
    global HSI MTR CLP CPC AIA HUT ICB TEN LEN SWP CGL;
    loop = 0;
    while(loop == 0)
        clc;
        for i = 1:11
            fprintf('%d.\t%s\n',i,inp{i}(5:end-4));
        end
        fprintf('0. \tReturn to Main Menu\n');
        opt = input('Enter index number: ');
        switch(opt)
            case 1
                displayStockInfo(eval(sprintf('%s.Info',list{1})))
            case 2
                displayStockInfo(eval(sprintf('%s.Info',list{2})))
            case 3
                displayStockInfo(eval(sprintf('%s.Info',list{3})))
            case 4
                displayStockInfo(eval(sprintf('%s.Info',list{4})));
            case 5
                displayStockInfo(eval(sprintf('%s.Info',list{5})))
            case 6
                displayStockInfo(eval(sprintf('%s.Info',list{6})))
            case 7
                displayStockInfo(eval(sprintf('%s.Info',list{7})))
            case 8
                displayStockInfo(eval(sprintf('%s.Info',list{8})))
            case 9
                displayStockInfo(eval(sprintf('%s.Info',list{9})))
            case 10
                displayStockInfo(eval(sprintf('%s.Info',list{10})))
            case 11
                displayStockInfo(HSI) 
            case 0
                loop = 1;
            otherwise
                fprintf('Invalid option');
        end
    end
end 
