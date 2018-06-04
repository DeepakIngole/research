Ux = TTSdata.vxCG;
brakePressure = TTSdata.brakePressure;
axCG = ApplanixData.axCG;
ayCG = ApplanixData.ayCG;
Ts = .005;

[filt_axCG filt_ayCG] = FilterAccelerationData(10, Ts, axCG, ayCG);


indS = find(filt_axCG*params.TTS.m < -300);

xlabel('Fx (N)')
ylabel('Brake Pressure (bar)')
Kbrake = .0045;

FxAxis = linspace(0, -2.5e4, 10000);

hold on

plot(params.TTS.m*axCG(indS), brakePressure(indS),'*')
plot(params.TTS.m*filt_axCG(indS), brakePressure(indS),'r*')
plot(FxAxis, FxAxis*-Kbrake,'k','LineWidth',2);

% figure
% plot(t, -brakePressure./(axCG*params.TTS.m),'r*');
% xlim([50 325])

%%
clear all
load fullyautonewtires_HL_2012-06-28_aa.mat

Ux = TTSdata.vxCG;
brakePressure = TTSdata.brakePressure;
axCG = ApplanixData.axCG;
ayCG = ApplanixData.ayCG;
Ts = .005;
ratio = -brakePressure./(params.TTS.m*axCG);

kBrake = zeros(numel(t),1);
kBrake(1) = 1/240;


UxThreshold = 2;
brakeLow = 35; % bar
brakeHigh = 65; %bar
N = 10;
n = 150;

brakeSum = 0;
accelSum = 0;
brakeAvg = zeros(size(t));
numSamples = 0;
kBrakeAvg = kBrake(1);

kMax = .007;
kMin = .003;
iVec = [];



for i = 2:numel(t)

    if Ux(i) < UxThreshold
        kBrake(i) = kBrake(i-1);
        brakeSum = 0;
        accelSum = 0;
        
    else    
        brakeAvg(i) = 1/N*brakePressure(i) + (N-1)/N*brakeAvg(i-1); %compute brake average
        
        if brakePressure(i) < brakeAvg(i)
            if brakePressure(i) < brakeHigh && brakePressure(i) > brakeLow
                    brakeSum = brakeSum*(n-1)/n + brakePressure(i)/n;
                    accelSum = accelSum*(n-1)/n + axCG(i)/n;
                    numSamples = numSamples + 1;
                    kBrake(i) = kBrake(i - 1);
                    iVec = [iVec i];
                        
                    if mod(numSamples,150) == 0
                        kBrake(i) = -brakeSum/(accelSum*params.TTS.m);
                        i
                    end
            
            else
                kBrake(i) = kBrake(i-1);
            end
            
        else
            kBrake(i) = kBrake(i-1);     
        end
        
    end   
 
    
end


lims = [0 200];

close all
% figure
% plot(t(1:lapIndex)-t(1), 1./kBrake(1:lapIndex),'r','LineWidth',2)
% hold on 
% plot(t(lapIndex+1:end)-t(lapIndex), 1./kBrake(lapIndex+1:end),'b','LineWidth',2)
% plot(t(1:lapIndex) - t(1), 1./kBrake(1)*ones(numel(t(1:lapIndex)),1), 'k', 'LineWidth',2)
% xlim(lims)
% legend('Lap 1','Lap2','Current Gain')
% ylabel('Brake Effectiveness (N/bar)')

figure
plot(t - t(1), brakePressure)
hold on
plot(t - t(1), brakeAvg,'r')


[brakeEffectivenessFilt brakeEffectivenessFilt] = FilterAccelerationData(10, Ts, 1./ratio(iVec), 1./ratio(iVec));

figure
subplot(2,1,1)
plot((1:1:numel(brakeEffectivenessFilt))/200,brakeEffectivenessFilt, 'LineWidth',2)
subplot(2,1,2)
plot((1:1:numel(brakePressure(iVec)))/200,brakePressure(iVec))
% hold on
% plot(brakeAvg(iVec),'r')




figure
plot(t, 1./kBrake,'r','LineWidth',2)
hold on 
plot(t, 1./kBrake(1)*ones(size(t)),'b','LineWidth',2)
ylabel('Brake Effectiveness (N/bar)')
%ylim([220 260])



%%
clear all; close all; clc;
load fullyautonewtires_HL_2012-06-28_aa.mat

Ts = .005;

Ux = ApplanixData.vxCG;
inMotion = find(Ux > 2);
lims = [170 171];
[filt_axCG filt_ayCG] = FilterAccelerationData(10, Ts, ApplanixData.axCG(inMotion), ApplanixData.ayCG(inMotion));

Ux = Ux(inMotion);
t = t(inMotion);
segNum = mapMatch.segNumber(inMotion);
turns = segs2turns(segNum);


brakePressure = TTSdata.brakePressure(inMotion);
plot(t, brakePressure,'LineWidth',2)
xlim(lims)
figure

plot(t, .95*Ux/5400, 'LineWidth',2)
hold on
xlim(lims)
plot(t, 1./(-params.TTS.m*filt_axCG./brakePressure), 'r', 'LineWidth',2);
legend('Ux (m/s)', 'Brake Gain (bar/N)')

figure
plot(t, turns,'LineWidth',2);
xlabel('t')
ylabel('Turn Number')
xlim(lims)