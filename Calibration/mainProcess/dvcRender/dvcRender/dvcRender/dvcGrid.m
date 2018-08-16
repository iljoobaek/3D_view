classdef dvcGrid < dvcOGLDrawable
    %DVCGRID a simple Grid
    %   Very simple grid    
    properties
        gridSize = 200;%
        gridDetail = 300;%
        color = [0.3 0.3 0.3];%
    end
    
    methods
        function obj = dvcGrid(size,detail,cl)           
            
            if nargin ~= 0
                obj.gridSize = size;
                obj.gridDetail = detail;          
                obj.color = cl;
            end
            
        end
        
        function init(obj)
            import OpenTK.Graphics.OpenGL.*;
            
            obj.listID = GL.GenLists(1);
            
            GL.NewList(uint32(obj.listID), ListMode.Compile);
            
            GL.Color3(double(obj.color(1)),...
                      double(obj.color(2)),...
                      double(obj.color(3)));
                  
            
            for gs = -obj.gridSize:obj.gridSize/obj.gridDetail:obj.gridSize
                GL.Begin(BeginMode.Lines);
                GL.Vertex3(-obj.gridSize, 0, gs);
                GL.Vertex3( obj.gridSize, 0, gs);
                GL.End();
            end

            for gs = -obj.gridSize:obj.gridSize/obj.gridDetail:obj.gridSize
                GL.Begin(BeginMode.Lines);
                GL.Vertex3(gs, 0,-obj.gridSize);
                GL.Vertex3(gs, 0, obj.gridSize);
                GL.End();
            end

            GL.EndList();
        end
    end
    
end

