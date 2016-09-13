function [] = saveEps( fig, imgName, path )
%saveEps Save figure as imgName.eps in path.
%   fig     - figure obj
%   imgName - name of output image
%   path    - path to folder with images (static variable)

persistent PATH;

if (nargin < 3) && isempty(PATH)
    fprintf('%s','Path to folder with images is empty');
    RETURN;
elseif (nargin == 3)
    PATH = path;
end

imageFullName = sprintf('%s%s', PATH, imgName);
export_fig(fig, imageFullName, '-eps');

end

