close all; clear all; clc;

h6 = load('C:\Users\ddl\Documents\localTestData\2014 9 DataForJapan\mu8lk_HL_2014-09-17_aa.mat');
h5 = load('C:\Users\ddl\Documents\localTestData\2014 9 DataForJapan\mu8beta_HL_2014-09-17_aa.mat');
h4 = load('C:\Users\ddl\Documents\localTestData\2014 9 DataForJapan\mu7lk_HL_2014-09-17_aa.mat');
h3 = load('C:\Users\ddl\Documents\localTestData\2014 9 DataForJapan\mu7beta_HL_2014-09-17_aa.mat');
h2 = load('C:\Users\ddl\Documents\localTestData\2014 9 DataForJapan\mu5lk_HL_2014-09-17_aa.mat');
h1 = load('C:\Users\ddl\Documents\localTestData\2014 9 DataForJapan\mu5beta_HL_2014-09-17_aa.mat');

%%
h1Ind = [5200:3.8e4];
h2Ind = [4245:3.4e4];
h3Ind = [7900:3.75e4];
h4Ind = [3950:2.57e4];
h5Ind = [4407:2.731e4];
h6Ind = [4174:2.8e4];

e1 = h1.mapMatch.e(h1Ind);
e2 = h2.mapMatch.e(h2Ind);
e3 = h1.mapMatch.e(h3Ind);
e4 = h2.mapMatch.e(h4Ind);
e5 = h1.mapMatch.e(h5Ind);
e6 = h2.mapMatch.e(h6Ind);

centers = linspace(-.5, .5, 50);

subplot(3, 2, 1)
hist(e1, centers)
g = findobj(gca,'Type','patch');
set(g,'FaceColor','k','EdgeColor','k') 
set(gca,'YTickLabel',[])
ylabel('a_y = .5 g')
xlim([-.5 .5])

subplot(3, 2, 2)
hist(e2, centers)
g1 = findobj(gca,'Type','patch');
set(g1,'FaceColor','k','EdgeColor','k') 
xlim([-.5 .5])

set(gca,'YTickLabel',[])

subplot(3, 2, 3)
hist(e3, centers)
g = findobj(gca,'Type','patch');
set(g,'FaceColor','k','EdgeColor','k') 
set(gca,'YTickLabel',[])
ylabel('a_y = .7 g')
xlim([-.5 .5])

subplot(3, 2, 4)
hist(e4, centers)
g1 = findobj(gca,'Type','patch');
set(g1,'FaceColor','k','EdgeColor','k') 
xlim([-.5 .5])
set(gca,'YTickLabel',[])

subplot(3, 2, 5)
hist(e5, centers)
g = findobj(gca,'Type','patch');
set(g,'FaceColor','k','EdgeColor','k') 
set(gca,'YTickLabel',[])
ylabel('a_y = .8 g')
xlim([-.5 .5])
xlabel('With Sideslip FFW')

subplot(3, 2, 6)
hist(e6, centers)
g1 = findobj(gca,'Type','patch');
set(g1,'FaceColor','k','EdgeColor','k') 
xlim([-.5 .5])
set(gca,'YTickLabel',[])
xlabel('Baseline Controller')