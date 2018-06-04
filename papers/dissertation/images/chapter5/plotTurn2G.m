close all; clear all; clc;

addpath('C:\Users\ddl\Documents\localTestData\searchData')
load p1 %mu = .9
U(:,1) = Ux;
M(:,1) = currMu;
ind1 = (FxFB ~= 0);
load p24 %mu = .93; 
U(:,2) = Ux;
M(:,2) = .93;
ind2 = (FxFB ~= 0);
load p25 %mu = .95; 
U(:,3) = Ux;
M(:,3) = currMu;
ind3 = (FxFB ~= 0);

[C, I] = max(U');

s = s + 700;

x0 = [840 1236];
subplot(2, 1, 1)
grid on; hold on;

plot(s, U(:,1),'k','LineWidth',2)
plot(s, U(:,2),'b','LineWidth',2)
plot(s, U(:,3),'r','LineWidth',2)
legend('\mu = .9','\mu = .93','\mu = .95');

plot(s(ind1), U(ind1,1),'k*')
plot(s(ind2), U(ind2,2),'b*')
plot(s(ind3), U(ind3,3),'r*')

xlim(x0)
ylabel('Actual Speed (m/s)','FontSize',14)

for i = 1:len(s)
    muGreedy(i) = M(i,I(i));
end

subplot(2, 1, 2)
plot(s, muGreedy,'k','LineWidth',2)
grid on; hold on;
xlim(x0)

xlabel('Distance Along Path (m)','FontSize',14)
ylabel('\mu_{greedy}','FontSize',14)