close all; clear all; clc;

load('C:\Users\ddl\Desktop\nkapania\simulation\common\maps\THcenter.mat')
load('C:\Users\ddl\Desktop\nkapania\simulation\common\maps\minDist.mat')

addpath(genpath('C:\Users\ddl\Desktop\nkapania\simulation\common'));

s = 0:5:4600; N = len(s);

N = len(mapWorld.s); M = round(N/20);
dsInd = round(linspace(1, N, M));
eD = zeros(M, 1); sD = zeros(M,1);

clear mapMatch
for i = 1:M
    [eD(i), ~, ~, sD(i)] = mapMatch(mapWorld.roadE(dsInd(i)), mapWorld.roadN(dsInd(i)), 0, refWorld); 
end

eD = interp1(sD, eD, s, 'linear', 'extrap');



%% Process Min Curvature Data
load('C:\Mapping\Maps\Thunderhill\fastGenMap.mat')
N = len(mapWorld.s); M = round(N/20);
dsInd = round(linspace(1, N, M));
eK = zeros(M, 1); sK = zeros(M,1);

clear mapMatch
for i = 1:M
    [eK(i), ~, ~, sK(i)] = mapMatch(mapWorld.roadE(dsInd(i)), mapWorld.roadN(dsInd(i)), 0, refWorld); 
end


eK = interp1(sK, eK, s, 'linear', 'extrap');


%%
load('C:\Users\ddl\Documents\localTestData\raceData\boundsMatch.mat');


eta25 = .75*eK + .25*eD;
eta50 = .5*eK  +  .5*eD;
eta75 = .25*eK + .75*eD;

plot(s, eK, 'Color',[253 104 100]/255,'LineWidth',2); hold on; grid on;
plot(s, eta25,'Color',[253 15 9]/255,'LineWidth',2)
plot(s, eta50,'Color',[213 7 2]/255,'LineWidth',2)
plot(s, eta75,'Color',[181 6 2]/255,'LineWidth',2)
plot(s, eD, 'Color',[157 6 2]/255, 'LineWidth',2);
plot(sIn, eIn,'k','LineWidth',2)
plot(sOut, eOut,'k','LineWidth',2)

xlim([0 4500])
xlabel('Distance Along Centerline (m)','FontSize',14);
ylabel('Lateral Deviation From Centerline (m)', 'FontSize',14);

legend('\eta = 0 (Min Curvature)', '\eta = .25', '\eta = .5', '\eta = .75', '\eta = 1 (Min Distance)','Road Edge')