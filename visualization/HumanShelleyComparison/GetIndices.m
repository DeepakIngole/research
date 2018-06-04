function [lap1Ind lap2Ind lap1time dataInd1 dataInd2] = GetIndices(lapIndex, segNum, time, segs)

lap1Ind = 1:lapIndex;
lap2Ind = lapIndex +1: numel(segNum);
lap1time = time(lapIndex);

dataInd1 = [];
dataInd2 = [];
for i = 1:numel(segs)
    dataind1 = find(segNum(lap1Ind) == segs(i)); 
    dataind2 = find(segNum(lap2Ind) == segs(i));
    
    dataInd1 = [dataInd1 dataind1'];
    dataInd2 = [dataInd2 dataind2'];
end
