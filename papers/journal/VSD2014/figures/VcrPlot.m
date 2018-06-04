%Nitin Kapania 
%This is code to plot the linear stability of various FB controllers,
%originally designed for AVEC conference paper.

%Get Data from the simulation.

function stability 

clear all; close all; clc; addpath('C:\Users\ddl\Desktop\nkapania\simulation\FB_FFW')

[xLA UxC] = getStability(1.5,1,'lk');
disp('1')
h1 = plot(xLA, UxC,'k','LineWidth',2); grid on; hold on;

[xLA UxC] = getStability(1,1.5,'lk');
disp('2')
plot(xLA, UxC,'k','LineWidth',2); grid on; hold on;

[xLA UxC] = getStability(1.25,1.25,'lk');
disp('3')
plot(xLA, UxC,'k','LineWidth',2); grid on; hold on;

[xLA UxC] = getStability(1.5,1,'beta');
disp('4')
h2 = plot(xLA, UxC,'k--','LineWidth',2); grid on; hold on;

[xLA UxC] = getStability(1,1.5,'beta');
disp('5')
plot(xLA, UxC,'k--','LineWidth',2); grid on; hold on;

[xLA UxC] = getStability(1.25,1.25,'beta');
plot(xLA, UxC,'k--','LineWidth',2); grid on; hold on;


set(gca,'FontSize',12,'FontName','Arial','XLim',[0 25],'YLim',[20 100]); 
xlabel('Lookahead Distance x_{LA} (m)','FontSize',14,'FontName','Arial');
ylabel('V_{cr} (m/s)','FontSize',14,'FontName','Arial');
legend([h1 h2], {'Lanekeeping FB','Lookahead + \beta FB'})
tightfig


end


function [xLA UxC] = getStability(a,b,mode)

N = 500;
M = 500;
Ux = linspace(10, 100, M);
xLA = linspace(0, 50, N);

UxC = Inf*ones(N,1);
Cf = 160000; Cr = 160000; kLK = .0532;


for i = 1:N
    for j = 1:M
        
    [p Kug] = LKpoles(mode, Ux(j), a, b, Cf, Cr, kLK, xLA(i));
    
    if max(real(p)) > 1
        UxC(i) = Ux(j);
        break
    end
    
    end
    
end

end

    