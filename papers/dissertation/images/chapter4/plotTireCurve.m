clear all; close all; clc;
addpath(genpath('C:\Users\ddl\Desktop\nkapania\simulation\common'));

veh = getVehicle('nonlinear','closest');
Fx = 1e3*[0; 2; 4; 6; 8];
N = 100;
Fy = zeros(N, 1);
alpha = linspace(0, 8*pi/180, N);

figure;

for j = 1:len(Fx)
    for i = 1:N
        Fy(i) = abs(coupledTireForces(alpha(i), Fx(j), veh, 'front'));
    end
    hold on; plot(alpha*180/pi, Fy,'k','LineWidth',2);
end

grid on; hold on;
xlabel('Lateral Tire Slip \alpha (deg)','FontSize',14);
ylabel('Lateral Tire Force Magnitude (N)','FontSize',14);