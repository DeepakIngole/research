close all; clear all; clc;
load('C:\Users\ddl\Documents\localTestData\FastMapGenerationData\splineDelta1MoreBuffer.mat')

ind = [2350: 4400];

subplot(2, 2, 1);
plot(qW.roadE(ind), qW.roadN(ind),'k','LineWidth',2);
grid on; hold on; axis square;
plot(qW.roadE(ind(1)), qW.roadN(ind(1)),'k*','MarkerSize',6);
plot(qW.roadE(ind(342)), qW.roadN(ind(342)),'k*','MarkerSize',6);
plot(qW.roadE(ind(683)), qW.roadN(ind(683)),'k*','MarkerSize',6);
plot(qW.roadE(ind(1024)), qW.roadN(ind(1024)),'k*','MarkerSize',6);
plot(qW.roadE(ind(1365)), qW.roadN(ind(1365)),'k*','MarkerSize',6);
plot(qW.roadE(ind(1706)), qW.roadN(ind(1706)),'k*','MarkerSize',6);
plot(qW.roadE(ind(2050)), qW.roadN(ind(2050)),'k*','MarkerSize',6);

xlabel('East Position (m)','FontSize',14,'FontName','Arial')
ylabel('North Position (m)','FontSize',14, 'FontName','Arial')

%-qW.s(ind(1))

subplot(2, 2, 2);
plot(qW.s(ind)-qW.s(ind(1)), qW.K(ind),'k','LineWidth',2);
hold on; grid on;
plot(qW.s(ind(1))-qW.s(ind(1)), qW.K(ind(1)),'k*','MarkerSize',6);
plot(qW.s(ind(342))-qW.s(ind(1)), qW.K(ind(342)),'k*','MarkerSize',6);
plot(qW.s(ind(683))-qW.s(ind(1)), qW.K(ind(683)),'k*','MarkerSize',6);
plot(qW.s(ind(1024))-qW.s(ind(1)), qW.K(ind(1024)),'k*','MarkerSize',6);
plot(qW.s(ind(1365))-qW.s(ind(1)), qW.K(ind(1365)),'k*','MarkerSize',6);
plot(qW.s(ind(1706))-qW.s(ind(1)), qW.K(ind(1706)),'k*','MarkerSize',6);
plot(qW.s(ind(2050))-qW.s(ind(1)), qW.K(ind(2050)),'k*','MarkerSize',6);
xlabel('Distance Along Path (m)','FontSize',14,'FontName','Arial')
ylabel('Path Curvature (1/m)','FontSize',14, 'FontName','Arial')
xlim([0 1.09e3-586])
ind2 = find(vpQ.s > 586 & vpQ.s < 1.09e3);

subplot(2, 2, 4);
plot(vpQ.s(ind2)-vpQ.s(ind2(1)), vpQ.Ux(ind2),'k','LineWidth',2);
grid on; hold on; 
cv = [1   169   337   505   673   841];
plot(vpQ.s(ind2(cv))-vpQ.s(ind2(1)), vpQ.Ux(ind2(cv)),'k*','MarkerSize',6);

xlim([0 1.09e3-586])
xlabel('Distance Along Path (m)','FontSize',14,'FontName','Arial')
ylabel('Desired Velocity (m/s)','FontSize',14, 'FontName','Arial')

