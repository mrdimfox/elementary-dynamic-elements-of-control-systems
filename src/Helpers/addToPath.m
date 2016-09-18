function [] = addToPath(varargin)
% addToPath(...)
%   Function for adding into path somenthing

for i = 1:nargin
    try
       addpath(cell2mat(varargin(i)));
    catch e
       disp('Some conflicts in path:');
       disp(e);
    end 
end

end