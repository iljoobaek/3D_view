classdef dvcOGLDrawable < dvcDrawable
    %DVCOGLDRAWABLE OpenGL drawable object
    %   Class represent an OpenGL object 
    %   Note: this class makes use of display list so only suitable for
    %   unchanged gemetries ( perfect for rigid body )
 
    properties
        listID = -1; % Display list  
    end
    
    methods
        %% constructor
        function obj = dvcOGLDrawable(param)
            obj.obj_file = 'cube.obj';
            if nargin == 1
                obj.obj_file = param;
            end
        end
        
        function init(obj,geom_file)
            
            %% check if already init
            if (obj.listID ~= -1)
                %fprintf('Already init');
                return;
            end
            
            import OpenTK.Graphics.OpenGL.*;
            
            %% import the file
            if (nargin == 2)
                obj.obj_file = geom_file;
            end
            obj.g = readObj(obj.obj_file);
            num_faces = size(obj.g.f.v,1);
            %% create and compile dispplay list
            obj.listID = GL.GenLists(1);
            
            GL.NewList(uint32(obj.listID), ListMode.Compile);            
                
            for i_f = 1:num_faces
                GL.Begin(BeginMode.Polygon);
                num_vert = size(obj.g.f.v{i_f},2);
                % find a triangle so we can calculate normal
                idx1 = obj.g.f.v{i_f}(1);
                idx2 = obj.g.f.v{i_f}(2);
                idx3 = obj.g.f.v{i_f}(3);
                % find normal
                n = cross(obj.g.v(idx2,:)-obj.g.v(idx1,:),...
                          obj.g.v(idx3,:)-obj.g.v(idx1,:));
                n = n./norm(n); %normalize it
                
                GL.Normal3(n(1),n(2),n(3));
                obj.g.f.n{i_f} = n;
                for i_v = 1:num_vert
                    iv = obj.g.f.v{i_f}(i_v);
                    GL.Vertex3(double(obj.g.v(iv,1)),...
                               double(obj.g.v(iv,2)),...
                               double(obj.g.v(iv,3)));                           
                end                
                GL.End();
            end           
            
            GL.EndList();
        end
        
        function close(obj)
            %% check if already closed
            if (obj.listID == -1)
                %fprintf('Already closed');
                return;
            end
            
            import OpenTK.Graphics.OpenGL.*;
            GL.DeleteLists(obj.listID,1);
            obj.listID = -1;
        end
        
        function draw(obj, q, cl)
            %% check if already init
            if (obj.listID == -1)
                fprintf('Warning: drawing uninitialized dvcOGLDrawable.\n');
                return;
            end
            
            import OpenTK.Graphics.OpenGL.*;
            import OpenTK.*;
            
            %% draw with position/oritentation
            if nargin == 3            
                GL.PushMatrix();
                
                xx      = q(4) * q(4);
                xy      = q(4) * q(5);
                xz      = q(4) * q(6);
                xw      = q(4) * q(7);

                yy      = q(5) * q(5);
                yz      = q(5) * q(6);
                yw      = q(5) * q(7);

                zz      = q(6) * q(6);
                zw      = q(6) * q(7);

                m00  = 1 - 2 * ( yy + zz );
                m01  =     2 * ( xy - zw );
                m02 =     2 * ( xz + yw );

                m10  =     2 * ( xy + zw );
                m11  = 1 - 2 * ( xx + zz );
                m12  =     2 * ( yz - xw );

                m20  =     2 * ( xz - yw );
                m21  =     2 * ( yz + xw );
                m22 = 1 - 2 * ( xx + yy );

                rot = OpenTK.Matrix4d(m00, m01, m02, 0,...
                                      m10, m11, m12, 0,...
                                      m20, m21, m22, 0,...
                                      0  , 0  , 0  , 1);

                GL.Translate(q(1),q(2),q(3));
                GL.MultMatrix(rot);
                GL.Color3(cl(1),cl(2),cl(3));
%                 GL.Material(MaterialFace.Front,...
%                             MaterialParameter.AmbientAndDiffuse,...
%                             OpenTK.Color4d(cl(1),cl(2),cl(3),1));
            end
            
            GL.CallList(obj.listID);
            
            if nargin == 3            
                GL.PopMatrix();
            end
        end        
        
    end
    
end

