function plotCircle(rad)

t = linspace(0, 2*pi, 1000);

x = rad*cos(t);
y = rad*sin(t); 

plot(x, y, 'k', 'LineWidth',2);