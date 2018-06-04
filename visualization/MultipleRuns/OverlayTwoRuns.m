%This Script Plots two Experimental Data runs over each other. Will
%eventually merge with folder "tracking" to make one slick plotting script.

%Nitin

%Load the Data
close all; clear all; clc;
pname = 'C:\Users\ddl\Documents\localTestData\2014 2 BetaFFW Addition and Iterative Learning\Steering Controller Research\Lanekeeping Feedback';
fnamez = 'sideslipmu7_HL_2014-02-10_aa';
fnamey = 'lkmu7_HL_2014-02-10_aa';
fnamex = 'betaffwmu7_HL_2014-02-10_aa';
x = load([pname '\' fnamex]);
y = load([pname '\' fnamey]);
z = load([pname '\' fnamez]);

%synchronize the time signals and make the times start at 0
yShift = 2.425; zShift = 21.455; %right now, get this manually by plotting the signals
y.t = y.t - yShift; z.t = z.t-zShift;

tS = 19; tF = 59; x.t = x.t - tS; y.t = y.t-tS;

%Initialize the Figures

f = figure('Visible','on','Position',[1,1,600,800],'Name','AVEC Figure','NumberTitle','off');
a(1) = subplot(4,1,1);

%plot the error data
set(a(1),'FontSize',12,'FontName','Arial','XLim',[0 tF-tS],'YLim',[-.7 .2],'XTickLabel',[],'Position',[.13 .735 .852 .25]); 
grid on; hold on; ylabel('Error','FontSize',14,'FontName','Arial');
h(1) = plot(x.t, x.mapMatch.e,'k','LineWidth',2); 
       plot(y.t, y.mapMatch.e,'k--','LineWidth',2); 
       %plot(z.t, z.mapMatch.e,'b','LineWidth',2);
       
      
%plot the steering data
a(2) = subplot(4,1,2);
set(a(2),'FontSize',12,'FontName','Arial','XLim',[0 tF-tS],'YLim',[-1 1],'XTickLabel',[]); %,'Position',[.13 .458 .852 .25]);
grid on; hold on; ylabel('\delta_{FB} (deg)','FontSize',14,'FontName','Arial');

h(2) = plot(x.t, x.HLsteering.deltaFB*180/pi, 'k','LineWidth',2);
       plot(y.t, y.HLsteering.deltaFB*180/pi,'k--','LineWidth',2);
       %plot(z.t, z.HLsteering.deltaFB*180/pi,'b','LineWidth',2);
       
       
a(3) = subplot(4,1,3);
set(a(3),'FontSize',12,'FontName','Arial','XLim',[0 tF-tS],'YLim',[-3 3.5],'XTickLabel',[]); %,'Position',[.13 .262 .852 .178]); 
ylabel('\delta_{FFW} (deg)','FontSize',14,'FontName','Arial'); grid on; hold on;

h(3) = plot(x.t, x.HLsteering.deltaFFW*180/pi, 'k','LineWidth',2);
       plot(y.t, y.HLsteering.deltaFFW*180/pi,'k--','LineWidth',2);
       %plot(z.t, z.HLsteering.deltaFFW*180/pi,'b.','LineWidth',2);
      
%plot the longitudinal data
a(4) = subplot(4,1,4);
set(a(4),'FontSize',12,'FontName','Arial','XLim',[0 tF-tS],'YLim',[20 42],'Position',[.13 .065 .852 .178]); 
grid on; hold on; ylabel('U_x (m/s)','FontSize',14,'FontName','Arial'); xlabel('time (sec)','FontSize',14,'FontName','Arial');

h(4) = plot(x.t, x.ApplanixData.vxCG, 'k','LineWidth',2);
       plot(y.t, y.ApplanixData.vxCG, 'k--','LineWidth',2);
       legend('With \beta_{FFW}','Lookahead FB')
       %plot(z.t, z.ApplanixData.vxCG, 'b','LineWidth',2);
tightfig(f);
       