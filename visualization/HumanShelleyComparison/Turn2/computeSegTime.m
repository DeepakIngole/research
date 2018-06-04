load data
UxMax = [sh.Ux(1:450); sh.UxDesired(451:2312); sh.Ux(2313:end)];
figure;
plot(sh.t, cumtrapz(sh.t,sh.Ux));
hold on
plot(dv.t, cumtrapz(dv.t,dv.Ux),'r');
load UxMu1.mat
plot(t, cumtrapz(t,UxLim),'g');
hold on
load UxMu92.mat
plot(t, cumtrapz(t,UxLim),'c');