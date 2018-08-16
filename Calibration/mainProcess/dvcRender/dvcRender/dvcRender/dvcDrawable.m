classdef dvcDrawable < handle
    %DVCDRAWABLE Based class for a renderable object
    %   Contains all geometric information needed to render an object
    %   The information:
    %      g       : object's geometry
    %                g.v = its verticesl g.f.v = faces indices,g.f.n=face
    %                normal
    %      obj_dile: geometry file
    properties        
        g;      % geometry
        obj_file;% file name
    end
    
    methods
    end
    
end

