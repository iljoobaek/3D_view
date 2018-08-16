function  updateCamera( w )
%UPDATECAMERA Update current camera
%   A very simple camera

% Allow to use GL functions without prefixing with Tao.Opengl.
import OpenTK.Graphics.OpenGL.*;
import OpenTK.*;

%% View matrix
GL.MatrixMode(MatrixMode.Modelview);

eye_pos = w.camera.eye;
target_pos = w.camera.target;
v_up = w.camera.v_up;

camMatrix = Matrix4d.LookAt(eye_pos(1),eye_pos(2),eye_pos(3),...
                            target_pos(1),target_pos(2),target_pos(3),...
                            v_up(1),v_up(2),v_up(3));
GL.LoadIdentity();
GL.LoadMatrix(camMatrix);

%% draw target quad
ts = 0.1;
GL.PushMatrix();
GL.Translate(w.camera.target(1),0,w.camera.target(3));

GL.Color3(1,0,0);
GL.Begin(BeginMode.Quads);
    GL.Vertex3(ts,0,ts);
    GL.Vertex3(ts,0,-ts);
    GL.Vertex3(-ts,0,-ts);        
    GL.Vertex3(-ts,0,ts);
GL.End();

GL.Begin(BeginMode.Quads);
    GL.Vertex3(ts,0,ts);
    GL.Vertex3(-ts,0,ts);
    GL.Vertex3(-ts,0,-ts);            
    GL.Vertex3(ts,0,-ts);
GL.End();

GL.PopMatrix();

end

