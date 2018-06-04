function plotSteeringForces(Plot1,Plot2,desLap1,desLap2, xdata, compareInfo)

dataSetArray = {'Plot1'; 'Plot2'};
desLapArray  = {desLap1; desLap2};

for i = 1:numel(dataSetArray)
dataSet = char(dataSetArray(i));    
figure
plot(eval([dataSet '.' xdata '.' char(desLapArray(i))]),eval([dataSet '.dPsiDotFBforce.' char(desLapArray(i))]),'LineWidth',2);
grid on
hold on
plot(eval([dataSet '.' xdata '.' char(desLapArray(i))]),eval([dataSet '.eCopDotFBforce.' char(desLapArray(i))]),'r','LineWidth',2);
plot(eval([dataSet '.' xdata '.' char(desLapArray(i))]),eval([dataSet '.LK_FBforce.'     char(desLapArray(i))]),'k','LineWidth',2);
plot(eval([dataSet '.' xdata '.' char(desLapArray(i))]),eval([dataSet '.FFW_FyF.'        char(desLapArray(i))]),'c','LineWidth',2);

    if strcmp(xdata, 't') == 1
        xlabel('time (seconds)')
    end
    
    if strcmp(xdata, 'currSegProg') == 1
        xlabel('Distance Along Segment (m)')
    end

ylabel('Force (N)')
legend('\Delta \Psi Feedback', 'COP Error Feedback' ,'Lanekeeping Feedback')
title( char(compareInfo(i)) )
% 

end

end