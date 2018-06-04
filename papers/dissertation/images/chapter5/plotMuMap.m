close all; clear all; clc;
%load C:\Mapping\Maps\Thunderhill\fastGenMap.mat; path = mapWorld; path.isOpen = 0;
%addpath(genpath('common'))
%path = genWorldFromCSV('thunderhill_race.csv');
load('C:\Mapping\Maps\Thunderhill\thunderhill_race.mat'); path = mapWorld; path.isOpen = 0;
bounds = load('C:\Mapping\Road Edges\thunderhill_bounds_shifted.mat');

s = path.s; E = path.roadE; N = path.roadN;

ind1 = find(s < 110);
ind2 = find(s > 110  & s  <   385);
ind3 = find(s > 385  & s  <   775);
ind4 = find(s > 775  & s  <   910);
ind5 = find(s > 910  & s  <  1045);
ind6 = find(s > 1045 & s  <  2610);
ind7 = find(s > 2610 & s  <  3125);
ind8 = find(s > 3125 & s  <  3745);
ind9 = find( s > 3745);

grey = [.4 .4 .4];

plot(E(ind1), N(ind1),'k','LineWidth',2);
hold on; axis equal;
plot(E(ind2), N(ind2),'r','LineWidth',2);
plot(E(ind3), N(ind3),'c','LineWidth',2);
plot(E(ind4), N(ind4),'Color',grey,'LineWidth',2);
plot(E(ind5), N(ind5),'g','LineWidth',2);
plot(E(ind6), N(ind6),'k','LineWidth',2);
plot(E(ind7), N(ind7),'c','LineWidth',2);
plot(E(ind8), N(ind8),'b','LineWidth',2);
plot(E(ind9), N(ind9),'k','LineWidth',2);
