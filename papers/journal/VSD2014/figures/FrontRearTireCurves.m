close all; clear all; clc;
load data

X1 = cell2mat(Xdata(1));
X2 = cell2mat(Xdata(2));
X3 = cell2mat(Xdata(3));
X4 = cell2mat(Xdata(4));

Y1 = cell2mat(Ydata(1));
Y2 = cell2mat(Ydata(2));
Y3 = cell2mat(Ydata(3));
Y4 = cell2mat(Ydata(4));

figure1 = figure;
axes1 = axes('Parent',figure1,'FontSize',14,'FontName','Arial');
 xlim(axes1,[0 10]);
 ylim(axes1,[0 9516.22674045128]);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'all');

h1 = plot(X2,Y2,'Parent',axes1,'Marker','.','LineStyle','none','Color',[0 0 0],...
    'DisplayName','Empirical Data');

% Create xlabel
xlabel('|\alpha_{F} (deg)|','FontSize',14,'FontName','Arial');
ylabel('|F_{y} (N)|','FontSize',14,'FontName','Arial');

% Create plot
h2 = plot(X1,Y1,'Parent',axes1,'LineWidth',2,'Color',[0 0 0],...
    'DisplayName','Brush Fiala Model');

% Create plot
h3 = plot(X4,Y4,'Parent',axes1,'Marker','.','LineStyle','none','Color',[0 0 0]);

% Create plot
h4 = plot(X3,Y3,'Parent',axes1,'LineWidth',2,'Color',[0 0 0]);

legend1 = legend([h1 h2])

% % Create textarrow
% annotation(figure1,'textarrow',[0.481607629427793 0.548365122615804],...
%     [0.506204610951009 0.596541786743516],'TextEdgeColor','none','FontSize',14,...
%     'FontName','Arial',...
%     'String',{'Rear Tire Curve'});
% 
% % Create textarrow
% annotation(figure1,'textarrow',[0.771362397820163 0.811307901907357],...
%     [0.553927953890487 0.750720461095101],'TextEdgeColor','none','FontSize',14,...
%     'FontName','Arial',...
%     'String',{'Front Tire Curve'});

tightfig(gcf)


