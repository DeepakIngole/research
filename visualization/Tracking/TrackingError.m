%Nitin Kapania
%This script will plot lanekeeping results for Thunder Hill
%For the AVEC Conference Paper

%clear workspace
close all; clear all; clc;

%load data sets
pname = 'C:\Users\ddl\Documents\localTestData\2014 2 BetaFFW Addition and Iterative Learning\Steering Controller Research\Lanekeeping Feedback';
fname = 'lkmu8_HL_2014-02-10_aa';    load([pname '\' fname]);

tS = 28; tF = 45; t = t - tS;

%initialize figure
f = figure('Visible','on','Position',[1,1,600,800],'Name','Error Plot','NumberTitle','off');
a(1) = subplot(3,1,1);
set(a(1),'FontSize',12,'FontName','Arial','XLim',[0 tF-tS],'YLim',[-.6 .6],'XTickLabel',[])%'Position',[.13 .70 .78 .27]); 
grid on; hold on; ylabel('Error','FontSize',14,'FontName','Arial');

%plot data
h(1) = plot(t, mapMatch.e,'k','LineWidth',2);
%hold on; plot(t, mapMatch.deltaPsi*180/pi,'k--','LineWidth',2);
hold on; plot(t, calc.e_la,'k--','LineWidth',2);
legend('e (m)','e_{LA} (m)');

a(2) = subplot(3,1,2);
set(a(2),'FontSize',12,'FontName','Arial','XLim',[0 tF-tS],'YLim',[-1 4],'XTickLabel',[]) grid on; hold on; %'Position',[.13 .41 .78 .27]); 
h(1) = plot(t, HLsteering.deltaFB*180/pi,'k','LineWidth',2);
hold on; plot(t, HLsteering.deltaFFW*180/pi,'k--','LineWidth',2);
legend('\delta_{FB} (deg)','\delta_{FFW} (deg)','e_{LA} (m)');
ylabel('\delta (deg)','FontSize',14,'FontName','Arial');

a(3) = subplot(3,1,3);
set(a(3),'FontSize',12,'FontName','Arial','XLim',[0 tF-tS],'YLim',[26 42],...
    'Position',[.13 .11 .775 .279]); grid on; hold on;
h(1) = plot(t, ApplanixData.vxCG,'k','LineWidth',2);
ylabel('U_x (m/s)','FontSize',14,'FontName','Arial');
xlabel('Time (sec)','FontSize',14,'FontName','Arial');

tightfig(f);






