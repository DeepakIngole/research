s = 0;
dt = .005;
t = [0:dt:20]'
Ux = zeros(size(t));

for i = 1:numel(t);
    Ux(i) = interp1(S, UxDesired, s);
    s = s + Ux(i)*dt;
end
