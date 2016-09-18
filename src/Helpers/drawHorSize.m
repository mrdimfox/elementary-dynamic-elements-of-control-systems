function drawHorSize(y, x1, x2, height, label, labelShift)
%drawHorSize(y, x1, x2, height, label, labelShift)
%  y:         y coord of size line
%  x1:        x coord of size line start
%  x2:        x coord of size line end
%  height:    height of left and right lines, like here:   |<----->|
%  text:      label
%  textShift: label shift

plotToPixKoeff = 0.025;
fontSize = 14;

realHeight = height * plotToPixKoeff;
partHeight = realHeight * 0.3;
otherPartHeight = realHeight - partHeight;
some = otherPartHeight * 0.35;

% Left line
leftLineXCoords = [x1, x1];
leftLineYCoords = [y - partHeight, y + otherPartHeight + some];
line(leftLineXCoords, leftLineYCoords,...
     'LineWidth',1 ,'Color',[0 0 0], 'LineStyle','-');

% Right line
rightLineXCoords = [x2 x2];
rightLineYCoords = [y - partHeight, y + otherPartHeight + some];
line(rightLineXCoords, rightLineYCoords,...
     'LineWidth',1 ,'Color',[0 0 0], 'LineStyle','-');

arrow([x1, y + otherPartHeight], [x2, y + otherPartHeight], 'Width', 1.2);
arrow([x2, y + otherPartHeight], [x1, y + otherPartHeight], 'Width', 1.2);

% Text
xText = (x2 - x1) * 0.5 + labelShift(1);
yText = y + realHeight + labelShift(2);
text(xText, yText,...
     label,...
     'FontSize', fontSize,...
     'HorizontalAlignment', 'center');

end