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
    [E DP R B ELA] = getLKsys(Ux(i),'beta');
    eSS(i) =  (evalfr(E,w))*K;
    dpSS(i) = (evalfr(DP,w))*K;
    rSS(i)  = (evalfr(R,w))*K;
    bSS(i)  = (evalfr(B,w))*K;
    eLA(i)  = (evalfr(ELA,w))*K;
end

%also get results for nonlinear model
ay = 7; UxNL = linspace(10,30,40); 
sys = getNLsys();
for i = 1:numel(UxNL);
    K = ay/UxNL(i)^2;
    out = NLsim(sys, UxNL(i), K, 'beta');
    eNL(i) =  out.e;
    dpNL(i) = out.dPsi;
    rNL(i) = out.r;
    bNL(i)  = out.beta;
end


%Initialize Figure
 %grid on; 
 %%

 f = figure('Visible','on','Position',[1,1,600,400],'Name','Linear Error','NumberTitle','off');
 a(1) = gca; set(a(1),'FontSize',12,'FontName','Arial','XLim',[Ux(1) Ux(end)]);
 grid on;  hold on; 
 h1 = plot(UxNL,eNL,'k','LineWidth',4);
 plot(UxNL, dpNL*180/pi,'k--','LineWidth',4);
 plot(UxNL, bNL*180/pi,'ko','MarkerSize',6,'MarkerFaceColor','k');
 ylabel(['Steady-State Results, a_y = 7 m/s^2'],'FontName','Arial','FontSize',14);
 xlabel('Steady-State Velocity (m/s)','FontName','Arial','FontSize',14);
 %plot(Ux, eLA,'k--','LineWidth',4);
 legend('e (m)','\Delta\Psi (deg)','\beta (deg)')
 tightfig()