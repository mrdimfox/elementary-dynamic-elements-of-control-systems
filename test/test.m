addpath('../src/Helpers');
% pathArr = strsplit(path, pathsep);
% for iPath = pathArr
%     pathStr = cell2mat(iPath);
%     pathElems = strsplit(pathStr, '\');
%     folder = pathElems(length(pathElems));
%     if strcmp(folder, 'BuildGraph') == 0
%         disp('BAD');
%         break;
%     end
% end
addToPath('../utils/BuildGraph', '../src/TFs models');

model('');