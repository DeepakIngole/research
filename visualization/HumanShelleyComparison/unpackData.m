variablesToPlot = {'mapMatch.segNumber'; 'ApplanixData.sideSlip'; 'mapMatch.deltaPsi'; 'HLsteering.steeringCmdSS'; 'TTSdata.roadWheelAngle'; 'HLsteering.dPsiDotFBforce'; 'HLsteering.eCopDotFBforce'; ...
    'HLsteering.LK_FBforce'; 'HLsteering.FFW_FyF'; 'mapMatch.e'; 'tireSlip.alphaFront'; 'tireSlip.alphaRear'; 'tireSlip.kappaFront'; 'tireSlip.kappaRear'; 'HLsteering.UySim'; 'HLsteering.rSim'; ...
    'calc.vyCG'; 'ApplanixData.yawRate'; 'LLlongitudinal.throttleCmd'; 'LLlongitudinal.brakeCmd'; 'LLlongitudinal.gearCmd'; 'TTSdata.rpm'; 'HLlongitudinal.UxDesired'; 'HLlongitudinal.axDesired'; 'ApplanixData.posE'; 'ApplanixData.posN';...
    'ApplanixData.posU'; 'ApplanixData.yawAngle';'t'; 'ApplanixData.axCG'; 'ApplanixData.ayCG'; 'ApplanixData.vxCG'; 'mapMatch.currSegProg'; 'TTSdata.throttle'; 'TTSdata.brakePressure'; 'TTSdata.rpm'; 'TTSdata.gearPosition'; ...
    'TTSdata.handwheelAngle'; 'mapMatch.segType'; 'HLlongitudinal.FFWforce'; 'HLlongitudinal.FBforce'};

variablesNoField = removeField(variablesToPlot);

for i = 1:numel(variablesToPlot)
    Run1.(char(genvarname(variablesNoField(i)))) = eval(['testData1.' char(variablesToPlot(i)) '(inMotion1)']);
    Run2.(char(genvarname(variablesNoField(i)))) = eval(['testData2.' char(variablesToPlot(i)) '(inMotion2)']);
end

a = testData1.params.TTS.a;
b = testData1.params.TTS.b;

Run1.t = Run1.t - Run1.t(1);
Run2.t = Run2.t - Run2.t(1);

Ts = Run1.t(10) - Run1.t(9);