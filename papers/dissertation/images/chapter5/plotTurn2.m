close all; clear all; clc;

addpath('C:\Users\ddl\Documents\localTestData\raceData')
load p1 %mu = .9
x0 = [840 1236];
aF = alphaF/(8*pi/180);aR = alphaR/(6*pi/180);kF = kappaF/.1;kR = kappaR/.1;zetaF = sqrt(aF.^2 + kF.^2);zetaR = sqrt(aR.^2 + kR.^2);zeta = max(zetaF, zetaR);

subplot(3, 1, 1)
plot(s, UxDesired,'k','LineWidth',2)
grid on; hold on;
xlim(x0)

subplot(3, 1, 2)
plot(s, Ux,'k','LineWidth',2)
grid on; hold on;
ind = (FxFB~=0);
plot(s(ind), Ux(ind),'k*')
xlim(x0)

subplot(3, 1, 3)
plot(s, zeta,'k','LineWidth',2)
grid on; hold on;
xlim(x0)


load p25 %mu = .93; 
aF = alphaF/(8*pi/180);aR = alphaR/(6*pi/180);kF = kappaF/.1;kR = kappaR/.1;zetaF = sqrt(aF.^2 + kF.^2);zetaR = sqrt(aR.^2 + kR.^2);zeta = max(zetaF, zetaR);

c = 'b';
subplot(3, 1, 1)
plot(s, UxDesired,c,'LineWidth',2)
grid on; hold on;
xlim(x0)

subplot(3, 1, 2)
plot(s, Ux,c,'LineWidth',2)
grid on; hold on;
ind = (FxFB~=0);
plot(s(ind), Ux(ind),[c '*'])
xlim(x0)

subplot(3, 1, 3)
plot(s, zeta,c,'LineWidth',2)
grid on; hold on;
xlim(x0)

load p26 %mu = .95; 
aF = alphaF/(8*pi/180);aR = alphaR/(6*pi/180);kF = kappaF/.1;kR = kappaR/.1;zetaF = sqrt(aF.^2 + kF.^2);zetaR = sqrt(aR.^2 + kR.^2);zeta = max(zetaF, zetaR);

c = 'r';
subplot(3, 1, 1)
plot(s, UxDesired,c,'LineWidth',2)
grid on; hold on;
xlim(x0)
ylabel('Desired Speed (m/s)','FontSize',14)

subplot(3, 1, 2)
plot(s, Ux,c,'LineWidth',2)
grid on; hold on;
ind = (FxFB~=0);
plot(s(ind), Ux(ind),[c '*'])
xlim(x0)
ylabel('Actual Speed (m/s)','FontSize',14)

subplot(3, 1, 3)
plot(s, zeta,c,'LineWidth',2)
grid on; hold on;
xlim(x0)

legend('\mu = .9','\mu = .93','\mu = .95');
xlabel('Distance Along Path (m)','FontSize',14)
ylabel('Tire Utilization \zeta','FontSize',14)