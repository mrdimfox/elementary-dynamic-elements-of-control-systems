function drawVertSize(x, y1, y2, height, label, labelShift)
%drawVertSize(x, y1, y2, height, label, labelShift)
%  x:         x coord of size line
%  y1:        y coord of size line start
%  y2:        y coord of size line end
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
leftLineYCoords = [y1, y1];
leftLineXCoords = [x - partHeight, x + otherPartHeight + some];
line(leftLineXCoords, leftLineYCoords,...
     'LineWidth',1 ,'Color',[0 0 0], 'LineStyle','-');

% Right line
rightLineYCoords = [y2, y2];
rightLineXCoords = [x - partHeight, x + otherPartHeight + some];
line(rightLineXCoords, rightLineYCoords,...
     'LineWidth',1 ,'Color',[0 0 0], 'LineStyle','-');

arrow([x + otherPartHeight, y1], [x + otherPartHeight, y2], 'Width', 1.2);
arrow([x + otherPartHeight, y2], [x + otherPartHeight, y1], 'Width', 1.2);

% Text
yText = (y2 - y1) * 0.5 + labelShift(2);
xText = x + otherPartHeight + labelShift(1);
text(xText, yText,...
     label,...
     'FontSize', fontSize,...
     'VerticalAlignment', 'middle');

end