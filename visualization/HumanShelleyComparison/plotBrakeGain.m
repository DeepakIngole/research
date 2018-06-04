function plotBrakeGain(Plot1, Plot2, desLap1, desLap2, x, leg)

figure
grid on
hold on

plot(eval(['Plot1.' x '.' desLap1]), -1./(eval(['Plot1.brakePressure.' desLap1 './Plot1.axCG.' desLap1 '/1.648400000000000e+03'])),'b','LineWidth',2)
plot(eval(['Plot2.' x '.' desLap2]), -1./(eval(['Plot2.brakePressure.' desLap2 './Plot2.axCG.' desLap2 '/1.648400000000000e+03'])),'r','LineWidth',2)
plot(eval(['Plot2.' x '.' desLap2]), 1./.0045*ones(numel(eval(['Plot2.' x '.' desLap2])),1),'k','LineWidth',2)

    if strcmp(x, 't') == 1
        xlabel('time (seconds)')
    else
        xlabel('Distance Along Segment (m)')
    end
    
    ylabel('Brake Effectiveness (N / bar)')
 
 legend(leg')
    
    
end
    
    
        
    
    
    