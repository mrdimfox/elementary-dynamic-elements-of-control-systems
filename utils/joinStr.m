function [s] = joinStr(varargin)
% joinStr(...)
%   Function for strings concatenation

s = '';
i = 0;
for i = 1:nargin
    s = sprintf('%s%s', s, cell2mat(varargin(i)));
end

end