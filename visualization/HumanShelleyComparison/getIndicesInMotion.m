function inMotion = getIndicesInMotion(testData,minSpeed)
inMotion = find(testData.ApplanixData.vxCG > minSpeed);