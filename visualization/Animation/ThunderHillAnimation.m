clear all; close all; clc;

s = load('C:\Users\ddl\Documents\localTestData\2015 09 30 Lap Time and MILC\fullautomu9FG_2015-09-30_aa.mat');
load('C:\Mapping\Road Edges\thunderhill_bounds_shifted')
h = load('C:\Users\ddl\Documents\localTestData\2015 09 30 Lap Time and MILC\fullautomu9quill_2015-09-30_aa.mat');
%h = load('C:\Users\ddl\Documents\localTestData\2014 10 NewLapTimeAndProData\_gunnarJeanetteDriving\gunnar_HL_2014-10-06_ad');
%h = load('C:\Users\ddl\Documents\localTestData\2014 10 NewLapTimeAndProData\_davidVoddenDriving\david2_HL_2014-10-07_aa') 
%%

addpath(genpath('C:\Users\ddl\Desktop\nkapania\simulation\common'));
load THcenter.mat;

sInd = find(s.t > 243.9 & s.t < 382.6);
shelleyE = s.OxTSData.posE_m(sInd);
shelleyN = s.OxTSData.posN_m(sInd);
shelleyV = s.OxTSData.vxCG_mps(sInd);
shelleyS = zeros(1,len(sInd));

for i = 1:len(sInd)
    [~,~,~,shelleyS(i)] = mapMatch(shelleyE(i), shelleyN(i), 0, refWorld);
end

hInd = find(h.t > 199.3 & h.t < 338.6);
humanE = h.OxTSData.posE_m(hInd);
humanN = h.OxTSData.posN_m(hInd);
humanV = h.OxTSData.vxCG_mps(hInd);
humanS = zeros(1, len(hInd));

for i = 1:len(hInd)
    [~,~,~,humanS(i)] = mapMatch(humanE(i), humanN(i), 0, refWorld);
end

N = min(len(humanE), len(shelleyE));

%%
offset = 50;
n = 10;

figure
F = [];
%set(gca,'NextPlot','replaceChildren');
for i = 1:n:N        
        
    timeBehind = (humanS(i) - shelleyS(i))/shelleyV(i);
    plot(humanE(1:i), humanN(1:i),'bo','MarkerSize',3,'MarkerFaceColor','b')
    grid on;
    axis equal
    set(gca,'XTickLabel',[])
    set(gca,'YTickLabel',[])
    xlim( [ shelleyE(i)-offset shelleyE(i)+offset ])
    ylim( [ shelleyN(i)-offset shelleyN(i)+offset ])
    
    if abs(timeBehind) < .1
        timeString = num2str(abs(timeBehind), 1);
    elseif abs(timeBehind > 3)
        timeString = '--';
    else
        timeString = num2str(abs(timeBehind), 2);
    end
        
    
    if timeBehind < 0
        title(['Fast Generation Leads: ' timeString ' s'],'FontName','Arial','FontSize',12)
    else
        title(['Clothoid Trajectory Leads: ' timeString ' s'],'FontName','Arial','FontSize',12)
    end
    %xlabel(['Mu Value = ' num2str(humanMu(i)) ])
        
    hold on
    plot(shelleyE(1:i),shelleyN(1:i),'o','MarkerSize',3,'MarkerEdgeColor',[189 32 49]/255, 'MarkerFaceColor',[189 32 49]/255)
    plot(road_bounds_in(:,1),road_bounds_in(:,2),'k','LineWidth',2)
    plot(road_bounds_out(:,1),road_bounds_out(:,2),'k','LineWidth',2)
    hold off

    F = [F getframe(gcf)];
end

%%
movie2avi(F, 'shellVshell','fps',40)
