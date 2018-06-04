segNum1.Lap1 = segNum1U(Indices1.Lap1(dataIndices1.Lap1));
segNum1.Lap2 = segNum1U(Indices1.Lap2(dataIndices1.Lap2));
segNum2.Lap1 = segNum2U(Indices2.Lap1(dataIndices2.Lap1));
segNum2.Lap2 = segNum2U(Indices2.Lap2(dataIndices2.Lap2));
clear segNum1U
clear segNum2U

sideSlip1.Lap1 = sideSlip1U(Indices1.Lap1(dataIndices1.Lap1));
sideSlip1.Lap2 = sideSlip1U(Indices1.Lap2(dataIndices1.Lap2));
sideSlip2.Lap1 = sideSlip2U(Indices2.Lap1(dataIndices2.Lap1));
sideSlip2.Lap2 = sideSlip2U(Indices2.Lap2(dataIndices2.Lap2));
clear sideSlip1U
clear sideSlip2U

delPsi1 = testData1.mapMatch.deltaPsi(inMotion1);
delPsi2 = testData2.mapMatch.deltaPsi(inMotion2);

deltaDes1 = testData1.HLcmd.steeringCmd(inMotion1);
deltaDes2 = testData2.HLcmd.steeringCmd(inMotion2);

deltaAct1 = testData1.TTSdata.roadWheelAngle(inMotion1);
deltaAct2 = testData2.TTSdata.roadWheelAngle(inMotion2);

DelPsiDotFB1 = testData1.HLsteering.dPsiDotFBforce(inMotion1);
DelPsiDotFB2 = testData2.HLsteering.dPsiDotFBforce(inMotion2);

eDotFB1 = testData1.HLsteering.eCopDotFBforce(inMotion1);
eDotFB2 = testData2.HLsteering.eCopDotFBforce(inMotion2);

lkFB1 = testData1.HLsteering.LK_FBforce(inMotion1);
lkFB2 = testData2.HLsteering.LK_FBforce(inMotion2);

FyFFW1 = testData1.HLsteering.FFW_FyF(inMotion1);
FyFFW2 = testData2.HLsteering.FFW_FyF(inMotion2);

e1 = testData1.mapMatch.e(inMotion1);
e2 = testData2.mapMatch.e(inMotion2);

alphaF1 = testData1.tireSlip.alphaFront(inMotion1);
alphaF2 = testData2.tireSlip.alphaFront(inMotion2);

alphaR1 = testData1.tireSlip.alphaRear (inMotion1);
alphaR2 = testData2.tireSlip.alphaRear(inMotion2);

kappaF1 = testData1.tireSlip.kappaFront (inMotion1);
kappaF2 = testData2.tireSlip.kappaFront (inMotion2);

kappaR1 = testData1.tireSlip.kappaRear(inMotion1);
kappaR2 = testData2.tireSlip.kappaRear(inMotion2);

UySim1 = testData1.HLsteering.UySim(inMotion1);
UySim2 = testData2.HLsteering.UySim(inMotion2);

rSim1  = testData1.HLsteering.rSim(inMotion1);
rSim2  = testData2.HLsteering.rSim(inMotion2);

UyEst1 = testData1.HLsteering.UyEst(inMotion1);
UyEst2 = testData2.HLsteering.UyEst(inMotion2);

rEst1 = testData1.HLsteering.rEst(inMotion1);
rEst2 = testData2.HLsteering.rEst(inMotion2);

UyExp1 = testData1.calc.vyCG(inMotion1);
UyExp2 = testData2.calc.vyCG(inMotion2);

rExp1 = testData1.ApplanixData.yawRate(inMotion1);
rExp2 = testData2.ApplanixData.yawRate(inMotion2);

throttle1 = testData1.LLlongitudinal.throttleCmd(inMotion1);
throttle2 = 100*testData2.LLlongitudinal.throttleCmd(inMotion2)/max(testData2.LLlongitudinal.throttleCmd(inMotion2));

brake1 = testData1.LLlongitudinal.brakeCmd(inMotion1);
brake2 = testData2.LLlongitudinal.brakeCmd(inMotion2);

gear1 = testData1.LLlongitudinal.gearCmd(inMotion1);
gear2 = testData2.LLlongitudinal.gearCmd(inMotion2);

rpm1  = testData1.TTSdata.rpm(inMotion1);
rpm2 =  testData2.TTSdata.rpm(inMotion2);

UxDesired1 = testData1.HLlongitudinal.UxDesired(inMotion1);
UxDesired2 = testData2.HLlongitudinal.UxDesired(inMotion2);

axDesired1 = testData1.HLlongitudinal.axDesired(inMotion1);
axDesired

axDesired2 = testData2.HLlongitudinal.axDesired(inMotion2);

posE1 = testData1.ApplanixData.posE(inMotion1);
posE2 = testData2.ApplanixData.posE(inMotion2);

posN1 = testData1.ApplanixData.posN(inMotion1);
posN2 = testData2.ApplanixData.posN(inMotion2);

posU1 = testData1.ApplanixData.posU(inMotion1);
posU2 = testData2.ApplanixData.posU(inMotion2);

heading1 = testData1.ApplanixData.yawAngle(inMotion1);
heading2 = testData2.ApplanixData.yawAngle(inMotion2);

a = testData1.params.TTS.a;
b = testData1.params.TTS.b;

time1 = testData1.t(inMotion1);
time2 = testData2.t(inMotion2);

time1 = time1-time1(1);
time2 = time2 - time2(1);

Ts = time1(10) - time1(9);