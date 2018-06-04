%%Nitin Kapania
%this script takes turns in and gets the segments out

close all; clc; clearvars -except mapData mapMatch ApplanixData HLcmd TTSdata HLsteering tireSlip calc params t LLlongitudinal HLlongitudinal

desTurns = 1;
laps = 2;

load thunder_hill_bounds_final.mat;
if exist('mapData','var') == 0
    [LoadFileName2,LoadPathName2] = uigetfile('*.mat','Select the Map Data map file');
    load([LoadPathName2 LoadFileName2]);
end

turnArray = mapData(:,1);
rows = [];
segs = [];
    
for i = desTurns
    getSegs = mapData(i,2:(1+mapData(i,end)));
    segs = [segs getSegs];
end


if exist('ApplanixData','var') == 0
    [LoadFileName2,LoadPathName2] = uigetfile('*.mat','Select the Test Data Mat-file');
    load([LoadPathName2 LoadFileName2]);
end
    
Ux = ApplanixData.vxCG;

inMotion = find(Ux > 2);
segNum = mapMatch.segNumber(inMotion);
Ux = Ux(inMotion);
sideSlip = ApplanixData.sideSlip(inMotion);
delPsi = mapMatch.deltaPsi(inMotion);
deltaDes = HLcmd.steeringCmd(inMotion);
deltaAct = TTSdata.roadWheelAngle(inMotion);
DelPsiDotFB = HLsteering.dPsiDotFBforce(inMotion);
eDotFB = HLsteering.eCopDotFBforce(inMotion);
lkFB = HLsteering.LK_FBforce(inMotion);
FyFFW = HLsteering.FFW_FyF(inMotion);
e = mapMatch.e(inMotion);
alphaF = tireSlip.alphaFront(inMotion);
alphaR = tireSlip.alphaRear (inMotion);
kappaF = tireSlip.kappaFront (inMotion);
kappaR = tireSlip.kappaRear  (inMotion);
UySim = HLsteering.UySim(inMotion);
rSim  = HLsteering.rSim(inMotion);
UyEst = HLsteering.UyEst(inMotion);
rEst = HLsteering.rEst(inMotion);
UyExp = calc.vyCG(inMotion);
rExp = ApplanixData.yawRate(inMotion);
throttle = LLlongitudinal.throttleCmd(inMotion);
brake = LLlongitudinal.brakeCmd(inMotion);
gear = LLlongitudinal.gearCmd(inMotion);
rpm  = TTSdata.rpm(inMotion);
UxDesired = HLlongitudinal.UxDesired(inMotion);
axDesired = HLlongitudinal.axDesired(inMotion);
posE = ApplanixData.posE(inMotion);
posN = ApplanixData.posN(inMotion);
posU = ApplanixData.posU(inMotion);
heading = ApplanixData.yawAngle(inMotion);
a = params.TTS.a;
b = params.TTS.b;

time = t(inMotion);
time = time-time(1);
Ts = time(10) - time(9);

Wcutoff = 10;    % Hz
Fs = 1/Ts;
Wn = Wcutoff/(Fs/2);
[Bcoeff,Acoeff] = butter(3,Wn);
filt_ayCG = filtfilt(Bcoeff, Acoeff, ApplanixData.ayCG);
filt_axCG = filtfilt(Bcoeff, Acoeff, ApplanixData.axCG);
filt_ayCG = filt_ayCG(inMotion);
filt_axCG = filt_axCG(inMotion);


startSeg = segNum(1);
counter = 1;
flag = 0;
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

while flag == 0
    if segNum(lapIndex) == startSeg
        flag = 1;
    else
        flag = 0;
        lapIndex = lapIndex+1;
    end
end






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

segTime1 = time(lap1Ind(dataInd1));
segTimeFirstLap = segTime1(end) - segTime1(1);

segTime2 = time(lap2Ind(dataInd2));
segTimeSecondLap = segTime2(end) - segTime2(1);

segTime1 = segTime1 - segTime1(1);
segTime2 = segTime2 - segTime2(1);



plot(segTime1,180/pi*sideSlip(lap1Ind(dataInd1)));
grid on
hold on
plot(segTime2,180/pi*sideSlip(lap2Ind(dataInd2)),'r');
xlabel('time (sec)')
ylabel('Sideslip (deg)')
legend('Lap 1', 'Lap 2')

figure

plot(segTime1,180/pi*delPsi(lap1Ind(dataInd1)));
grid on
hold on
plot(segTime2,180/pi*delPsi(lap2Ind(dataInd2)),'r');
xlabel('time (sec)')
ylabel('\Delta \Psi (deg)')
legend('Lap 1', 'Lap 2')

figure

plot(segTime1,e(lap1Ind(dataInd1)));
grid on
hold on
plot(segTime2,e(lap2Ind(dataInd2)),'r');
xlabel('time (sec)')
ylabel('e (m)')
legend('Lap 1', 'Lap 2')

figure

subplot(2,1,1)
plot(segTime1,180/pi*deltaDes(lap1Ind(dataInd1)));
grid on
hold on
plot(segTime1,180/pi*deltaAct(lap1Ind(dataInd1)),'r');
xlabel('time (sec)')
ylabel('\Delta (deg)')
legend('Desired', 'Actual')
title('Lap 1')
subplot(2,1,2)

plot(segTime2,180/pi*deltaDes(lap2Ind(dataInd2)));
grid on
hold on
plot(segTime2,180/pi*deltaAct(lap2Ind(dataInd2)),'r');
xlabel('time (sec)')
ylabel('\Delta (deg)')
legend('Desired', 'Actual')
title('Lap 2')

figure
subplot(2,1,1)
plot(segTime1,DelPsiDotFB(lap1Ind(dataInd1)));
grid on
hold on
plot(segTime1,eDotFB(lap1Ind(dataInd1)),'r');
plot(segTime1,lkFB(lap1Ind(dataInd1)),'k');
plot(segTime1,FyFFW(lap1Ind(dataInd1)),'c');
xlabel('time (sec)')
ylabel('Force (N)')
legend('\Delta \Psi Feedback', 'COP Error Feedback' ,'Lanekeeping Feedback')
title('Lap 1')

subplot(2,1,2)
plot(segTime2,DelPsiDotFB(lap2Ind(dataInd2)));
grid on
hold on
plot(segTime2,eDotFB(lap2Ind(dataInd2)),'r');
plot(segTime2,lkFB(lap2Ind(dataInd2)),'k');
plot(segTime2,FyFFW(lap2Ind(dataInd2)),'c');
xlabel('time (sec)')
ylabel('Force (N)')
legend('\Delta \Psi Feedback', 'COP Error Feedback' ,'Lanekeeping Feedback')
title('Lap 2')

figure

subplot(2,1,1)
plot(segTime1,180/pi*alphaF(lap1Ind(dataInd1)));
grid on
hold on
plot(segTime1,180/pi*alphaR(lap1Ind(dataInd1)),'r');
xlabel('time (sec)')
ylabel('lateral slip angle \alpha (deg)')
legend('Front Slip', 'Rear Slip')
title('Lap 1')

subplot(2,1,2)
plot(segTime2,180/pi*alphaF(lap2Ind(dataInd2)));
grid on
hold on
plot(segTime2,180/pi*alphaR(lap2Ind(dataInd2)),'r');
xlabel('time (sec)')
ylabel('lateral slip angle \alpha (deg)')
legend('Front Slip' ,'Rear Slip')
title('Lap 2')

figure

subplot(2,1,1)
plot(segTime1,180/pi*kappaF(lap1Ind(dataInd1)));
grid on
hold on
plot(segTime1,180/pi*kappaR(lap1Ind(dataInd1)),'r');
xlabel('time (sec)')
ylabel('longitudinal slip angle \kappa')
legend('Front Slip', 'Rear Slip')
title('Lap 1')


subplot(2,1,2)
plot(segTime2,180/pi*kappaF(lap2Ind(dataInd2)));
grid on
hold on
plot(segTime2,180/pi*kappaR(lap2Ind(dataInd2)),'r');
xlabel('time (sec)')
ylabel('longitudinal slip angle \kappa')
legend('Front Slip' ,'Rear Slip')
title('Lap 2')

figure

plot(segTime1,segNum(lap1Ind(dataInd1)));
grid on
hold on
plot(segTime2,segNum(lap2Ind(dataInd2)),'r');
xlabel('time (sec)')
ylabel('Segment Number')
legend('Lap 1', 'Lap 2')
title(['Lap 1 Time = ',num2str(segTimeFirstLap), '  Lap 2 Time = ',num2str(segTimeSecondLap)])

figure

subplot(2,1,1)
plot(segTime1,rSim(lap1Ind(dataInd1)));
grid on
hold on
plot(segTime1,rEst(lap1Ind(dataInd1)),'r');
plot(segTime1,rExp(lap1Ind(dataInd1)),'k');
xlabel('time (sec)')
ylabel('Yaw Rate (rad/s)')
legend('Simulated', 'Estimate','Measured')
title('Lap 1')

subplot(2,1,2)
plot(segTime2,rSim(lap2Ind(dataInd2)));
grid on
hold on
plot(segTime2,rEst(lap2Ind(dataInd2)),'r');
plot(segTime2,rExp(lap2Ind(dataInd2)),'k');
xlabel('time (sec)')
ylabel('Yaw Rate (rad/s)')
legend('Simulated', 'Estimate','Measured')
title('Lap 2')

figure


subplot(2,1,1)
plot(segTime1,UySim(lap1Ind(dataInd1)));
grid on
hold on
plot(segTime1,UyEst(lap1Ind(dataInd1)),'r');
plot(segTime1,UyExp(lap1Ind(dataInd1)),'k');
xlabel('time (sec)')
ylabel('Lateral Velocity (m/s)')
legend('Simulated', 'Estimate','Measured')
title('Lap 1')

subplot(2,1,2)
plot(segTime2,UySim(lap2Ind(dataInd2)));
grid on
hold on
plot(segTime2,UyEst(lap2Ind(dataInd2)),'r');
plot(segTime2,UyExp(lap2Ind(dataInd2)),'k');
xlabel('time (sec)')
ylabel('Lateral Velocity (m/s)')
legend('Simulated', 'Estimate','Measured')
title('Lap 2')

figure
subplot(4,1,1)
plot(segTime1,brake(lap1Ind(dataInd1)));
grid on
hold on
plot(segTime2,brake(lap2Ind(dataInd2)),'r');
xlabel('time (sec)')
ylabel('Brake Pressure(bar)')
legend('Lap 1', 'Lap 2')

subplot(4,1,2)
plot(segTime1,throttle(lap1Ind(dataInd1)));
grid on
hold on
plot(segTime2,throttle(lap2Ind(dataInd2)),'r');
xlabel('time (sec)')
ylabel('Throttle Percentage(%)')
legend('Lap 1', 'Lap 2')

subplot(4,1,3)
plot(segTime1,rpm(lap1Ind(dataInd1)));
grid on
hold on
plot(segTime2,rpm(lap2Ind(dataInd2)),'r');
xlabel('time (sec)')
ylabel('Engine RPM(%)')
legend('Lap 1', 'Lap 2')

subplot(4,1,4)
plot(segTime1,gear(lap1Ind(dataInd1)));
grid on
hold on
plot(segTime2,gear(lap2Ind(dataInd2)),'r');
xlabel('time (sec)')
ylabel('gear(%)')
legend('Lap 1', 'Lap 2')

figure

subplot(2,1,1)
plot(segTime1,UxDesired(lap1Ind(dataInd1)));
grid on
hold on
plot(segTime1,Ux(lap1Ind(dataInd1)),'r');
xlabel('time (sec)')
ylabel('Ux (m/s)')
legend('Desired', 'Actual')
title('Lap 1')

subplot(2,1,2)
plot(segTime2,UxDesired(lap2Ind(dataInd2)));
grid on
hold on
plot(segTime2,Ux(lap2Ind(dataInd2)),'r');
xlabel('time (sec)')
ylabel('Ux (m/s)')
legend('Desired', 'Actual')
title('Lap 2')

figure

subplot(2,1,1)
plot(segTime1,axDesired(lap1Ind(dataInd1)));
grid on
hold on
plot(segTime1,filt_axCG(lap1Ind(dataInd1)),'r');
xlabel('time (sec)')
ylabel('ax (m/s^2)')
legend('Desired', 'Actual')
title('Lap 1')

subplot(2,1,2)
plot(segTime2,axDesired(lap2Ind(dataInd2)));
grid on
hold on
plot(segTime2,filt_axCG(lap2Ind(dataInd2)),'r');
xlabel('time (sec)')
ylabel('ax (m/s^2)')
legend('Desired', 'Actual')
title('Lap 2')

figure
plot(posE(lap1Ind(dataInd1)),posN(lap1Ind(dataInd1)))
xlabel('E (m)')
ylabel('N (m)')
axis equal
hold on
plot(posE(lap2Ind(dataInd2)),posN(lap2Ind(dataInd2)),'r')
plot(road_bounds_in(:,1),road_bounds_in(:,2),'k','LineWidth',2)
plot(road_bounds_out(:,1),road_bounds_out(:,2),'k','LineWidth',2)
legend('Lap 1','Lap 2')


% %%
% 
% %video animation
% figure
% for i = 1:numel(posE)
% % plot(posE(i),posN(i))
% % xlim([posE(i)-5, posE(i)+5])
% % ylim([posN(i)-5, posN(i)+5])
% % xlabel('E (m)')
% % ylabel('N (m)')
% 
% offset = 10;
% frameRate = 30;
% 
% 
% 
% if mod(i, frameRate) == 0
% 
% hold on
% plot(posE(i),posN(i),'ro','MarkerSize',4)
% plot(road_bounds_in(:,1),road_bounds_in(:,2),'k','LineWidth',2)
% plot(road_bounds_out(:,1),road_bounds_out(:,2),'k','LineWidth',2)
% plot([posE(i) - b*cos(heading(i)+pi/2), posE(i) + a*cos(heading(i)+pi/2)], [posN(i) - b*sin(heading(i)+pi/2), posN(i) + a*sin(heading(i)+pi/2)])
% pause(1/frameRate)
% xlim([posE(i)-offset, posE(i)+offset])
% ylim([posN(i)-offset, posN(i)+offset])
% 
% 
% hold off
% xlabel('E (m)')
% ylabel('N (m)')
% 
% end
% 
% 
% end





    