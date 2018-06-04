clear all; 
load simData

addpath(genpath('C:\Users\ddl\Desktop\nkapania\simulation\common'));
load THcenter.mat

clear mapMatch
for i = 1:len(simF.s)
    [~,~,~,simF.s(i)] = mapMatch(simF.posE(i), simF.posN(i), 0, refWorld);
end

clear mapMatch
for i = 1:len(simS.s)
    [~,~,~,simS.s(i)] = mapMatch(simS.posE(i), simS.posN(i), 0, refWorld);
end

clear mapMatch
for i = 1:len(worldF.s)
    [~, ~, ~, worldF.s(i)] = mapMatch(worldF.roadE(i), worldF.roadN(i), 0, refWorld); 
end

clear mapMatch
for i = 1:len(worldS.s)
    [~, ~, ~, worldS.s(i)] = mapMatch(worldS.roadE(i), worldS.roadN(i), 0, refWorld); 
end

%%
close all;
h(1) = subplot(3, 1, 1);
hold on; grid on;
ylim([-.3 .5])
plot(simS.s, -simS.t + interp1(simF.s, simF.t, simS.s),'k','LineWidth',2)
set(gca,'XTickLabel',[])
ylabel('Time Difference (s)','FontSize',14,'FontName','Arial')

h(2) = subplot(3, 1, 2);
hold on; grid on;
ylim([-.025 .03])
plot(worldS.s, worldS.K,'r','LineWidth',2)
plot(worldF.s, worldF.K,'b--','LineWidth',2)
set(gca,'XTickLabel',[])
ylabel('Path Curvature (1/m)','FontSize',14,'FontName','Arial')

h(3) = subplot(3, 1, 3);
ylim([15 51])
hold on; grid on;
plot(simS.s, simS.Ux,'r','LineWidth',2)
plot(simF.s, simF.Ux,'b--','LineWidth',2)
ylabel('Predicted Velocity (m/s)','FontSize',14,'FontName','Arial')
xlabel('Distance Along Centerline (m)','FontSize',14,'FontName','Arial')
legend('Min Curvature','Dual Cost Function')

linkaxes(h,'x')
xlim([0 4600]);