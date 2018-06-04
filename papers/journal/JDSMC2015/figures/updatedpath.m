clear all; close all; clc;
addpath(genpath('scripts')); addpath(genpath('maps')); addpath(genpath('vehicles'))

%get vehicle, road friction, and the buffer around the track edge,
%as well as simulation sample time
veh = getVehicle('tts'); mu = .9; buffer = .35; sampleTime = .01;  %meters


%get centerline description
refWorld = genWorldFromCSV('THcenter.csv'); 

%get road boundaries
bounds = load('thunderhill_bounds_shifted.mat');
refWorld = getLaneWidth(refWorld, bounds, buffer);

%Solve for Optimal Path
opt1  = getRapidTrajectory(refWorld, veh, mu);
world1 = updateWorld(refWorld, opt1, bounds, buffer);

%%
close all;
plot(refWorld.roadE, refWorld.roadN,'k--','LineWidth',2)
hold on; grid on; axis equal;
plot(world1.roadE, world1.roadN,'r','LineWidth',2)
plot(bounds.out(:,1), bounds.out(:,2),'k','LineWidth',2)
plot(bounds.in(:,1), bounds.in(:,2),'k','LineWidth',2)

set(gca, 'FontSize',12)
xlabel('East (m)','FontSize',14)
ylabel('North (m)','FontSize',14)
legend('Original Ref. Path', 'Updated Path','Track Edge')
xlim([-150 10])