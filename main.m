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
    'csv/AIA (HK1299).csv'; 
    'csv/ICBC (HK1398).csv'; 
    'csv/Tencent (HK0700).csv'; 
    'csv/Lenovo Group (HK0992).csv'; 
    'csv/Hutchison (HK0013).csv'; 
    'csv/Swire Pacific (HK0019).csv'; 
    'csv/Wharf Holdings (HK0004).csv';
    'csv/Hang Seng Index.csv'};

% Input individual stock values:
global HSI MTR CLP CPC AIA HUT ICB TEN LEN SWP WHS stockWeight Portfolio;
CPC = initStock(inp{1});
CLP = initStock(inp{2});
MTR = initStock(inp{3});
AIA = initStock(inp{4});
ICB = initStock(inp{5});
TEN = initStock(inp{6});
LEN = initStock(inp{7});
HUT = initStock(inp{8});
SWP = initStock(inp{9});
WHS = initStock(inp{10});
HSI = initStock(inp{11});
stockWeight = genWeight();
Portfolio = struct('Return',zeros(252,1),'Risk',zeros(252,1),'Ratio',zeros(252,1),'Set',zeros(252,5),'Weight',zeros(252,1));

%% clear inp;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

list = {'CPC';'CLP';'MTR';'AIA';'ICB';'TEN';'LEN';'HUT';'SWP';'WHS'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Menu %

prgEnd = false;

while(prgEnd == false)
    clc;
    disp('Stock Analytics Program - GE1331: Problem Solving Made Easy');
    disp('-----------------------------------------------------------');
    disp(' ');
    disp('-.- Market Capitalization Benchmark Control Optimizer -.-');
    disp(' ');
    disp('------------------------- User Menu --------------------------');
    disp('[1] Display Stocks and Stock Information');
    disp('[2] Capital Market Line');
    disp('[3] Portfolio Optimisation');
    disp('[4] Plots');
    disp('--------------------------------------------------------------');

    opt = input('Enter option (1-5), 0 to exit\n');
    
    switch(opt)
        case 1
            % Display Stocks and their Information
            displayStocks(inp,list);
        case 2
            cml(HSI.Info)
        case 3
            if Portfolio(1).Ratio ~= 0
                displayPortfolio(list);
            else
                portfolioOptimisation(list);
            end
        case 4
            if Portfolio(1).Ratio ~= 0
                graphib();
            else
                fprintf('\nPortfolio needs to be generated first. Try option 3.\n');
                    disp('Press any key to continue.');
                    pause('on');
                    pause;
            end
        case 5

        case 0
            disp('Thank you for using our Stock Analytics Program');
            close all;
            clear opt;
            prgEnd = true;
        otherwise
            fprintf('Invalid option');
    end  
end
clear prgEnd;

