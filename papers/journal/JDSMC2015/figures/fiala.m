close all;
figure;
plot(veh.alphaFrontTable*180/pi, veh.FyFtable,'k--','LineWidth',2)
grid on;
xlim([-6 6])
set(gca,'FontSize',14)
xlabel('Slip Angle \alpha (deg)','FontSize',14)
ylabel('Lateral Tire Force F_y (N)','FontSize',14)