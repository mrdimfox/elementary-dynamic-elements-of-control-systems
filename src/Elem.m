classdef Elem
    properties
       transFunc
       modelName = '';
    end
    methods
        function obj = Elem(varargin)
            if nargin == 2
                obj.modelName = varargin{1};
                obj.transFunc = varargin{2};
            elseif nargin == 1
                obj.modelName = varargin{1};
            end;
        end
    end
end