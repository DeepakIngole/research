function plotSlips(Plot1,Plot2, desLap1, desLap2, xdata, type, lgndInfo)

figure

lgnd1 = lgndInfo(1:2);
lgnd2 = lgndInfo(3:4);

alphaFrontLimit = 6; %deg
alphaRearLimit  = 5; %deg
kappaFrontLimit = .1;
kappaRearLimit  = .1;

if strcmp(type, 'kappa') == 1

    subplot(2,1,1)

    plot(eval(['Plot1' '.' xdata '.' desLap1 ]),eval(['Plot1' '.kappaFront.' desLap1 ]),'LineWidth',2);
    grid on
    hold on
    plot(eval(['Plot2' '.' xdata '.' desLap2 ]),eval(['Plot2' '.kappaFront.' desLap2 ]),'r','LineWidth',2);
    legend(lgnd1)
    ylabel('\kappa')
    title(['kappaFrontLimit = ' num2str(kappaFrontLimit)])

    subplot(2, 1, 2)
    plot(eval(['Plot1' '.' xdata '.' desLap1 ]),eval(['Plot1' '.kappaRear.' desLap1 ]),'LineWidth',2);
    grid on
    hold on
    plot(eval(['Plot2' '.' xdata '.' desLap2 ]),eval(['Plot2' '.kappaRear.' desLap2 ]),'r','LineWidth',2);
    legend(lgnd2)
    ylabel('\kappa')
    title(['kappaRearLimit = ' num2str(kappaRearLimit)])
    if strcmp(xdata, 't') == 1
        xlabel('time (seconds)')
    end
    
    if strcmp(xdata, 'currSegProg') == 1
        xlabel('Distance Along Segment (m)')
    end

elseif strcmp(type, 'alpha') == 1
    subplot(2,1,1)
    plot(eval(['Plot1' '.' xdata '.' desLap1 ]),eval(['Plot1' '.alphaFront.' desLap1 '*180/pi']),'LineWidth',2);
    grid on
    hold on
    plot(eval(['Plot2' '.' xdata '.' desLap2 ]),eval(['Plot2' '.alphaFront.' desLap2 '*180/pi']),'r','LineWidth',2);
    legend(lgnd1)
    ylabel('\alpha(deg)')
    title(['alphaFrontLimit = ' num2str(alphaFrontLimit) ' deg'])

    subplot(2, 1, 2)
    plot(eval(['Plot1' '.' xdata '.' desLap1 ]),eval(['Plot1' '.alphaRear.' desLap1 '*180/pi']),'LineWidth',2);
    grid on
    hold on
    plot(eval(['Plot2' '.' xdata '.' desLap2 ]),eval(['Plot2' '.alphaRear.' desLap2 '*180/pi']),'r','LineWidth',2);
    legend(lgnd2)
    ylabel('\alpha (deg)')
    title(['alphaRearLimit = ' num2str(alphaRearLimit) 'deg'])
    if strcmp(xdata, 't') == 1
        xlabel('time (seconds)')
    end
    
    if strcmp(xdata, 'currSegProg') == 1
        xlabel('Distance Along Segment (m)')
    end
else
    error('select kappa or alpha to plot')
end

end
    