clear all; close all; clc;
addpath(genpath('scripts')); addpath(genpath('maps')); addpath(genpath('vehicles'))

%get vehicle, road friction, and the buffer around the track edge,
%as well as simulation sample time
veh = getVehicle('tts'); mu = .9; buffer = .35; sampleTime = .01;  %meters


qW = shiftWorld(genWorldFromCSV('THrace.csv'), -325);
vpQ = getVelocityProfile(downsampleWorld(qW, 10), veh, mu);


%%
close all; 
figure;
subplot(4, 1, 1)
plot(qW.s, qW.K,'k','LineWidth',2); grid on;
set(gca,'FontSize',14,'XTickLabel',[])
ylabel('K (1/m)','FontSize',14)
xlim([50 850])
ylim([-.001 .012])

subplot(4, 1, 2)
grid on;
plot(vpQ.s, vpQ.vP0,'k','LineWidth',2); grid on;
set(gca,'FontSize',14,'XTickLabel',[])
ylabel('Ux (m/s)','FontSize',14)
legend('F_x = 0')
xlim([50 850])
ylim([20 70])

subplot(4, 1, 3)
plot(vpQ.s, vpQ.vP1,'k', 'LineWidth',2)
hold on; grid on; 
plot(vpQ.s, vpQ.vP0, 'k--', 'LineWidth',2)
set(gca,'FontSize',14,'XTickLabel',[])
xlim([50 850])
ylim([20 70])
legend('Forward Pass')
ylabel('Ux (m/s)','FontSize',14)

subplot(4, 1, 4)
plot(vpQ.s, vpQ.Ux,'k', 'LineWidth',2)
hold on; grid on;
plot(vpQ.s, vpQ.vP1, 'k--', 'LineWidth',2)
set(gca,'FontSize',14)
xlim([50 850])
ylim([20 70])
ylabel('Ux (m/s)','FontSize',14)
legend('Backward Pass')