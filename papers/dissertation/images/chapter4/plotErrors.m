close all; clear all; clc;
load('C:\Users\ddl\Documents\localTestData\raceData\s1.mat')

subplot(3, 1, 1)
plot(s, UxDesired, 'r','LineWidth',2);
hold on; grid on; 
plot(s, Ux,'LineWidth',2);
ylabel('Speed (m/s)','FontName','Arial','FontSize',14)
legend('Desired','Actual')
xlim([0 4500])
ylim([15 50])

subplot(3, 1, 2)
plot(s, eTrue, 'b','LineWidth',2);
hold on; grid on; 
ylabel('Lateral Error (m)','FontName','Arial','FontSize',14)
ylim([-1.5 1])
xlim([0 4500])

aF = alphaF/(8*pi/180);
aR = alphaR/(6*pi/180);
kF = kappaF/.1;
kR = kappaR/.1;

zetaF = sqrt(aF.^2 + kF.^2);
zetaR = sqrt(aR.^2 + kR.^2);
zeta = max(zetaF, zetaR);

subplot(3, 1, 3)
plot(s, zeta, 'b','LineWidth',2);
hold on; grid on; 
ylabel('Tire Utilization (\zeta)','FontName','Arial','FontSize',14)
xlabel('Distance Along Path (m)','FontName','Arial','FontSize',14)
ylim([0 1.2])
xlim([0 4500])
