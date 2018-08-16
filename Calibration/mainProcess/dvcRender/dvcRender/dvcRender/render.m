function  render( world )
%RENDER Draw world
%   Just throw everything into OpenGL

% Allow to use GL functions without prefixing.
import OpenTK.Graphics.OpenGL.*;

%% Clear the color and depth buffer
GL.Clear(ClearBufferMask.ColorDepthBufferBit);

%% render grid if have one
if world.grid ~= 0
    world.grid.draw();
end

%% update camera
updateCamera( world );

%% render all bodies
for i=1:size(world.Bodies,2)
    world.Bodies(i).draw();
end

world.sceneData.FirstRender = false;

% Swap buffers
world.sceneData.renControl.SwapBuffers();

end

