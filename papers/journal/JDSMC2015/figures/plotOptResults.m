%Plot the deviations from the centerline
close all; clear all; clc
g  = load('C:\Users\ddl\Documents\localTestData\raceData\g5.mat');
b  = load('C:\Users\ddl\Documents\localTestData\raceData\base1.mat');
f  = load('C:\Users\ddl\Documents\localTestData\raceData\fg1.mat');
load('C:\Users\ddl\Documents\localTestData\raceData\boundsMatch.mat');
load('C:\Users\ddl\Documents\localTestData\FastMapGenerationData\splineDelta1MoreBuffer.mat')
green = [0 .6 0];
%%
close all;
figure;
hold on;
plot(f.s, f.e,'Color','b','LineWidth',2);
plot(b.s, b.e,'Color','r','LineWidth',2);
plot(g.s, g.e,'Color',green,'LineWidth',2);
grid on;
plot(sIn, eIn,'Color','k','LineWidth',2);
plot(sOut, eOut,'Color','k','LineWidth',2);
xlabel('Distance Along Track Centerline (m)','FontSize',14,'FontName','Arial')
ylabel('Lateral Deviation (m)','FontSize',14,'FontName','Arial')
legend('Fast Generation','Nonlinear Opt','Professional Driver','Track Boundaries')
set(gca,'FontSize',12)
xlim([0 4500])

%%

close all; clear all; clc;
load('C:\Users\ddl\Documents\localTestData\FastMapGenerationData\splineDelta1MoreBuffer.mat')

subplot(2,1,1)
hold on; grid on; axis equal; xlim([-450 400]); 
plot(D(5).world.roadN, -D(5).world.roadE,'b','LineWidth',2)
plot(qW.roadN, -qW.roadE,'r','LineWidth',2)
plot(gW.roadN, -gW.roadE,'Color',[0 .6 0],'LineWidth',2)
plot(bounds.in(:,2), -bounds.in(:,1),'k','LineWidth',2)
plot(bounds.out(:,2), -bounds.out(:,1),'k','LineWidth',2)
xlim([-180 -80]);
ylim([-375 -240]);
set(gca,'XTickLabel',[],'YTickLabel',[]);
legend('Fast Generation','Nonlinear Opt','Professional Driver');

 subplot(2,1,2)
 hold on; grid on; %axis equal; 
 xlim([275 410]); ylim([-180 -75]);
 plot(D(5).world.roadN, -D(5).world.roadE,'b','LineWidth',2)
 plot(qW.roadN, -qW.roadE,'r','LineWidth',2)
 plot(gW.roadN, -gW.roadE,'Color',[0 .6 0],'LineWidth',2)
 plot(bounds.in(:,2), -bounds.in(:,1),'k','LineWidth',2)
 plot(bounds.out(:,2), -bounds.out(:,1),'k','LineWidth',2)
 set(gca,'XTickLabel',[],'YTickLabel',[])
%%

close all; clear all; clc;
load('C:\Users\ddl\Documents\localTestData\FastMapGenerationData\splineDelta1MoreBuffer.mat')

subplot(2,1,1)
hold on; grid on; xlim([633 733]); ylim([-126 8.5]) 
plot(D(5).world.roadN, -D(5).world.roadE,'b','LineWidth',2)
plot(qW.roadN, -qW.roadE,'r','LineWidth',2)
plot(gW.roadN, -gW.roadE,'Color',[0 .6 0],'LineWidth',2)
plot(bounds.in(:,2), -bounds.in(:,1),'k','LineWidth',2)
plot(bounds.out(:,2), -bounds.out(:,1),'k','LineWidth',2)
set(gca,'XTickLabel',[],'YTickLabel',[]);
legend('Fast Generation','Nonlinear Opt','Professional Driver');

 subplot(2,1,2)
 hold on; grid on; %axis equal; 
 xlim([275 410]); ylim([-180 -75]);
 plot(D(5).world.roadN, -D(5).world.roadE,'b','LineWidth',2)
 plot(qW.roadN, -qW.roadE,'r','LineWidth',2)
 plot(gW.roadN, -gW.roadE,'Color',[0 .6 0],'LineWidth',2)
 plot(bounds.in(:,2), -bounds.in(:,1),'k','LineWidth',2)
 plot(bounds.out(:,2), -bounds.out(:,1),'k','LineWidth',2)
 set(gca,'XTickLabel',[],'YTickLabel',[])


 
 
 
%%
%refTime = trapz(vpRef.s, 1./vpRef.Ux);
figure;
hold on; grid on;
plot([0:5], lapTime,'bo','MarkerSize',12,'MarkerFaceColor','b')
plot([0 6], [lpQ lpQ],'r','LineWidth',2)
xlabel('Iteration Number','FontSize',14)
ylabel('Predicted Lap Time (s)','FontSize',14)
legend('Sequential Algorithm', 'Gradient Descent Solution (Theodosis)')


