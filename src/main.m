addpath('../src/Helpers');
addToPath('../utils/BuildGraph',...
          '../utils/export_fig',...
          '../utils/arrow',...
          '../src/TFs models');

elems = DinElems();

%% Aperiodic din. element
% Draw step response
[y, t] = step(elems.aperiodic1.transFunc);
stepFigure = BuildGraph([t, y],...
                        't, сек', 'h(t)',...
                        [0, max(t), 0, max(y)+1],...
                        1);

% Draw line above graphic
xLine = [0 max(t)];
yLine = [max(y) max(y)];
drawDashedLine(xLine(1), yLine(1), xLine(2), yLine(2));

% Tangent
k = y(5)/t(5);
xCalc = max(y)/k;
xTangent = [0 xCalc];
yTangent = [0 max(y)];
drawDashedLine(xTangent(1), yTangent(1), xTangent(2), yTangent(2));
    
% Sizes
TsizeX = [0 xTangent(2)];
drawHorSize(max(y), TsizeX(1), TsizeX(2), 20, 'T', [0 0.14]);
drawVertSize(0.07, 0, max(y), 0, 'k', [0.001 0]);

saveEps(stepFigure, 'step', '../plots/aperiodic1/');

 
% Impulse response
[y, t] = impulse(elems.aperiodic1.transFunc);
impulseFigure = BuildGraph(...
    [t, y],...
    't, сек', '\omega(t)',...
    [0, max(t), 0, max(y)+100],...
    1);

% Draw line above graphic
xLine = [0 max(t)];
yLine = [max(y) max(y)];
drawDashedLine(xLine(1), yLine(1), xLine(2), yLine(2));

% Tangent
xTangent = [0 0.011];
yTangent = [max(y) 0];
drawDashedLine(xTangent(1), yTangent(1), xTangent(2), yTangent(2));

% Sizes
TsizeX = [0 xTangent(2)];
drawHorSize(0, TsizeX(1), TsizeX(2), 2000, 'T', [0 17]);
drawVertSize(0.05, 0, max(y), 0, 'k/T', [0.001 0]);

saveEps(impulseFigure, 'impulse', '../plots/aperiodic1/');