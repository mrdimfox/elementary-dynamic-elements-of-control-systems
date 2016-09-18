function drawDashedLine(x1, y1, x2, y2)
%drawDashedLine(x1, y1, x2, y2)
%  x1:        x coord of line start
%  y1:        y coord of line start
%  x2:        x coord of line end
%  y2:        y coord of line end

% Right way for define coords
x = [x1 x2];
y = [y1 y2];

% Draw dashed line
line(x, y,'LineWidth',2,'Color',[0 0 0],'LineStyle','--');

end