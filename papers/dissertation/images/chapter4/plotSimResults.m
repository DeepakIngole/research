clear all; close all; clc;
load sim50.mat

subplot(2, 1, 1)
grid on; hold on;
plot(path.s, path.K,'k','LineWidth',2)
xlim([0 675])
ylim([-.022 .031])
ylabel('Curvature (1/m)')
subplot(2, 1, 2)
grid on; hold on;
plot(vp.s, vp.Ux,'k','LineWidth',2)
load sim70.mat
plot(vp.s, vp.Ux,'k--','LineWidth',2)
load sim85.mat
plot(vp.s, vp.Ux,'r-','LineWidth',2)
load sim95.mat
plot(vp.s, vp.Ux,'g','LineWidth',2)
legend('|a| = 5 m/s^2','|a| = 7 m/s^2','|a| = 8.5 m/s^2','|a| = 9.5 m/s^2')
xlim([0 675])
ylabel('Desired Velocity')
xlabel('Distance Along Path (m)')

%%

close all; clear all; clc;

load sim50.mat
subplot(2, 2, 1);
for i = 1:N
    pde(i) = SIM_PD(i).eRMS;
    qse(i) = SIM_QS(i).eRMS;
    qsm(i) = SIM_QM(i).eRMS;
end

semilogy(0:4, pde,'ko-','MarkerFaceColor','k','LineWidth',2);
hold on; grid on;
semilogy(0:4, qsm,'bs-','MarkerSize',8,'LineWidth',2);
semilogy(0:4, qse,'r*-','MarkerFaceColor','r','LineWidth',2);
legend('PD', 'Q-MIMO','Q-SISO');

%xlabel('Iteration Number','FontName','Arial','FontSize',14)
ylabel('e_{RMS}(m)','FontName','Arial','FontSize',14)
title('|a| = 5 m/s^2','FontName','Arial','FontSize',14)

load sim70.mat
subplot(2, 2, 2);
for i = 1:N
    pde(i) = SIM_PD(i).eRMS;
    qse(i) = SIM_QS(i).eRMS;
    qsm(i) = SIM_QM(i).eRMS;
end

semilogy(0:4, pde,'ko-','MarkerFaceColor','k','LineWidth',2);
hold on; grid on;
semilogy(0:4, qsm,'bs-','MarkerSize',8,'LineWidth',2);
semilogy(0:4, qse,'r*-','MarkerFaceColor','r','LineWidth',2);
legend('PD', 'Q-MIMO','Q-SISO');


%xlabel('Iteration Number','FontName','Arial','FontSize',14)
%ylabel('e_{RMS}(m)','FontName','Arial','FontSize',14)
title('|a| = 7 m/s^2','FontName','Arial','FontSize',14)

load sim85.mat
subplot(2,2,3);
for i = 1:N
    pde(i) = SIM_PD(i).eRMS;
    qse(i) = SIM_QS(i).eRMS;
    qsm(i) = SIM_QM(i).eRMS;
end

semilogy(0:4, pde,'ko-','MarkerFaceColor','k','LineWidth',2);
hold on; grid on;
semilogy(0:4, qsm,'bs-','MarkerSize',8,'LineWidth',2);
semilogy(0:4, qse,'r*-','MarkerFaceColor','r','LineWidth',2);
legend('PD', 'Q-MIMO','Q-SISO');


xlabel('Iteration Number','FontName','Arial','FontSize',14)
ylabel('e_{RMS}(m)','FontName','Arial','FontSize',14)
title('|a| = 8.5 m/s^2','FontName','Arial','FontSize',14)


load sim95.mat
subplot(2,2,4);
for i = 1:N
    pde(i) = SIM_PD(i).eRMS;
    qse(i) = SIM_QS(i).eRMS;
    qsm(i) = SIM_QM(i).eRMS;
end

semilogy(0:4, pde,'ko-','MarkerFaceColor','k','LineWidth',2);
hold on; grid on;
semilogy(0:4, qsm,'bs-','MarkerSize',8,'LineWidth',2);
semilogy(0:4, qse,'r*-','MarkerFaceColor','r','LineWidth',2);
legend('PD', 'Q-MIMO','Q-SISO');


xlabel('Iteration Number','FontName','Arial','FontSize',14)
%ylabel('e_{RMS}(m)','FontName','Arial','FontSize',14)
title('|a| = 9.5 m/s^2','FontName','Arial','FontSize',14)

%%

 clear all; clc;

load sim50.mat
subplot(2, 2, 1);
for i = 1:N
    pdv(i) = SIM_PD(i).vRMS;
    qsv(i) = SIM_QS(i).vRMS;
    qsv(i) = SIM_QM(i).vRMS;
end

semilogy(0:4, pdv,'ko-','MarkerFaceColor','k','LineWidth',2);
hold on; grid on;
semilogy(0:4, qsv,'bs-','MarkerSize',8,'LineWidth',2);
semilogy(0:4, qsv,'r*-','MarkerFaceColor','r','LineWidth',2);
legend('PD', 'Q-MIMO','Q-SISO');

%xlabel('Iteration Number','FontName','Arial','FontSize',14)
ylabel('v_{RMS}(m/s)','FontName','Arial','FontSize',14)
title('|a| = 5 m/s^2','FontName','Arial','FontSize',14)

load sim70.mat
subplot(2, 2, 2)
for i = 1:N
    pdv(i) = SIM_PD(i).vRMS;
    qsv(i) = SIM_QS(i).vRMS;
    qsv(i) = SIM_QM(i).vRMS;
end

semilogy(0:4, pdv,'ko-','MarkerFaceColor','k','LineWidth',2);
hold on; grid on;
semilogy(0:4, qsv,'bs-','MarkerSize',8,'LineWidth',2);
semilogy(0:4, qsv,'r*-','MarkerFaceColor','r','LineWidth',2);
legend('PD', 'Q-MIMO','Q-SISO');


%xlabel('Iteration Number','FontName','Arial','FontSize',14)
%ylabel('e_{RMS}(m)','FontName','Arial','FontSize',14)
title('|a| = 7 m/s^2','FontName','Arial','FontSize',14)

load sim85.mat
subplot(2, 2, 3)
for i = 1:N
    pdv(i) = SIM_PD(i).vRMS;
    qsv(i) = SIM_QS(i).vRMS;
    qsv(i) = SIM_QM(i).vRMS;
end

semilogy(0:4, pdv,'ko-','MarkerFaceColor','k','LineWidth',2);
hold on; grid on;
semilogy(0:4, qsv,'bs-','MarkerSize',8,'LineWidth',2);
semilogy(0:4, qsv,'r*-','MarkerFaceColor','r','LineWidth',2);
legend('PD', 'Q-MIMO','Q-SISO');

xlabel('Iteration Number','FontName','Arial','FontSize',14)
ylabel('v_{RMS}(m/s)','FontName','Arial','FontSize',14)
title('|a| = 8.5 m/s^2','FontName','Arial','FontSize',14)


load sim95.mat
subplot(2,2,4);
for i = 1:N
    pdv(i) = SIM_PD(i).vRMS;
    qsv(i) = SIM_QS(i).vRMS;
    qsv(i) = SIM_QM(i).vRMS;
end

semilogy(0:4, pdv,'ko-','MarkerFaceColor','k','LineWidth',2);
hold on; grid on;
semilogy(0:4, qsv,'bs-','MarkerSize',8,'LineWidth',2);
semilogy(0:4, qsv,'r*-','MarkerFaceColor','r','LineWidth',2);
legend('PD', 'Q-MIMO','Q-SISO');

xlabel('Iteration Number','FontName','Arial','FontSize',14)
%ylabel('e_{RMS}(m)','FontName','Arial','FontSize',14)
title('|a| = 9.5 m/s^2','FontName','Arial','FontSize',14)



%%
close all
subplot(2, 1, 1)
c = ['r' 'g' 'b' 'c' 'k'];
for i = 1:N
    plot(SIM_QM(i).s, SIM_QM(i).FxILC,c(i),'LineWidth',2);
    hold on; grid on;
end
ylabel('F^{ILC}_x(N)','FontSize',14); xlim([0 675]);
legend('Lap 0', 'Lap 1', 'Lap 2', 'Lap 3', 'Lap 4')

subplot(2, 1, 2)
for i = 1:N
    plot(SIM_QM(i).s, SIM_QM(i).v,c(i),'LineWidth',2);
    hold on; grid on; 
end
ylabel('v (m/s)','FontSize',14); xlim([0 675]);
xlabel('s (m)','FontSize',14)

%%
close all
subplot(2, 1, 1)
c = ['r' 'g' 'b' 'c' 'k'];
for i = 1:N
    plot(SIM_QM(i).s, SIM_QM(i).deltaILC*180/pi,c(i),'LineWidth',2);
    hold on; grid on;
end
ylabel('\delta^{ILC} (deg)','FontSize',14); xlim([0 675]);
legend('Lap 0', 'Lap 1', 'Lap 2', 'Lap 3', 'Lap 4')

subplot(2, 1, 2)
for i = 1:N
    plot(SIM_QM(i).s, SIM_QM(i).e,c(i),'LineWidth',2);
    hold on; grid on; 
end
ylabel('e (m/s)','FontSize',14); xlim([0 675]);
xlabel('s (m)','FontSize',14)