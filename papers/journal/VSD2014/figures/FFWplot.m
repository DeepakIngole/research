%script to plot handling diagram for FFW - both with sideslip information
%and without
close all; clear all; clc;
veh = getVehicle();

K = [.005 .01 .02]; N = 1000; M = numel(K);
Ux = linspace(5, 30, N);

for j = 1:M
    FyF = veh.m*veh.b/veh.L*Ux.^2*K(j);
    FyR = veh.m*veh.a/veh.L*Ux.^2*K(j);   
    for i = 1:N
        aF(i) = interp1(veh.FyFtable, veh.alphaFrontTable, FyF(i),'linear',-max(veh.alphaFrontTable)*sign(FyF(i)));
        aR(i) = interp1(veh.FyRtable, veh.alphaRearTable, FyR(i), 'linear',-max(veh.alphaRearTable)*sign(FyR(i)));
        betaSS(i) = aR(i) + veh.b*K(j);
    end
    delta = veh.L*K(j) - aF + aR;
	deltaB = delta  - veh.kLK*veh.xLA*betaSS;
    plot(Ux, delta*180/pi,'k','LineWidth',2)
    hold on;
    plot(Ux, deltaB*180/pi,'k--','LineWidth',2)  
end

xlim([5, 25])
ylim([0, 4.5])
grid on;
xlabel('Vehicle Speed (m/s)','FontName','Arial','FontSize',14)
ylabel('Feedforward Steering Command \delta_{FFW} (deg)','FontName','Arial','FontSize',14)
legend('FFW From Handling Diagram', 'With Steady State Sideslip')


