close all; clear all; clc;
load('C:\Users\ddl\Documents\localTestData\FastMapGenerationData\addingMinDistance\lam05heuristic.mat')

plot(bounds.in(:,1), bounds.in(:,2),'k','LineWidth',2); ;grid on; hold on; axis equal;
plot(bounds.out(:,1), bounds.out(:,2),'k','LineWidth',2)

h1 = plot(world.roadE, world.roadN,'r','LineWidth',2);


load('C:\Users\ddl\Documents\localTestData\FastMapGenerationData\addingMinDistance\minD.mat')
h2 = plot(world.roadE, world.roadN,'b','LineWidth',2);

load('C:\Users\ddl\Documents\localTestData\FastMapGenerationData\addingMinDistance\minK.mat')
h3 = plot(world.roadE, world.roadN,'g','LineWidth',2);


%% Averaged Human Data
humanS = 5:5:4540;
humanE = zeros(10,len(humanS));
humanN = zeros(10,len(humanS));
addpath('C:\Users\ddl\Documents\localTestData\raceData')
for i = 1:10
    str = ['g' num2str(i)];
    load(str)
    humanE(i,:) = interp1(s, posE, humanS);
    humanN(i,:) = interp1(s, posN, humanS);
end

humanE = sum(humanE)/10;
humanN = sum(humanN)/10;
        
h4 = plot(humanE, humanN,'m--','LineWidth',1)


%%

xlabel('East (m)','FontSize',14) 
ylabel('North (m)','FontSize',14)
legend([h1 h2 h3 h4],{'Combined','Min Distance','Min Curvature','Pro Human (Avg)'})

xlim([80 260])