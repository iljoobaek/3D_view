function setupViewport( w )
%SETUPVIEWPORT setup OpenGL viewport
%   Set OPENGL View and Projection matrix

%% importing assemblies
import OpenTK.Graphics.OpenGL.*;
import OpenTK.*;

%% Projection matrix
GL.MatrixMode(MatrixMode.Projection);
GL.LoadIdentity();
ratio = w.sceneData.renderWidth / w.sceneData.renderHeight;
frustumSize = 1;
GL.Frustum(-frustumSize*ratio,frustumSize*ratio,-frustumSize,...
            frustumSize,1,1000);

%% viewport
GL.Viewport(int32(0),int32(0),int32(w.sceneData.renderWidth),int32(w.sceneData.renderHeight));
end

