startCrv = data(:,8);
endCrv = data(:,9);

n = numel(startCrv);
segType = -1*ones(n,1);

for i = 1:n
    if startCrv(i) == endCrv(i)
        if startCrv(i) == 0;
            segType(i) = 0;
        else
            segType(i) = 2;
        end
    end
    
    if abs(startCrv(i)) < abs(endCrv(i))
        segType(i) =1 ;
    end
    
    if abs(startCrv(i)) > abs(endCrv(i))
        segType(i) = 3;
    end
end