function res = monotizeSegProgData(segProg)

if numel(segProg) < 2
    res = segProg;
else
    res(1) = segProg(1);
    
    lastDist = 0;
    for i = 2:numel(segProg)
        if segProg(i)<segProg(i-1)
            lastDist = res(i-1);
        end
    res(i) = segProg(i) + lastDist;
    end
    
end

end