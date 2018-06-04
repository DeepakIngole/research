function plotThunderHillData(Plot1,Plot2,desLap1, desLap2, x, y, ylab, leg, handler)

figure
grid on
hold on
colorArray = ['b' 'm' 'c' 'k' 'r'];

if strcmp(handler,'normal') ==1 
    for i = 1:numel(y)   
        plot(eval(['Plot1.' x '.' desLap1]), eval(['Plot1.' char(y(i)) '.' desLap1]),colorArray(i),'LineWidth',2)
        plot(eval(['Plot2.' x '.' desLap2]), eval(['Plot2.' char(y(i)) '.' desLap2]),colorArray(end+1-i),'LineWidth',2)
    end
    
    if strcmp(x, 't') == 1
        xlabel('time (seconds)')
    else
        xlabel('Distance Along Segment (m)')
    end
    
    ylabel(ylab)
 
 legend(leg')

end

if strcmp(handler,'scaleYdeg') ==1 
    for i = 1:numel(y)   
        plot(eval(['Plot1.' x '.' desLap1]), eval(['Plot1.' char(y(i)) '.' desLap1 '*180/pi']),colorArray(i),'LineWidth',2)
        plot(eval(['Plot2.' x '.' desLap2]), eval(['Plot2.' char(y(i)) '.' desLap2 '*180/pi']),colorArray(end+1-i),'LineWidth',2)
    end
    
    if strcmp(x, 't') == 1
        xlabel('time (seconds)')
    end
    
    if strcmp(x, 'currSegProg') == 1
        xlabel('Distance Along Segment (m)')
    end
    
    ylabel(ylab)
 
 legend(leg')

end
    
    
    
end
    
    
        
    
    
    