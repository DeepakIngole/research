clear all; close all; clc;
addpath('C:\Users\ddl\Documents\localTestData\raceData')
addpath(genpath('C:\Users\ddl\Desktop\nkapania\simulation\common'));

sG = 0:5:4600; N = len(sG); numLaps = 10;
eG = zeros(numLaps, N);

subplot(2, 1, 1)

for i = 1:numLaps
    str = ['g' num2str(i)];
    load(str) 
    eG(i,:) = interp1(s, e, sG, 'linear', 'extrap');
    plot(sG, eG(i,:), 'Color',[.5 .5 .5],'LineStyle','--'); hold on;
end

eG = sum(eG)/numLaps;
plot(sG, eG, 'g','LineWidth',3)

%% Process Min Distance Data

load('C:\Users\ddl\Desktop\nkapania\simulation\common\maps\THcenter.mat')
load('C:\Users\ddl\Desktop\nkapania\simulation\common\maps\minDist.mat')
N = len(mapWorld.s); M = round(N/20);
dsInd = round(linspace(1, N, M));
eD = zeros(M, 1); sD = zeros(M,1);

clear mapMatch
for i = 1:M
    [eD(i), ~, ~, sD(i)] = mapMatch(mapWorld.roadE(dsInd(i)), mapWorld.roadN(dsInd(i)), 0, refWorld); 
end

eD = interp1(sD, eD, sG, 'linear', 'extrap');

plot(sG, eD, 'r','LineWidth',2)

%% Process Min Curvature Data
load('C:\Mapping\Maps\Thunderhill\fastGenMap.mat')
N = len(mapWorld.s); M = round(N/20);
dsInd = round(linspace(1, N, M));
eK = zeros(M, 1); sK = zeros(M,1);

clear mapMatch
for i = 1:M
    [eK(i), ~, ~, sK(i)] = mapMatch(mapWorld.roadE(dsInd(i)), mapWorld.roadN(dsInd(i)), 0, refWorld); 
end


eK = interp1(sK, eK, sG, 'linear', 'extrap');
plot(sG, eK, 'b','LineWidth',2); grid on;

%% plot eta values

subplot(2, 1, 2)
plot(refWorld.lam2.s, refWorld.lam2.weights/.05, 'k','LineWidth',2); grid on; hold on;

%save C:\Users\ddl\Desktop\nkapania\simulation\RapidPathGeneration\scripts\gunnarData sG eG    