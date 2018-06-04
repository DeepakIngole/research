
if exist('mapData','var') == 0
    [LoadFileName2,LoadPathName2] = uigetfile('*.mat','Select the Map Data map file');
    load([LoadPathName2 LoadFileName2]);
end

if exist('testData1','var') == 0
    [LoadFileName2,LoadPathName2] = uigetfile('*.mat','Select the Test Data Mat-file');
    load([LoadPathName2 LoadFileName2]);
    renameData
    testData1 = testData;
end

if exist('testData2','var') == 0
    [LoadFileName2,LoadPathName2] = uigetfile('*.mat','Select the Test Data Mat-file');
    load([LoadPathName2 LoadFileName2]);
    renameData
    testData2 = testData;
end

