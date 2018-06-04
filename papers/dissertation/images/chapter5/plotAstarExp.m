close all; clear all; clc;

a = load('C:\Users\ddl\Documents\localTestData\raceData\s3.mat');
aF = a.alphaF/(8*pi/180);aR = a.alphaR/(6*pi/180);kF = a.kappaF/.1;kR = a.kappaR/.1;zetaF = sqrt(aF.^2 + kF.^2);zetaR = sqrt(aR.^2 + kR.^2);a.zeta = max(zetaF, zetaR);
q = load('C:\Users\ddl\Documents\localTestData\raceData\s1.mat');
aF = q.alphaF/(8*pi/180);aR = q.alphaR/(6*pi/180);kF = q.kappaF/.1;kR = q.kappaR/.1;zetaF = sqrt(aF.^2 + kF.^2);zetaR = sqrt(aR.^2 + kR.^2);q.zeta = max(zetaF, zetaR);
g = load('C:\Users\ddl\Documents\localTestData\raceData\g5.mat');
aF = g.alphaF/(8*pi/180);aR = g.alphaR/(6*pi/180);kF = g.kappaF/.1;kR = g.kappaR/.1;zetaF = sqrt(aF.^2 + kF.^2);zetaR = sqrt(aR.^2 + kR.^2);g.zeta = max(zetaF, zetaR);


h(1) = subplot(3, 1, 1);
hold on; grid on;
ylim([-2 .5])
plot(a.s, a.lt' - interp1(q.s, q.lt, a.s),'k','LineWidth',2)
plot(a.s, a.lt' - interp1(g.s, g.lt, a.s),'b','LineWidth',2)
set(gca,'XTickLabel',[])
legend('vs. \mu = .94','vs. Pro Human')
ylabel('Time Difference (s)','FontSize',14,'FontName','Arial')

h(2) = subplot(3, 1, 2);
plot(a.s, a.Ux,'r','LineWidth',2)
ylim([15 51])
hold on; grid on;
plot(q.s, q.Ux,'k','LineWidth',2)
plot(g.s, g.Ux,'b','LineWidth',2)
set(gca,'XTickLabel',[])
ylabel('Velocity (m/s)','FontSize',14,'FontName','Arial')
legend('A*','\mu(s) = .94', 'Pro Human')



h(3) = subplot(3, 1, 3);
plot(a.s, a.zeta,'r','LineWidth',2)
hold on; grid on;
ylim([0 1.5])
plot(q.s, q.zeta,'k','LineWidth',2)
plot(g.s, g.zeta,'b','LineWidth',2)
set(gca,'XTickLabel',[])
ylabel('Tire Utilization \zeta','FontSize',14,'FontName','Arial')
xlabel('Distance Along Track Centerline (m)','FontSize',14,'FontName','Arial')


linkaxes(h,'x')
xlim([0 4600]);


