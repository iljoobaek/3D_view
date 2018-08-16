
%% create the world
g_world = sampleWorld();
% g_world.sceneData.width = 800;
% g_world.sceneData.height = 600;
% g_world.sceneData.drawFunc = 'render';
% 
% g_world.sceneData.clearColor = [0.2, 0.2, 0.2, 0.0];
% 
% g_world.camera.eye  = [10 10 0];
% g_world.camera.target = [0 0 0];
% g_world.camera.v_up = [0 1 0];

g_world.timer.timeInterval = 0.016; % 60 Hertz

%% setup body and drawable
%% drawable
b1 = dvcOGLDrawable('models/cube.obj');
b2 = b1;
% uncomment to load a huge cessna model
%b2 = dvcOGLDrawable('models/cessna.obj');

%% body1
body1 = dvcBody();
body1.geom = b1;
body1.q = [0 1 0 0 0 0 1];

%% body2
body2 = dvcBody();
body2.geom = b2; %% Share geom
body2.setQ( [3 1 0],[0 1 0], 45); % Using helper function
body2.color = [0.4 0.6 0.3] ;

%% add them to the world
g_world.addBody(body1);
g_world.addBody(body2);

%% grid
gr = dvcGrid();
g_world.grid = gr;


%% Call the app
setupApp( g_world );