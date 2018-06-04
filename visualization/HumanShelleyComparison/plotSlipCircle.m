function plotSlipCircle(Plot1,Plot2, desLap1, desLap2, lgndInfo)

lgnd1 = lgndInfo(1:2);
lgnd2 = lgndInfo(3:4);

alphaFrontLimit = 6; %deg
alphaRearLimit  = 5; %deg
kappaFrontLimit = .1;
kappaRearLimit  = .1;

figure
subplot(2,1,1)

plot(eval(['Plot1' '.alphaFront.' desLap1 '*180/pi/alphaFrontLimit']),eval(['Plot1' '.kappaFront.' desLap1 '/kappaFrontLimit']),'LineWidth',2);
grid on
hold on
axis equal
plot(eval(['Plot2' '.alphaFront.' desLap2 '*180/pi/alphaFrontLimit']),eval(['Plot2' '.kappaFront.' desLap2 '/kappaFrontLimit']),'r','LineWidth',2);
legend(lgnd1)
plotCircle(1)
xlabel('\alpha normalized')
ylabel('\kappa normalized')
title(['alphaFrontLimit = ' num2str(alphaFrontLimit) ' deg'])

subplot(2, 1, 2)
plot(eval(['Plot1' '.alphaRear.' desLap1  '*180/pi/alphaRearLimit']),eval(['Plot1' '.kappaRear.' desLap1 '/kappaRearLimit']),'c','LineWidth',2);
grid on
hold on
axis equal
plot(eval(['Plot2' '.alphaRear.' desLap2 '*180/pi/alphaRearLimit' ]),eval(['Plot2' '.kappaRear.' desLap2 '/kappaRearLimit']),'g','LineWidth',2);
legend(lgnd2)
plotCircle(1)
xlabel('\alpha normalized')
ylabel('\kappa normalized')
title(['alphaRearLimit = ' num2str(alphaRearLimit) ' deg'])



end