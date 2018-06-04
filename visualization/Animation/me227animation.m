close all; clear all; clc;
addpath(genpath('C:\Users\ddl\Desktop\nkapania\simulation\common'));
world = genWorldFromSK([0 100 300 500], [0 0 .03 .03]);
%world = genWorldFromSK([0 200],[0 0]);
vp = getConstantVP(world, 10);
ts = .005;
veh = getVehicle();

sim = bikeSim(world, veh, ts, vp);

F = [];

%%

figure;
    
for i = 1:10:sim.N
    %plot(sim.posE(i), sim.posN(i),'r*')
    plotVehicle(sim.posE(i), sim.posN(i), sim.psi(i), sim.delta(i), veh);
    axis equal; grid on;
    xlim( [ sim.posE(i)-3 sim.posE(i)+3 ]);
    ylim( [ sim.posN(i)-5 sim.posN(i)+5 ]);

    hold on;
    plot(world.roadE, world.roadN,'k--','LineWidth',2);
    hold off;
    
    F = [F getframe(gcf)];
end

%movie2avi(F, 'straight','fps',30)