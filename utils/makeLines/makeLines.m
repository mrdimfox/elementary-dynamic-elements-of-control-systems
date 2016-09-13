function [  ] = makeLines( m, lin, width, marker, graph)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
x = [m(:,1) m(:,3)];
y = [m(:,2) m(:,4)];

if strcmp(graph, 'log') == 1
    semilogx(x',y','Marker','.','LineStyle',lin,'MarkerSize',marker,'Color',[0 0 0],'LineWidth',width);
else
    plot(x',y','Marker','.','LineStyle',lin,'MarkerSize',marker,'Color',[0 0 0],'LineWidth',width);

end

