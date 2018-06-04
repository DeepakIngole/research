
%% trim data to when car is actually moving
inMotion1 = getIndicesInMotion(testData1,2);
inMotion2 = getIndicesInMotion(testData2,2);

%% unpack the variables we want to plot, convert radians to degrees.
unpackData

%% filter the acceleration data

[Run1.axCG Run1.ayCG] = FilterAccelerationData(10, Ts, testData1.ApplanixData.axCG(inMotion1), testData1.ApplanixData.ayCG(inMotion1));
[Run2.axCG Run2.ayCG] = FilterAccelerationData(10, Ts, testData2.ApplanixData.axCG(inMotion2), testData2.ApplanixData.ayCG(inMotion2));

%% split data into laps
Run1.lapIndex = SplitDataIntoLaps(Run1.segNumber);
Run2.lapIndex = SplitDataIntoLaps(Run2.segNumber);

%% get indices for the turns you want to look at

[Run1.Lap1.AllIndices Run1.Lap2.AllIndices Run1.laptime Run1.Lap1.desiredTurnsOnly Run1.Lap2.desiredTurnsOnly] = GetIndices(Run1.lapIndex, Run1.segNumber, Run1.t, segs);
[Run2.Lap1.AllIndices Run2.Lap2.AllIndices Run2.laptime Run2.Lap1.desiredTurnsOnly Run2.Lap2.desiredTurnsOnly] = GetIndices(Run2.lapIndex, Run2.segNumber, Run2.t, segs);

%% trim data to only the turns you are interested in
trimData

%% get time into easier form to plot
synchronizeTimeData
fixSegDist

