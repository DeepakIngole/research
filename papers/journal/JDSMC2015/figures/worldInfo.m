clear all; close all; clc;
addpath(genpath('scripts')); addpath(genpath('maps')); addpath(genpath('vehicles'))

veh = getVehicle('tts'); mu = .9; buffer = 0; sampleTime = .01;  %meters
refWorld = genWorldFromCSV('THcenter.csv'); 

bounds = load('thunderhill_bounds_shifted.mat');
refWorld = getLaneWidth(refWorld, bounds, buffer);

opt1  = getRapidTrajectory(refWorld, veh, mu);
world1 = updateWorld(refWorld, opt1, bounds);

%%
close all;
ind = 4000:4400;

subplot(3, 1, 1)
plot(refWorld.roadN(ind), refWorld.roadE(ind)-130,'k--','LineWidth',2)
hold on; axis equal;
plot(bounds.in(:,2), bounds.in(:,1)-130,'k','LineWidth',2)
plot(bounds.out(:,2), bounds.out(:,1)-130,'k','LineWidth',2)
legend('Reference Path', 'Road Boundaries')

grid on;
xlabel('East (m)','FontSize',14)
ylabel('North (m)','FontSize',14)
set(gca, 'FontSize',14)
ylim([0 40])
xlim([0 80])

subplot(3,1,2)
hold on; grid on;
plot([0 100], [0 0],'k--','LineWidth',2)
plot(refWorld.s(ind)-refWorld.s(ind(1)), refWorld.widthLeft(ind),'k','LineWidth',2);
plot(refWorld.s(ind)-refWorld.s(ind(1)), refWorld.widthRight(ind),'k','LineWidth',2)
ylim([-5 6.5])
xlabel('Distance Along Path (m)','FontSize',14)
ylabel('Distance to Road Edge (m)','FontSize',14)
set(gca, 'FontSize',14,'XTickLabel',[])

subplot(3,1,3)
s = linspace(0, 100, 1000);
K = -8.8e-6*s.^3 + .0035*s.^2 -.16*s-12;

hold on; grid on;
plot(s, K/1000, 'k','LineWidth',2)
xlabel('Distance Along Path (m)','FontSize',14)
ylabel('Path Curvature (1/mm)','FontSize',14)
set(gca, 'FontSize',14)



