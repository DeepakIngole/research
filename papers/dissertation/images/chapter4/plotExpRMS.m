clear all; close all; clc;
eRMS = zeros(3,4);
vRMS = zeros(3,4);

load('C:\Users\ddl\Documents\localTestData\2016 01 ILC\mu7_0_2016-01-26_aa.mat')
ind = find(mapMatch.s_m > 600 & mapMatch.s_m < 1570);

eRMS(1,1) = rms(mapMatch.e_m(ind));
indv = getIndV(mapMatch.s_m);
vRMS(1,1) = rms(HLlongitudinal.speedError_mps(indv));

load('C:\Users\ddl\Documents\localTestData\2016 01 ILC\mu7_1_2016-01-26_aa.mat')
ind = find(mapMatch.s_m > 600 & mapMatch.s_m < 1570);
eRMS(1,2) = rms(mapMatch.e_m(ind));
indv = getIndV(mapMatch.s_m);
vRMS(1,2) = rms(HLlongitudinal.speedError_mps(indv));

load('C:\Users\ddl\Documents\localTestData\2016 01 ILC\mu7_2_2016-01-26_aa.mat')
ind = find(mapMatch.s_m > 600 & mapMatch.s_m < 1570);
eRMS(1,3) = rms(mapMatch.e_m(ind));
indv = getIndV(mapMatch.s_m);
vRMS(1,3) = rms(HLlongitudinal.speedError_mps(indv));

load('C:\Users\ddl\Documents\localTestData\2016 01 ILC\mu7_3_2016-01-26_aa.mat')
ind = find(mapMatch.s_m > 600 & mapMatch.s_m < 1570);
eRMS(1,4) = rms(mapMatch.e_m(ind));
indv = getIndV(mapMatch.s_m);
vRMS(1,4) = rms(HLlongitudinal.speedError_mps(indv));

%%
load('C:\Users\ddl\Documents\localTestData\2016 01 ILC\mu85_0_2016-01-26_aa.mat')
ind = find(mapMatch.s_m > 600 & mapMatch.s_m < 1570);
indv = getIndV(mapMatch.s_m);

eRMS(2,1) = rms(mapMatch.e_m(ind));
vRMS(2,1) = rms(HLlongitudinal.speedError_mps(indv));

load('C:\Users\ddl\Documents\localTestData\2016 01 ILC\mu85_1_2016-01-26_aa.mat')
ind = find(mapMatch.s_m > 600 & mapMatch.s_m < 1570);
indv = getIndV(mapMatch.s_m);

eRMS(2,2) = rms(mapMatch.e_m(ind));
vRMS(2,2) = rms(HLlongitudinal.speedError_mps(indv));

load('C:\Users\ddl\Documents\localTestData\2016 01 ILC\mu85_2_2016-01-26_aa.mat')
ind = find(mapMatch.s_m > 600 & mapMatch.s_m < 1570);
indv = getIndV(mapMatch.s_m);

eRMS(2,3) = rms(mapMatch.e_m(ind));
vRMS(2,3) = rms(HLlongitudinal.speedError_mps(indv));

load('C:\Users\ddl\Documents\localTestData\2016 01 ILC\mu85_3_2016-01-26_aa.mat')
ind = find(mapMatch.s_m > 600 & mapMatch.s_m < 1570);
indv = getIndV(mapMatch.s_m);

eRMS(2,4) = rms(mapMatch.e_m(ind));
vRMS(2,4) = rms(HLlongitudinal.speedError_mps(indv));

%%
load('C:\Users\ddl\Documents\localTestData\2016 01 ILC\mu9_0_2016-01-26_aa.mat')
ind = find(mapMatch.s_m > 600 & mapMatch.s_m < 1570);
indv = getIndV(mapMatch.s_m);

eRMS(3,1) = rms(mapMatch.e_m(ind));
vRMS(3,1) = rms(HLlongitudinal.speedError_mps(indv));

load('C:\Users\ddl\Documents\localTestData\2016 01 ILC\mu9_1_2016-01-26_aa.mat')
ind = find(mapMatch.s_m > 600 & mapMatch.s_m < 1570);
indv = getIndV(mapMatch.s_m);

eRMS(3,2) = rms(mapMatch.e_m(ind));
vRMS(3,2) = rms(HLlongitudinal.speedError_mps(indv));

load('C:\Users\ddl\Documents\localTestData\2016 01 ILC\mu9_2_2016-01-26_aa.mat')
ind = find(mapMatch.s_m > 600 & mapMatch.s_m < 1570);
indv = getIndV(mapMatch.s_m);

eRMS(3,3) = rms(mapMatch.e_m(ind));
vRMS(3,3) = rms(HLlongitudinal.speedError_mps(indv));

load('C:\Users\ddl\Documents\localTestData\2016 01 ILC\mu9_3_2016-01-26_aa.mat')
ind = find(mapMatch.s_m > 600 & mapMatch.s_m < 1570);
indv = getIndV(mapMatch.s_m);

eRMS(3,4) = rms(mapMatch.e_m(ind));
vRMS(3,4) = rms(HLlongitudinal.speedError_mps(indv));


%%

subplot(2, 1, 1)
plot([0:3], eRMS(1,:),'ko','MarkerFaceColor','k')
hold on; grid on; 
plot([0:3], eRMS(2,:),'ro','MarkerFaceColor','r')
plot([0:3], eRMS(3,:),'go','MarkerFaceColor','g')
xlabel('Lap Number)','FontSize',14);
ylabel('RMS Tracking Error e (m)' ,'FontSize',14);
legend('|a| = 7 m/s^2','|a| = 8.5 m/s^2','|a| = 9.0 m/s^2')
ylim([0 .25])

%%

subplot(2, 1, 2)
plot([0:3], vRMS(1,:),'ko','MarkerFaceColor','k')
hold on; grid on; 
plot([0:3], vRMS(2,:),'ro','MarkerFaceColor','r')
plot([0:3], vRMS(3,:),'go','MarkerFaceColor','g')
xlabel('Lap Number (m)','FontSize',14);
ylabel('RMS Speed Error v (m/s)' ,'FontSize',14);
legend('|a| = 7 m/s^2','|a| = 8.5 m/s^2','|a| = 9.0 m/s^2')
