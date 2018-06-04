close all;
figure;
hold on; grid on; xlim([-450 400]); ylim([-300 750]); axis equal;
plot(D(5).world.roadE, D(5).world.roadN,'b','LineWidth',2)
plot(qW.roadE, qW.roadN,'r','LineWidth',2)
plot(gW.roadE, gW.roadN,'g','LineWidth',2)
plot(bounds.in(:,1), bounds.in(:,2),'k')
plot(bounds.out(:,1), bounds.out(:,2),'k')
xlabel('East (m)','FontSize',14)
ylabel('North (m)', 'FontSize', 14);
legend('Fast Generation','Nonlinear Opt','Professional Driver')

figure;
hold on; grid on; 
plot(D(5).world.s, D(5).world.K,'b','LineWidth',2)
plot(qW.s, qW.K,'r','LineWidth',2)
plot(gW.s, gW.K,'g','LineWidth', 2)
xlabel('Distance Along Path (m)','FontSize',14)
ylabel('Path Curvature (1/m)', 'FontSize', 14);
legend('Fast Gen.','NL opt','Pro Driver');
xlim([0 4500]); ylim([-.025 .03])

figure;
hold on; grid on; 
plot(D(5).vp.s, D(5).vp.Ux,'b','LineWidth',2)
plot(vpQ.s, vpQ.Ux,'r','LineWidth',2)
%plot(vpG.s-25, vpW.Ux,'g','LineWidth', 2)
xlabel('Distance Along Path (m)','FontSize',14)
ylabel('Velocity (m/s)', 'FontSize', 14);
legend('Fast Gen.','NL opt','Pro Driver');
xlim([0 4500]);

for i = 1:4
    lapTime(i) = D(i).sim.t(end);
end

%for i = 1:5
%    lapTime(i) = trapz(D(i).vp.s, 1./D(i).vp.Ux);
%end

%refTime = trapz(vpRef.s, 1./vpRef.Ux);
%qTime = trapz(vpQ.s, 1./vpQ.Ux);

figure;
hold on; grid on;
plot([0:4], [simRef.t(end) lapTime],'bo','MarkerSize',12,'MarkerFaceColor','b')
plot([0 4], [simQ.t(end) simQ.t(end)],'r','LineWidth',2)
xlabel('Iteration Number','FontSize',14)
ylabel('Predicted Lap Time (s)','FontSize',14)
legend('Fast Gen', 'NL opt')


