function segs = segsFromMapData(mapData, desTurns)

segs = [];
    
for i = desTurns
    getSegs = mapData(i,2:(1+mapData(i,end)));
    segs = [segs getSegs];
end
