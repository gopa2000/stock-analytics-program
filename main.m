% GE1331 - Problem Solving Made Easy
% 2014/15 - Sem B
% Group Assignment - Analysing Public Stocks
%
%   Nitin Agrawal
%   Nikhil Sharma
%   Aditya Kedia    (53663012)
%   Dhruv Oberoi    (53790492)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Input %
%

% Input individual stock values:
HSI = initStock('hsi.csv');
MTR = initStock('mtr.csv');
%% Not a part of HKSE.
%% HSBC = initStock('hsbc.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Prep %
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Menu %

prgEnd = false;

while(prgEnd == false)
    disp('Stock Analytics Program - GE1331: Problem Solving Made Easy');
    disp('------------------------- User Menu --------------------------');
    disp('[1] Display Stocks and Stock Information');
    disp('[2] Capital Market Line');
    disp('[4] Correlation');
    disp('[5] Efficient-Frontier');
    disp('--------------------------------------------------------------');

    opt = input('Enter option (1-5), 0 to exit\n');
    
    switch(opt)
        case 1
            % Display Stocks and their Information
            displayStocks();
            opt1 = input('Enter index number: ');
            switch(opt1)
                case 1
                    displayStockInfo(HSI);
                case 2
                    displayStockInfo(MTR);
                case 3
                    displayStockInfo(HSBC);
                case 4
                    displayStockInfo(SHK);
            end
        case 2
            
        case 3

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

