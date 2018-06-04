clear all; 
load workspace

close all;
h(1) = subplot(3, 1, 1);
hold on; grid on;
ylim([-.1 .6])
plot(sim.s, -sim.t + interp1(simQ.s, simQ.t, sim.s),'k','LineWidth',2)
set(gca,'XTickLabel',[])
ylabel('Time Difference (s)','FontSize',14,'FontName','Arial')

h(2) = subplot(3, 1, 2);
hold on; grid on;
ylim([-.025 .03])
plot(world.s, world.K,'LineWidth',2)
plot(qW.s, qW.K,'r','LineWidth',2)
set(gca,'XTickLabel',[])
ylabel('Path Curvature (1/m)','FontSize',14,'FontName','Arial')

h(3) = subplot(3, 1, 3);
plot(sim.s, sim.Ux,'LineWidth',2)
ylim([15 51])
hold on; grid on;
plot(simQ.s, simQ.Ux,'r','LineWidth',2)
ylabel('Predicted Velocity (m/s)','FontSize',14,'FontName','Arial')
xlabel('Distance Along Path (m)','FontSize',14,'FontName','Arial')
legend('Fast Gen','Nonlinear Opt')

linkaxes(h,'x')
xlim([0 4600]);