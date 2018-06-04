
pm.m = 1650;
simulation.g = 9.81;
vehicle.mu_peak = .9;
% pm.max_acceleration = .25*pm.mu_peak*9.81;
vehicle.maxPower = 140E3/pm.m;
vehicle.rollingRes = 255/pm.m;
vehicle.aeroDrag = 0.3638/pm.m;
 
vehicle.a = 1.04;
vehicle.b = 1.42;
% pm.h = .75;
vehicle.h = .5;


ay = linspace(0,vehicle.mu_peak * simulation.g,100);
ax = sqrt((vehicle.mu_peak*simulation.g)^2 - ay.^2);
 
fT = 1/vehicle.a*(vehicle.a - vehicle.h*vehicle.mu_peak);
axWT = -(2*vehicle.mu_peak^2*vehicle.a*simulation.g*vehicle.h-sqrt((2*vehicle.mu_peak^2*vehicle.a*simulation.g*vehicle.h)^2 ...
    - 4*(vehicle.a^2*fT^2-vehicle.mu_peak^2*vehicle.h^2)*(vehicle.a^2*ay.^2 - vehicle.mu_peak^2*vehicle.a^2*simulation.g^2)))...
    /(2*(vehicle.a^2*fT^2 - vehicle.mu_peak^2*vehicle.h^2));
 

% plot(ay,ax);
hold on;
% plot(ay,-ax);
plot(ay,axWT,'k--','linewidth',2);
plot(ay,-axWT,'k--','linewidth',2);
 
% plot(-ay,-ax);
% plot(-ay,ax);
plot(-ay,axWT,'k--','linewidth',2);
plot(-ay,-axWT,'k--','linewidth',2);
 
axis equal;
legend('Experimental Data','Friction Circle with Weight Transfer')