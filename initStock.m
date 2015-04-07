function [StockData] = initStock(inputFile)
    
    % This function initialises all required stock values by first
    % extracting raw data from source CSV file followed by creating a
    % structure for the given stock with a calculated Daily Returns field.

    % Using textread to extract field values from CSV file.
    
    [Date, Open, High, Low, Close, Volume, AdjClose] = textread(inputFile, '%s %.2f %.2f %.2f %.2f %d %.2f','headerlines',1,'delimiter',',');
        
    % Making StockDataScan structure as return value from the function. It will
    % contain all the information pertaining to the given stock.
    
    for i = 1:length(Date)
        % Daily returns begins from second object. Initialising first to
        % zero.
        if i == 1
            StockData(i,1) = struct('Date', Date(i), 'Open', Open(i), 'High', High(i), 'Low', Low(i), 'Close', Close(i), 'Volume', Volume(i), 'AdjClose', AdjClose(i), 'DailyReturns',0);
        else
            StockData(i,1) = struct('Date', Date(i), 'Open', Open(i), 'High', High(i), 'Low', Low(i), 'Close', Close(i), 'Volume', Volume(i), 'AdjClose', AdjClose(i), 'DailyReturns', (AdjClose(i)/AdjClose(i-1)-1));
        end
    end    
end

