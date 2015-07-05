function [StockData] = extractData(inputFile)
    
    % This function initialises all required stock values by first
    % extracting raw data from source CSV file followed by creating a
    % structure for the given stock with a calculated Daily Returns field.

    % Using textread to extract field values from CSV file.
    
    [Date, Open, High, Low, Close, Volume, AdjClose] = textread(inputFile, '%s %.2f %.2f %.2f %.2f %d %.8f','headerlines',1,'delimiter',',');
        
    % Making StockDataScan structure as return value from the function. It will
    % contain all the information pertaining to the given stock.
    n = length(Date);
    j=n;
    for i = 1:n
        % Daily returns begins from second object. Initialising first to
        % zero.
        if i == 1
            StockData(i,1) = struct('Date', Date(j), 'Open', Open(j), 'High', High(j), 'Low', Low(j), 'Close', Close(j), 'Volume', Volume(j), 'AdjClose', AdjClose(j), 'DailyReturns',0);
        else
            StockData(i,1) = struct('Date', Date(j), 'Open', Open(j), 'High', High(j), 'Low', Low(j), 'Close', Close(j), 'Volume', Volume(j), 'AdjClose', AdjClose(j), 'DailyReturns', (AdjClose(j)/AdjClose(j+1)-1));
        end
        j=j-1;
    end
end

