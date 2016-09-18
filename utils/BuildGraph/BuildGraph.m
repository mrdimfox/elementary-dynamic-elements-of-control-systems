function [out_figure] = BuildGraph(Y1, labX, labY, XYlim, fig, lineStyle, marker)
%BuildGraph(Y1, labX, labY, Xlim, fig, lineStyle, marker)
%  Y1:          vector of y data
%  labX:        label of X
%  labY:        label of Y
%  XYlim:       limit by X and Y
%  fig:         1 - create new figure, 
%               0 - use old figure
%  lineStyle:   '-.' or '--' or '-' or ':'
%  marker:      '*' or 'x' or 'o' or '.' ...

global legendList;
global lineStyleList;
global markerStyleList;

% Create new figure
if fig == 1
    legendList = {};
    lineStyleList = {'-', '--', ':', '-.'};
    markerStyleList = {'o', '+', '*', '.', 'x', 's', 'd',...
                       '^', 'v', '>', '<', 'p', 'h'};
    % Create figure
    out_figure = figure('PaperSize',[10 30],...
        'Name', '',...
        'Color', [1 1 1],...
        'Position',[1 1 900 571],...
        'Resize', 'off');
    % Create axes
    axes1 = axes('Parent',out_figure,'YGrid','on','XGrid','on',...
        'Position',[0.1 0.15 0.855 0.770],...
        'FontSize',12);
    
    xlim(axes1,[XYlim(1) XYlim(2)]);
    if length(XYlim) > 2
        ylim(axes1,[XYlim(3) XYlim(4)]);
    end
    
    box(axes1,'on');
    hold(axes1,'all');
    title('');
end

% Build graph
switch nargin
    case 7
        plot(Y1(:,1),Y1(:,2),lineStyle,'LineWidth',1,'Color',[0 0 0],'Marker',marker);
    case 6
        plot(Y1(:,1),Y1(:,2),lineStyle,'LineWidth',1,'Color',[0 0 0]);
    case 5
        lineStyle = '-';
        markerStyle = 'none';
        if ~isempty(lineStyleList)
            lineStyle = cell2mat(lineStyleList(1));
            lineStyleList = lineStyleList(2:end);
        else
            lineStyle = '-';
            markerStyle = cell2mat(markerStyleList(1));
            markerStyleList = markerStyleList(2:end);
        end
        
        plot(Y1(:,1),Y1(:,2),lineStyle,'LineWidth',1,'Color',[0 0 0],'Marker',markerStyle);
end

legendList(length(legendList)+1) = {labY};

% Create xlabel
xlabel(labX,'FontSize',14,'Interpreter','tex');

% Create ylabel and legend
if length(legendList) > 1
    labY = ' ';
    leg = legend(legendList, 'Location','southeast');
    set(leg,'interpreter','tex')
end;
ylabel(labY,'FontSize',14,'Interpreter','tex');

end