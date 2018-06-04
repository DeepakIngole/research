plot(t,UxMu92)
hold on
UxLim = zeros(size(t));

x1 = 347;
x2 = 2300;
y2 = 28.89;

for i = 1:numel(t)
    if i < x1
        UxLim(i) = 39.4 + 1.7*t(i);
    elseif i > x2
        UxLim(i) = y2 + 1.7*(t(i)-t(x2));
    else
        UxLim(i) = UxMu92(i);
    end
end

plot(t, UxLim,'r')

