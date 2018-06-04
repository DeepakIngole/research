clear all; close all; clc;
s =load('C:\Users\ddl\Documents\localTestData\raceData\fg1.mat');
b =load('C:\Users\ddl\Documents\localTestData\raceData\q1.mat');


b.lt = cumtrapz(b.sTrue, 1./b.Ux);
s.lt = cumtrapz(s.sTrue, 1./s.Ux);

%%
close all;
h(1) = subplot(4, 1, 1);
hold on; grid on;
ylim([-.55 .5])
plot(b.s, b.lt' - interp1(s.s, s.lt, b.s),'k','LineWidth',2)
set(gca,'XTickLabel',[])
ylabel('Time Difference (s)','FontSize',14,'FontName','Arial')

h(2) = subplot(4, 1, 2);
plot(s.s, s.Ux,'LineWidth',2)
ylim([15 51])
hold on; grid on;
plot(b.s, b.Ux,'r','LineWidth',2)
set(gca,'XTickLabel',[])
ylabel('Velocity (m/s)','FontSize',14,'FontName','Arial')
legend('FastGen','Nonlinear Opt')

h(3) = subplot(4, 1, 3);
plot(s.s, s.Ux-s.UxDesired,'LineWidth',2)
hold on; grid on;
ylim([-2 1])
plot(b.s, b.Ux - b.UxDesired,'r','LineWidth',2)
set(gca,'XTickLabel',[])
ylabel('Speed Error (m/s)','FontSize',14,'FontName','Arial')

h(4) = subplot(4, 1, 4);
plot(s.s, s.throttle,'b','LineWidth',2)
hold on; grid on;
plot(s.s, -s.brake,'b--','LineWidth',2)
plot(b.s, b.throttle,'r','LineWidth',2)
plot(b.s, -b.brake,'r--','LineWidth',2)
ylabel('Throttle (%) and Brake (-bar)','FontSize',14,'FontName','Arial')
xlabel('Distance Along Track Centerline (m)','FontSize',14,'FontName','Arial')

ylim([-60 110])

linkaxes(h,'x')
xlim([0 4600]);
