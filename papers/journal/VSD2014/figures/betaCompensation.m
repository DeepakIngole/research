clear all; close all; clc;
x = load('C:\Users\ddl\Documents\localTestData\2014 9 DataForJapan\mu8beta_HL_2014-09-17_aa.mat');
y = load('C:\Users\ddl\Documents\localTestData\2014 9 DataForJapan\mu8lk_HL_2014-09-17_aa.mat');

xInd = 6380:numel(x.t);
yInd = 6500:numel(y.t);

figure; 
subplot(4, 1, 1)
plot(x.mapMatch.s(xInd), x.mapMatch.e(xInd),'LineWidth',2,'Color',[0 .8 1]);
set(gca,'FontName','Arial','FontSize',14,'XTickLabel',[])
hold on; grid on;
plot(y.mapMatch.s(yInd), y.mapMatch.e(yInd),'k','LineWidth',2);
ylim([-.6 .5])
xlim([0 3000])
ylabel('Tracking Error e (m)','FontName','Arial','FontSize',14);

subplot(4, 1, 2)
plot(x.mapMatch.s(xInd), x.mapMatch.deltaPsi(xInd)*180/pi,'LineWidth',2,'Color', [0 .8 1]);
set(gca,'FontName','Arial','FontSize',14,'XTickLabel',[])
hold on; grid on;
plot(y.mapMatch.s(yInd), y.mapMatch.deltaPsi(yInd)*180/pi,'k','LineWidth',2);
ylim([-3 3])
xlim([0 3000])
ylabel('Heading Error \Delta\Psi (deg)','FontName','Arial','FontSize',14);

subplot(4, 1, 3)
plot(x.mapMatch.s(xInd), x.params.steeringController.kLK*(x.mapMatch.e(xInd) + x.params.steeringController.xLA*x.mapMatch.deltaPsi(xInd))*180/pi ,'LineWidth',2, 'Color', [0 .8 1]);
set(gca,'FontName','Arial','FontSize',14,'XTickLabel',[])
hold on; grid on;
plot(y.mapMatch.s(yInd), y.HLsteering.deltaFB(yInd)*180/pi,'k','LineWidth',2);
ylim([-2 2])
xlim([0 3000])
ylabel('Steering FB (deg)','FontName','Arial','FontSize',14);

subplot(4, 1, 4)
plot(x.mapMatch.s(xInd), 180/pi*(x.HLsteering.deltaFFW(xInd) - x.params.steeringController.xLA*x.params.steeringController.kLK*(x.HLsteering.alphaRdes(xInd) + x.params.TTS.b*x.mapMatch.curvature(xInd))),'LineWidth',2, 'Color', [0 .8 1]);
set(gca,'FontName','Arial','FontSize',14)
hold on; grid on;
plot(y.mapMatch.s(yInd), y.HLsteering.deltaFFW(yInd)*180/pi,'k','LineWidth',2);
ylim([-3 3])
xlim([0 3000])
ylabel('Steering FFW (deg)','FontName','Arial','FontSize',14);
xlabel('Distance Along Path (m)','FontName','Arial','FontSize',14);







