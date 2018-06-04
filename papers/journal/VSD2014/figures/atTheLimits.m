clear all; close all; clc;
x = load('C:\Users\ddl\Documents\localTestData\2014 10 NewLapTimeAndProData\_unmannedLapTime\mu92unmannedvmax_HL_2014-10-07_aa.mat');

xInd = 4.4e4:6.8e4;
%yInd = 6500:numel(y.t);

figure; 
subplot(4, 1, 1)
plot(x.mapMatch.s(xInd), x.mapMatch.e(xInd),'LineWidth',2,'Color','k');
set(gca,'FontName','Arial','FontSize',14,'XTickLabel',[])
hold on; grid on;
%plot(y.mapMatch.s(yInd), y.mapMatch.e(yInd),'r','LineWidth',2);
ylim([-1.4 1])
xlim([0 3000])
ylabel('Tracking Error e (m)','FontName','Arial','FontSize',14);

subplot(4, 1, 2)
plot(x.mapMatch.s(xInd), x.mapMatch.deltaPsi(xInd)*180/pi,'LineWidth',2, 'Color', 'k');
set(gca,'FontName','Arial','FontSize',14,'XTickLabel',[])
hold on; grid on;
ylim([-3 5])
xlim([0 3000])
ylabel('Heading Angle Error \Delta\Psi (deg)','FontName','Arial','FontSize',14);

subplot(4, 1, 3)
plot(x.mapMatch.s(xInd), x.OxTSData.sideSlip(xInd)*180/pi,'LineWidth',2, 'Color', [0 .8 1]);
set(gca,'FontName','Arial','FontSize',14,'XTickLabel',[])
hold on; grid on;
plot(x.mapMatch.s(xInd), (x.HLsteering.alphaRdes(xInd)+x.params.TTS.b*x.mapMatch.curvature(xInd))*180/pi,'k','LineWidth',2);
ylim([-5 2.5])
xlim([0 3000])
ylabel('Sideslip (deg)','FontName','Arial','FontSize',14);

subplot(4, 1, 4)
plot(x.mapMatch.s(xInd), x.tireSlip.alphaFront(xInd)*180/pi,'LineWidth',2);
set(gca,'FontName','Arial','FontSize',14)
hold on; grid on;
plot(x.mapMatch.s(xInd), x.tireSlip.alphaRear(xInd)*180/pi,'k','LineWidth',2);
ylim([-12 6])
xlim([0 3000])
ylabel('Tire Slip (deg)','FontName','Arial','FontSize',14);
xlabel('Distance Along Path (m)','FontName','Arial','FontSize',14);





