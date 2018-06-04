clear; close all; clc;
load fullauto_HL_2012-06-28_ab.mat
ind = [];
for i = 0:3   
    ind = [ind; find(mapMatch.segNumber == i)];
end
ind(ind>40000) = [];
sh.t = t(ind);
sh.t = sh.t - sh.t(1);
sh.UxDesired = HLlongitudinal.UxDesired(ind);
sh.Ux = ApplanixData.vxCG(ind);

clearvars -except sh
load d_HL_2012-06-28_ae.mat
ind = [];
for i = 0:3   
    ind = [ind; find(mapMatch.segNumber == i)];
end
dv.t = t(ind);
dv.t = dv.t - dv.t(1);
dv.Ux = ApplanixData.vxCG(ind);


save('data','sh','dv')
clear; 
disp('Data File Made')


