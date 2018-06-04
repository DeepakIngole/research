function plotMap(Plot1,Plot2, desLap1, desLap2, lgndInfo)

figure
load thunder_hill_bounds_final.mat;

hold on
axis equal

plot(eval(['Plot1' '.posE.' desLap1]),eval(['Plot1' '.posN.' desLap1]),'LineWidth',2);
grid on
plot(eval(['Plot2' '.posE.' desLap2]),eval(['Plot2' '.posN.' desLap2]),'r','LineWidth',2);
plot(road_bounds_in(:,1),road_bounds_in(:,2),'k','LineWidth',2)
plot(road_bounds_out(:,1),road_bounds_out(:,2),'k','LineWidth',2)
xlabel('North(m)')
ylabel('East (m)')
legend(lgndInfo)



end