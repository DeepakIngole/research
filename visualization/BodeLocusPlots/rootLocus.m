%Nitin Kapania 
%This is code to plot the root locus results for the AVEC
%conference paper.

%Get Data from the simulation.
clear all; close all; clc
addpath('C:\Users\ddl\Desktop\nkapania\simulation\FB_FFW')

N = 100;
ay = 7; Ux = linspace(5,25,N);
P1 = [];P2 = [];P3 = [];

for i = 1:N
    p = LKpoles('lk', Ux(i));
    for j = 1:numel(p)
        if abs(imag(p(j))) < 1e-3
            P1= [P1; p(j)];
        elseif abs(p(j)) < 5
            P2 = [P2; p(j)];
        else
            P3 = [P3; p(j)];
        end
    end
end

[B IX] = sort(imag(P2));
[B IX2]= sort(imag(P3));
 


 plot(real(P1), imag(P1),'k','LineWidth',2);
 hold on;
 plot(real(P2(IX)), imag(P2(IX)),'k','LineWidth',2);
 h1 = plot(real(P3(IX2)), imag(P3(IX2)),'k','LineWidth',2,'DisplayName','Lookahead FB');
 
 
 
 N = 1000;
ay = 7; Ux = linspace(10,40,N);
P1 = [];P2 = []

for i = 1:N
    p = LKpoles('beta', Ux(i));
    for j = 1:numel(p)
        if abs(imag(p(j))) < 1e-3
            P1= [P1; p(j)];
        else
            P2 = [P2; p(j)];
        end
    end
end
 
[B IX2] = sort(imag(P2));
 
 plot(real(P1), imag(P1),'k--','LineWidth',2);
 hold on;
 h2 = plot(real(P2(IX2)), imag(P2(IX2)),'k--','LineWidth',2,'DisplayName','Lookahead + \beta');
 xlabel('Real','FontName','Arial','FontSize',12)
 ylabel('Imag','FontName','Arial','FontSize', 12)
 legend([h1 h2]);

axis equal;
set(gca,'FontSize',12,'FontName','Arial','XLim',[-6 0],'YLim',[-6 6]); grid on; hold on;
tightfig;

 