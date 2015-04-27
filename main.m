% GE1331 - Problem Solving Made Easy
% 2014/15 - Sem B
% Group Assignment - Analysing Public Stocks
%
%   Nitin Agrawal
%   Nikhil Sharma
%   Aditya Kedia    (53663012)
%   Dhruv Oberoi    (53790492)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Prep %
%
inp = {'csv/Cathay Pacifc (HK0293).csv'; 
    'csv/CLP Holding (HK0002).csv'; 
    'csv/MTR Corp (HK0066).csv'; 
    'csv/hsi.csv'; 'csv/AIA (HK1299).csv'; 
    'csv/ICBC (HK1398).csv'; 
    'csv/Tencent (HK0700).csv'; 
    'csv/Lenovo Group (HK0992).csv'; 
    'csv/Hutchison (HK0013).csv'; 
    'csv/Swire Pacific (HK0019).csv'; 
    'csv/Cheung Kong (HK0001) Stock.csv'};

% Input individual stock values:
global HSI MTR CLP CPC AIA HUT ICB TEN LEN SWP CGL;
CPC = initStock(inp{1});
CLP = initStock(inp{2});
MTR = initStock(inp{3});
HSI = initStock(inp{4});
AIA = initStock(inp{5});
ICB = initStock(inp{6});
TEN = initStock(inp{7});
LEN = initStock(inp{8});
HUT = initStock(inp{9});
SWP = initStock(inp{10});
CGL = initStock(inp{11});
clear inp;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

list = {'CPC';'CLP';'MTR';'AIA';'ICB';'TEN';'LEN';'HUT';'SWP';'CGL'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Menu %

prgEnd = false;

while(prgEnd == false)
    disp('Stock Analytics Program - GE1331: Problem Solving Made Easy');
    disp('------------------------- User Menu --------------------------');
    disp('[1] Display Stocks and Stock Information');
    disp('[2] Capital Market Line');
    disp('[3] Portfolio Optimisation');
    disp('[4] Efficiency-Frontier');
    disp('--------------------------------------------------------------');

    opt = input('Enter option (1-5), 0 to exit\n');
    
    switch(opt)
        case 1
            % Display Stocks and their Information
            displayStocks();
            opt1 = input('Enter index number: ');
            switch(opt1)
                case 1
                    displayStockInfo(HSI.Info);
                case 2
                    displayStockInfo(MTR.Info);
                case 3
                    displayStockInfo(HSBC.Info);
                case 4
                    displayStockInfo(SHK.Info);
            end
        case 2
            cml(HSI.Info)
        case 3
            portfolioOptimisation(list);
        case 4

        case 5

        case 0
            disp('Thank you for using our Stock Analytics Program');
            close all;
            prgEnd = true;

        otherwise
            disp('Invalid option');

    end
end

