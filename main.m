1  	% GE1331 - Problem Solving Made Easy
2  	% 2014/15 - Sem B
3  	% Group Assignment - Analysing Public Stocks
4  	%
5  	%   Aditya Kedia
6  	%   Dhruv Oberoi
7  	%   Nikhil Sharma
8  	%   Nitin Agrawal
9  	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
10 	% Data Prep %
11 	%
12 	inp = {'csv/Cathay Pacifc (HK0293).csv'; 
13 	    'csv/CLP Holding (HK0002).csv'; 
14 	    'csv/MTR Corp (HK0066).csv'; 
15 	    'csv/AIA (HK1299).csv'; 
16 	    'csv/ICBC (HK1398).csv'; 
17 	    'csv/Tencent (HK0700).csv'; 
18 	    'csv/Lenovo Group (HK0992).csv'; 
19 	    'csv/Hutchison (HK0013).csv'; 
20 	    'csv/Swire Pacific (HK0019).csv'; 
21 	    'csv/Wharf Holdings (HK0004).csv';
22 	    'csv/Hang Seng Index.csv'};
23 
24 	% Input individual stock values:
25 	global HSI MTR CLP CPC AIA HUT ICB TEN LEN SWP WHS stockWeight Portfolio;
26 	CPC = initStock(inp{1});
27 	CLP = initStock(inp{2});
28 	MTR = initStock(inp{3});
29 	AIA = initStock(inp{4});
30 	ICB = initStock(inp{5});
31 	TEN = initStock(inp{6});
32 	LEN = initStock(inp{7});
33 	HUT = initStock(inp{8});
34 	SWP = initStock(inp{9});
35 	WHS = initStock(inp{10});
36 	HSI = initStock(inp{11});
37 	stockWeight = genWeight();
38 	Portfolio = struct('Return',zeros(252,1),'Risk',zeros(252,1),'Ratio',zeros(252,1),'Set',zeros(252,5),'Weight',zeros(252,1));
39 
40 	%% clear inp;
41 	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
42 
43 	list = {'CPC';'CLP';'MTR';'AIA';'ICB';'TEN';'LEN';'HUT';'SWP';'WHS'};
44 
45 	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
46 
47 	% Menu %
48 
49 	prgEnd = false;
50 
51 	while(prgEnd == false)
52 	    clc;
53 	    disp('Stock Analytics Program - GE1331: Problem Solving Made Easy');
54 	    disp('--------------------------------------------------------------');
55 	    disp(' ');
56 	    disp('-.-.-.- Market Capitalization Benchmark Control -.-.-.-');
57 	    disp('-.-.-.-            Portfolio Optimizer          -.-.-.-');
58 	    disp(' ');
59 	    disp('------------------------- User Menu --------------------------');
60 	    disp('[1] Display Stocks and Stock Information');
61 	    disp('[2] Capital Market Line');
62 	    disp('[3] Portfolio Optimisation');
63 	    disp('[4] Plots');
64 	    disp('--------------------------------------------------------------');
65 
66 	    opt = input('Enter option (1-5), 0 to exit\n');
67 	    
68 	    switch(opt)
69 	        case 1
70 	            % Display Stocks and their Information
71 	            displayStocks(inp,list);
72 	        case 2
73 	            cml(HSI.Info)
74 	        case 3
75 	            if Portfolio(1).Ratio ~= 0
76 	                displayPortfolio(list);
77 	            else
78 	                portfolioOptimisation(list);
79 	            end
80 	        case 4
81 	            if Portfolio(1).Ratio ~= 0
82 	                graphib();
83 	            else
84 	                fprintf('\nPortfolio needs to be generated first. Try option 3.\n');
85 	                    disp('Press any key to continue.');
86 	                    pause('on');
87 	                    pause;
88 	            end
89 	        case 0
90 	            disp('Thank you for using our Stock Analytics Program');
91 	            close all;
92 	            clear opt;
93 	            prgEnd = true;
94 	        otherwise
95 	            fprintf('Invalid option');
96 	    end  
97 	end
98 	clear prgEnd;
99 
100