%%Nitin Kapania
%this script compares thunder hill data between two user selected runs.
%currently assumes only 2 lap tests.

%% clear everything except for map data, specify difference in two runs
    
 close all; clc; clearvars -except testData1 testData2 mapData desTurns
 compareInfo = {'David'; 'Shelley'};

%% enter number of laps in data and turns you want to look at
desTurns = 1:16;

%% load map and test data if it doesn't exist in workspace
loadData
%% get segments to look at
segs = segsFromMapData(mapData, desTurns);

%% restrict data to when car is moving, and get data for the turns interested in
processData

%% plot data

%xdata = 't';
xdata = 'currSegProg';
desLap1 = 'Lap1';
desLap2 = 'Lap2';

plotSlips           (Plot1,Plot2,desLap1,desLap2,xdata, 'alpha', {[char(compareInfo(1)) ' Front'];[char(compareInfo(2)) ' Front'];[char(compareInfo(1)) ' Rear'];[char(compareInfo(2)) ' Rear']})
plotMap (Plot1,Plot2,desLap1,desLap2, compareInfo)

plotThunderHillData (Plot1,Plot2,desLap1,desLap2,xdata,{'sideSlip'},'Sideslip Angle (deg)', compareInfo,'scaleYdeg')
 plotThunderHillData (Plot1,Plot2,desLap1,desLap2,xdata,{'deltaPsi'},'Delta Psi (deg)', compareInfo, 'scaleYdeg')
 plotThunderHillData (Plot1,Plot2,desLap1,desLap2,xdata,{'e'},'Lateral Error (m)', compareInfo,'normal')
plotThunderHillData (Plot1,Plot2,desLap1,desLap2,xdata,{'roadWheelAngle'},'Road Wheel Angle (deg)', compareInfo,'scaleYdeg')

plotThunderHillData (Plot1,Plot2,desLap1,desLap2,xdata,{'segNumber'},'Segment Number', compareInfo,'normal')
plotThunderHillData (Plot1,Plot2,desLap1,desLap2,xdata,{'yawRate'},'Yaw Rate (rad/s)', compareInfo,'normal')
% plotThunderHillData (Plot1,Plot2,desLap1,desLap2,xdata,{'vyCG'},'Lateral Velocity (m/s)', compareInfo,'normal')
plotThunderHillData (Plot1,Plot2,desLap1,desLap2,xdata,{'vxCG' 'UxDesired'}, 'Longitudinal Velocity (m/s)',{char(compareInfo(1)); char(compareInfo(2)); [char(compareInfo(1)) ' Desired'];[char(compareInfo(2)) ' Desired']},'normal')

plotThunderHillData (Plot1,Plot2,desLap1,desLap2,xdata,{'axCG' 'axDesired'}, 'Longitudinal Accel (m/s^2)',{char(compareInfo(1)) ; char(compareInfo(2)); [char(compareInfo(1)) ' Desired'];[char(compareInfo(2)) ' Desired']},'normal') 
plotThunderHillData (Plot1,Plot2,desLap1,desLap2,'ayCG',{'axCG'},'ax (m/s^2)', compareInfo,'normal'); ggdiagram;
 plotLowLevelCommands(Plot1,Plot2,desLap1,desLap2,xdata,compareInfo)
plotSteeringForces  (Plot1,Plot2,desLap1,desLap2,xdata, compareInfo)

plotSlipCircle      (Plot1,Plot2,desLap1,desLap2,{[char(compareInfo(1)) ' Front'];[char(compareInfo(2)) ' Front'];[char(compareInfo(1)) ' Rear'];[char(compareInfo(2)) ' Rear']})
plotSlips           (Plot1,Plot2,desLap1,desLap2,xdata, 'kappa', {[char(compareInfo(1)) ' Front'];[char(compareInfo(2)) ' Front'];[char(compareInfo(1)) ' Rear'];[char(compareInfo(2)) ' Rear']})
plotThunderHillData (Plot1, Plot2,desLap1,desLap2,xdata,{'FBforce' 'FFWforce'},'Longitudinal Force (N)', {[char(compareInfo(1)) ' FB'];[char(compareInfo(2)) ' FB'];[char(compareInfo(1)) ' FFW'];[char(compareInfo(2)) ' FFW']},'normal')
plotThunderHillData  (Plot1, Plot2,desLap1,desLap2,xdata,{'brakePressure'}, 'Brake Pressure (bar)', compareInfo, 'normal')
plotBrakeGain       (Plot1, Plot2,desLap1,desLap2,xdata, compareInfo)  
% % %% plot path on track

% 
% 
% % %%
% % 
% % %video animation
% % figure
% % for i = 1:numel(posE)
% % % plot(posE(i),posN(i))
% % % xlim([posE(i)-5, posE(i)+5])
% % % ylim([posN(i)-5, posN(i)+5])
% % % xlabel('E (m)')
% % % ylabel('N (m)')
% % 
% % offset = 10;
% % frameRate = 30;
% % 
% % 
% % 
% % if mod(i, frameRate) == 0
% % 
% % hold on
% % plot(posE(i),posN(i),'ro','MarkerSize',4)
% % plot(road_bounds_in(:,1),road_bounds_in(:,2),'k','LineWidth',2)
% % plot(road_bounds_out(:,1),road_bounds_out(:,2),'k','LineWidth',2)
% % plot([posE(i) - b*cos(heading(i)+pi/2), posE(i) + a*cos(heading(i)+pi/2)], [posN(i) - b*sin(heading(i)+pi/2), posN(i) + a*sin(heading(i)+pi/2)])
% % pause(1/frameRate)
% % xlim([posE(i)-offset, posE(i)+offset])
% % ylim([posN(i)-offset, posN(i)+offset])
% % 
% % 
% % hold off
% % xlabel('E (m)')
% % ylabel('N (m)')
% % 
% % end
% % 
% % 
% % end
% 
% 
% 
% 
% 
%     