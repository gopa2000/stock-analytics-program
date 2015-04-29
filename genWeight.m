function stockWeight = genWeight()
    % Initialise variables to optimise code.
    stockWeight = zeros(96,5);

    a1 = [0.10 0.10 0.10 0.10 0.60]; a2 = [0.10 0.10 0.10 0.20 0.50]; a3 = [0.10 0.10 0.10 0.30 0.40]; a4 = [0.10 0.10 0.20 0.20 0.40]; a5 = [0.10 0.20 0.20 0.20 0.30]; a6 = [0.20 0.20 0.20 0.20 0.20];
    a1 = perms(a1); a2 = perms(a2); a3 = perms(a3); a4 = perms(a4); a5 = perms(a5); a6 = perms(a6);
    a1 = unique(a1,'rows'); a2 = unique(a2,'rows'); a3 = unique(a3,'rows'); a4 = unique(a4,'rows'); a5 = unique(a5,'rows'); a6 = unique(a6,'rows');
    
    
    stockWeight = vertcat(a1,a2,a3,a4,a5,a6);
    clearvars a1 a2 a3 a4 a5 a6;
end