%Nitin Kapania 
%This is code to plot the bode and root locus results for the AVEC
%conference paper.

%Get Data from the simulation.
clear all; close all; clc
addpath(genpath('C:\Users\ddl\Desktop\nkapania\simulation\FB_FFW'))

%get 3 bode plots for 3 different speeds
w = 10^-8; ay = 3; Ux = linspace(10,30,100); 
eSS = zeros(numel(Ux),1); dpSS = eSS; rSS = eSS; bSS = eSS; eLA = eSS;

for i = 1:numel(Ux);
    K = ay/Ux(i)^2;
    [E DP R B ELA] = getLKsys(Ux(i),'lk');
    eSS(i) =  (evalfr(E,w))*K;
    dpSS(i) = (evalfr(DP,w))*K;
    rSS(i)  = (evalfr(R,w))*K;
    bSS(i)  = (evalfr(B,w))*K;
    eLA(i)  = (evalfr(ELA,w))*K;
end

%also get results for nonlinear model
ay = 7; UxNL = linspace(10,30,20); 
sys = getNLsys();
for i = 1:numel(UxNL)
    i
    K = ay/UxNL(i)^2;
    out = NLsim(sys, UxNL(i), K, 'lk');
    eNL(i) =  out.e;
    dpNL(i) = out.dPsi;
    rNL(i) = out.r;
    bNL(i)  = out.beta;
end


%Initialize Figure
 %grid on; 
 %%
 
 f = figure('Visible','on','Position',[1,1,600,800],'Name','Linear Error','NumberTitle','off');
 a(1) = subplot(3,1,1); set(a(1),'Position',[0.117 0.742 0.867 0.244],'FontSize',12,'FontName','Arial','XLim',[Ux(1) Ux(end)],'XTickLabel',[]);
 grid on;  hold on; 
 h1 = plot(Ux,eSS,'k','LineWidth',4);
 plot(UxNL, eNL,'k--','LineWidth',4);
 ylabel('Path Deviation (m)','FontName','Arial','FontSize',14);
 %plot(Ux, eLA,'k--','LineWidth',4);
 legend('Linear Model, a_y = 3 m/s^2', 'Nonlinear Model, a_y = 7 m/s^2')
 
 a(2) = subplot(3,1,2); 
 ylabel('Sideslip (deg)','FontName','Arial','FontSize',14);
 set(a(2),'Position',[0.117 0.402 0.867 0.306],'FontSize',12,'FontName','Arial','XLim',[Ux(1) Ux(end)],'YTick',-5:1:5,'XTickLabel',[]);
 grid on; hold on;
 plot(Ux, bSS*180/pi,'k','LineWidth',4);
 plot(UxNL, bNL*180/pi,'k--','LineWidth',4);
 
 a(3) = subplot(3,1,3); 
 ylabel('Heading Deviation (deg)','FontName','Arial','FontSize',14);
 set(a(3),'Position',[0.117 0.062 0.867 0.310],'FontSize',12,'FontName','Arial','XLim',[Ux(1) Ux(end)],'YTick',-5:1:5);
 grid on; hold on;
 plot(Ux, dpSS*180/pi,'k','LineWidth',3);
 plot(UxNL, dpNL*180/pi,'k--','LineWidth',4);
 xlabel(['Steady State Velocity (m/s)'],'FontName','Arial','FontSize',14); 
 tightfig;