%Nitin Kapania 
%This is code to plot the bode and root locus results for the AVEC
%conference paper.

%Get Data from the simulation.
clear all; close all; clc
addpath('C:\Users\ddl\Desktop\nkapania\simulation\FB_FFW')

%get 3 bode plots for 3 different speeds
w = 10^-8; ay = 7; Ux = linspace(10,30,100); 
eSS = zeros(numel(Ux),1); dpSS = eSS; rSS = eSS; bSS = eSS; eLA = eSS;

for i = 1:numel(Ux);
    K = ay/Ux(i)^2;
    [E DP R B ELA] = linearLKanalysis(Ux(i),'beta');
    eSS(i) =  (evalfr(E,w))*K;
    dpSS(i) = (evalfr(DP,w))*K;
    rSS(i)  = (evalfr(R,w))*K;
    bSS(i)  = (evalfr(B,w))*K;
    eLA(i)  = (evalfr(ELA,w))*K;
end

%Initialize Figure
 %grid on; 
 
 f = figure('Visible','on','Position',[1,1,600,800],'Name','Linear Error','NumberTitle','off');
 a(1) = subplot(2,1,1); set(a(1),'FontSize',12,'FontName','Arial','XLim',[Ux(1) Ux(end)],'XTickLabel',[]);
 grid on;  hold on; 
 h1 = plot(Ux,eSS,'k','LineWidth',4);
 plot(Ux, eLA,'k--','LineWidth',4);
 legend('e (m)', 'e_{LA} (m)')
 
 a(2) = subplot(2,1,2); 
 set(a(2),'FontSize',12,'FontName','Arial','XLim',[Ux(1) Ux(end)],'YTick',-5:1:5,'Position',[.13 .225 .78 .34]);
 grid on; hold on;
 plot(Ux, dpSS*180/pi,'k','LineWidth',4);
 plot(Ux, bSS*180/pi,'k--','LineWidth',4);
 xlabel('Steady State Velocity (m/s)','FontName','Arial','FontSize',14);
 legend('\Delta\Psi (deg)','\beta (deg)')
 tightfig;
 
 
 %run this code if you want to show results on just one plot.
 close all;
 
 f = figure('Visible','on','Position',[1,1,600,800],'Name','Linear Error','NumberTitle','off');
 
 a(2) = subplot(2,1,2); 
 set(a(2),'FontSize',12,'FontName','Arial','XLim',[Ux(1) Ux(end)],'YTick',-5:1:5,'Position',[.13 .225 .78 .34]);
 grid on; hold on;
 plot(Ux, eSS, 'k.','LineWidth',4);
 plot(Ux, dpSS*180/pi,'k','LineWidth',4);
 plot(Ux, bSS*180/pi,'k--','LineWidth',4);
 xlabel('Steady State Velocity (m/s)','FontName','Arial','FontSize',14);
 legend('e (m)','\Delta\Psi (deg)','\beta (deg)')
 tightfig;