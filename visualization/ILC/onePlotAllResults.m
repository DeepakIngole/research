clear all; close all; clc;
load data
figure;
set(gca,'FontSize',12,'FontName','Arial')
xlim([0 4])

plot(e3PD,'ko','MarkerFaceColor','k'); hold on; grid on;
plot(e6PD,'bo','MarkerFaceColor','b');
plot(e8PD,'co','MarkerFaceColor','g');
plot(e3Q,'k^','MarkerFaceColor','k'); 
plot(e6Q,'b^','MarkerFaceColor','b');
plot(e8Q,'c^','MarkerFaceColor','g');

xlabel('Lap Number','FontSize',14,'FontName','Arial');
ylabel('RMS Path Tracking Error (m)','FontSize',14,'FontName','Arial');

legend('PD, a_y = .3 g','PD, a_y = .6 g','PD, a_y = .8 g','Opt. ILC, a_y = .3 g','Opt. ILC, a_y = .6 g','Opt. ILC, a_y = .8 g')