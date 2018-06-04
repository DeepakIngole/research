function plotLowLevelCommands(Plot1,Plot2, desLap1, desLap2,xdata, lgndInfo)
figure
subplot(5,1,1)
plot(eval(['Plot1' '.' xdata '.' desLap1]),eval(['Plot1' '.throttle.' desLap1]),'LineWidth',2);
grid on
hold on
plot(eval(['Plot2' '.' xdata '.' desLap2]),eval(['Plot2' '.throttle.' desLap2]),'r','LineWidth',2);

    if strcmp(xdata, 't') == 1
        xlabel('time (seconds)')
    end
    
    if strcmp(xdata, 'currSegProg') == 1
        xlabel('Distance Along Segment (m)')
    end

ylim([0 100])
ylabel('throttle command (%)')
legend(lgndInfo)

% 
subplot(5,1,2)
plot(eval(['Plot1' '.' xdata '.' desLap1]),eval(['Plot1' '.brakePressure.' desLap1]),'LineWidth',2);
grid on
hold on
plot(eval(['Plot2' '.' xdata '.' desLap2]),eval(['Plot2' '.brakePressure.' desLap2]),'r','LineWidth',2);

    if strcmp(xdata, 't') == 1
        xlabel('time (seconds)')
    end
    
    if strcmp(xdata, 'currSegProg') == 1
        xlabel('Distance Along Segment (m)')
    end

ylim([0 100])
ylabel('brake command (%)')
legend(lgndInfo)

%
subplot(5,1,3)
plot(eval(['Plot1' '.' xdata '.' desLap1]),eval(['Plot1' '.gearPosition.' desLap1]),'LineWidth',2);
grid on
hold on
plot(eval(['Plot2' '.' xdata '.' desLap2]),eval(['Plot2' '.gearPosition.' desLap2]),'r','LineWidth',2);

    if strcmp(xdata, 't') == 1
        xlabel('time (seconds)')
    end
    
    if strcmp(xdata, 'currSegProg') == 1
        xlabel('Distance Along Segment (m)')
    end

ylim([1 6])
ylabel('gear command (%)')
legend(lgndInfo)

%
subplot(5,1,4)
plot(eval(['Plot1' '.' xdata '.' desLap1]),eval(['Plot1' '.rpm.' desLap1]),'LineWidth',2);
grid on
hold on
plot(eval(['Plot2' '.' xdata '.' desLap2]),eval(['Plot2' '.rpm.' desLap2]),'r','LineWidth',2);

    if strcmp(xdata, 't') == 1
        xlabel('time (seconds)')
    end
    
    if strcmp(xdata, 'currSegProg') == 1
        xlabel('Distance Along Segment (m)')
    end
ylim([0 9000])
ylabel('engine RPM')
legend(lgndInfo)

subplot(5,1,5)
plot(eval(['Plot1' '.' xdata '.' desLap1]),eval(['Plot1' '.handwheelAngle.' desLap1 '*180/pi']),'LineWidth',2);
grid on
hold on
plot(eval(['Plot2' '.' xdata '.' desLap2]),eval(['Plot2' '.handwheelAngle.' desLap2 '*180/pi']),'r','LineWidth',2);

    if strcmp(xdata, 't') == 1
        xlabel('time (seconds)')
    end
    
    if strcmp(xdata, 'currSegProg') == 1
        xlabel('Distance Along Segment (m)')
    end
ylim([-200 200])
ylabel('Handwheel Angle (deg)')
legend(lgndInfo)

end