function lapIndex = SplitDataIntoLaps(segNum)

startSeg = segNum(1);
counter = 1;
flag = 0;

%need to look past first segment
while flag == 0
    if segNum(counter) == startSeg
        flag = 0;
        counter = counter+1;
    else
        flag = 1;
    end
end

lapIndex = counter;
flag = 0;

%look again for next segment
while flag == 0
    if segNum(lapIndex) == startSeg
        flag = 1;
    else
        flag = 0;
        lapIndex = lapIndex+1;
    end
end

end