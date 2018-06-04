clear all close all; clc;
addpath('C:\Users\ddl\Documents\localTestData\searchData');

figure;
hold on; 
grid on;

s = [0 1300; 0 4500; 0 4500; 2300 4200; 3300 4000; 2300 3300; 2300 3300; 2300 3300; 2300 3300 ; 2300 3300; 530 1165;0 1270; 390 770; 0 1270 ];
mu =[.9 .9; .92 .92; .94 .94; .9 .9;    .85   .85;    .97 .97;  .95  .95; .93 .93;     .92  .92;  .85   .85; .85 .85;.93 .93; .97 .97; .95 .95];


for i = 1:14

    
    plot(s(i,:), mu(i,:), 'k','LineWidth',3)
end

xlabel('Distance Along Path (m)','FontSize',14);
ylabel('\mu','FontSize',18)