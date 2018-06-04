clear all; close all; clc;
y = load('C:\Users\ddl\Documents\localTestData\2013 11 SCFG Lanekeeping Development\fullauto13mpsusesideslip_HL_2013-11-14_aa.mat');
x = load('C:\Users\ddl\Documents\localTestData\2013 11 SCFG Lanekeeping Development\fullauto13mpslanekeepingonly_HL_2013-11-14_aa.mat');
x1 = load('C:\Users\ddl\Documents\localTestData\2013 11 SCFG Lanekeeping Development\fullauto10mpslanekeepingonly_HL_2013-11-14_aa.mat');
y1 = load('C:\Users\ddl\Documents\localTestData\2013 11 SCFG Lanekeeping Development\fullauto10mpsusesideslip_HL_2013-11-14_aa.mat');

x1Ind = 1.184e4:1.60e4;
y1Ind = 6559:10800;
xInd = 4215:7769;
yInd = 5480:9165;
%%
xs = x.mapMatch.dstAlongPath(xInd); 
ys = y.mapMatch.dstAlongPath(yInd); 
x1s = x1.mapMatch.dstAlongPath(x1Ind); 
y1s = y1.mapMatch.dstAlongPath(y1Ind); 

yr = y.ApplanixData.yawRate(yInd);
xr = x.ApplanixData.yawRate(xInd);
y1r = y1.ApplanixData.yawRate(y1Ind);
x1r = x1.ApplanixData.yawRate(x1Ind);

xe = x.mapMatch.e(xInd);
ye = y.mapMatch.e(yInd);
x1e = x1.mapMatch.e(x1Ind);
y1e = y1.mapMatch.e(y1Ind);

xdel = x.HLsteering.deltaFB(xInd);
ydel = y.HLsteering.deltaFB(yInd);
x1del = x1.HLsteering.deltaFB(x1Ind);
y1del = y1.HLsteering.deltaFB(y1Ind);

ybeta = y.ApplanixData.sideSlip(yInd);
xbeta = x.ApplanixData.sideSlip(xInd);
y1beta = y1.ApplanixData.sideSlip(y1Ind);
x1beta = x1.ApplanixData.sideSlip(x1Ind);

ydpsi = y.mapMatch.deltaPsi(yInd);
xdpsi = x.mapMatch.deltaPsi(xInd);
y1dpsi = y1.mapMatch.deltaPsi(y1Ind);
x1dpsi = x1.mapMatch.deltaPsi(x1Ind);

%%

subplot(4, 2, 1); hold on; grid on;
title('a_y = 7 m/s^2','FontName','Arial','FontSize',14)
xlim([150 200]); %ylim([-1.5, 1]);
set(gca,'XTickLabel',[])
plot(x1s, x1r,'k','LineWidth',2)
plot(y1s, y1r,'LineWidth',2,'Color', [0 .8 1])
legend('Original Controller','With Sideslip FB')
ylabel('Yaw Rate (rad/s)','FontName','Arial','FontSize',14)


subplot(4, 2, 2); hold on; grid on;
title('a_y = 9 m/s^2','FontName','Arial','FontSize',14)
xlim([150 200]); ylim([-1.5, 1]);
set(gca,'XTickLabel',[])
plot(xs, xr,'k','LineWidth',2)
plot(ys, yr,'LineWidth',2,'Color', [0 .8 1])

subplot(4, 2, 3); hold on; grid on;
xlim([150 200]); %ylim([-5 25]);
set(gca,'XTickLabel',[])
plot(x1s, x1beta*180/pi,'k','LineWidth',2)
plot(x1s, x1dpsi*180/pi, 'k--','LineWidth',2)
plot(y1s, y1beta*180/pi,'LineWidth',2, 'Color', [0 .8 1])
plot(y1s, y1dpsi*180/pi, '--','LineWidth',2, 'Color', [0 .8 1])
legend('Sideslip','Heading Error')
ylabel('Sideslip (deg)','FontName','Arial','FontSize',14)

subplot(4, 2, 4); hold on; grid on;
xlim([150 200]); %ylim([-5 25]);
set(gca,'XTickLabel',[])
plot(xs, xbeta*180/pi,'k','LineWidth',2)
plot(ys, ybeta*180/pi,'LineWidth',2, 'Color', [0 .8 1])
plot(xs, xdpsi*180/pi, 'k--','LineWidth',2)
plot(ys, ydpsi*180/pi, '--','LineWidth',2, 'Color', [0 .8 1])

subplot(4, 2, 5); hold on; grid on;
xlim([150 200]); %ylim([-5 25]);
set(gca,'XTickLabel',[])
plot(x1s, x1e,'k','LineWidth',2)
plot(y1s, y1e,'LineWidth',2, 'Color', [0 .8 1])
ylabel('Tracking Error (m)','FontName','Arial','FontSize',14)


subplot(4, 2, 6); hold on; grid on;
xlim([150 200]); %ylim([-5 25]);
set(gca,'XTickLabel',[])
plot(xs, xe,'k','LineWidth',2)
plot(ys, ye,'LineWidth',2, 'Color', [0 .8 1])

subplot(4, 2, 7); hold on; grid on;
xlim([150 200]); %ylim([-5 25]);
plot(x1s, x1del*180/pi,'k','LineWidth',2)
plot(y1s, y1del*180/pi,'LineWidth',2, 'Color', [0 .8 1])
xlabel('Distance Along Path (m)','FontName','Arial','FontSize',14)
ylabel('Steer FB (deg)','FontName','Arial','FontSize',14)


subplot(4, 2, 8); hold on; grid on;
xlim([150 200]); %ylim([-5 25]);
plot(xs, xdel*180/pi,'k','LineWidth',2)
plot(ys, ydel*180/pi,'LineWidth',2, 'Color', [0 .8 1])
xlabel('Distance Along Path (m)','FontName','Arial','FontSize',14)
