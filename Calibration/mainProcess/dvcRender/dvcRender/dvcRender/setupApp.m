function setupApp( w )

%% Adding assemblies
functionname = 'setupApp.m';
functiondir = which(functionname);
functiondir = functiondir(1:end-length(functionname));
assemblydir = [functiondir 'Assembly\' ];

NET.addAssembly([assemblydir 'OpenTK.dll']);
NET.addAssembly([assemblydir 'OpenTK.GLControl.dll']);
NET.addAssembly('System');
NET.addAssembly('System.Windows.Forms');

import  OpenTK.Graphics.OpenGL.*;

%% initialized Application
%% Create window

% Make A new Form (.NET window)
renWin = System.Windows.Forms.Form;
renWin.Width  = w.sceneData.width;
renWin.Height = w.sceneData.height;
renWin.Text   = w.sceneData.text;
renWin.Visible= true;


%% create simple OpenGL control

renControl = OpenTK.GLControl;
renControl.BackColor = System.Drawing.SystemColors.ControlDarkDark;
renControl.Dock = System.Windows.Forms.DockStyle.Fill;
renControl.Location = System.Drawing.Point(0, 0);
renControl.Size = System.Drawing.Size(w.sceneData.width - 17,w.sceneData.height-38);
renControl.Name = 'dvcGLcontrol_1';
renControl.TabIndex = 0;
renControl.VSync = false;

%% add to window
renWin.Controls.Add( renControl );

%% set up event handler
% Add Mouse listeners
addlistener(renControl,'MouseDown',eval(['@(src,evnt)window_function(''MouseDown'',src,evnt, w )']));
addlistener(renControl,'MouseMove',eval(['@(src,evnt)window_function(''MouseMove'',src,evnt, w )']));
addlistener(renControl,'MouseWheel',eval(['@(src,evnt)window_function(''MouseWheel'',src,evnt, w )']));
addlistener(renWin,'FormClosing',eval(['@(src,evnt)window_function(''FormClosing'',src,evnt, w )']));
addlistener(renWin,'FormClosed',eval(['@(src,evnt)window_function(''FormClosed'',src,evnt, w )']));
addlistener(renWin,'SizeChanged',eval(['@(src,evnt)window_function(''SizeChanged'',src,evnt, w )']));
addlistener(renControl,'KeyPress',eval(['@(src,evnt)window_function(''KeyPress'',src,evnt, w )']));
addlistener(renControl,'Enter',eval(['@(src,evnt)window_function(''Enter'',src,evnt, w )']));
%% setup application data

% Use a struct as data container
w.sceneData.LastXY = [0 0];
w.sceneData.FirstRender = true;
w.sceneData.renderWidth = double(renControl.Size.Width);
w.sceneData.renderHeight = double(renControl.Size.Height);

%% initialize scene
for i=1:size(w.Bodies,2)
    w.Bodies(i).init();
end

if w.grid ~= 0
    w.grid.init();
end

%% Store all data for this OpenGL window
w.sceneData.renControl = renControl;
w.sceneData.renForm    = renWin;

%% setup OpenGL viewport
setupViewport( w );   

%% OpenGL global initialization


clearColor = w.sceneData.clearColor;

% Set background clear color to blue
GL.ClearColor(clearColor(1),clearColor(2),...
              clearColor(3),clearColor(4));  

GL.ClearDepth(1.0);
GL.Enable(EnableCap.DepthTest);
GL.Enable(EnableCap.ColorMaterial);
GL.Enable(EnableCap.CullFace);
GL.DepthFunc(DepthFunction.Lequal); 

GL.ColorMaterial(MaterialFace.Front,...
                 ColorMaterialParameter.AmbientAndDiffuse);
             
%% Lighting 
GL.ShadeModel(ShadingModel.Smooth);
GL.Enable(EnableCap.Lighting);


%%   Light0
GL.Enable(EnableCap.Light0); 
light0Ambient  = OpenTK.Vector4(single(0.2),single(0.2),single(0.2),single(1));
light0Diffuse  = OpenTK.Vector4(single(0.8),single(0.8),single(0.8),single(1));
light0Specular = OpenTK.Vector4(single(0.5),single(0.5),single(0.5),single(1));
light0Position = OpenTK.Vector4(single(30),single(30),single(0),single(1));
GL.Light(LightName.Light0, LightParameter.Ambient, light0Ambient );
GL.Light(LightName.Light0, LightParameter.Diffuse, light0Diffuse );
GL.Light(LightName.Light0, LightParameter.Specular, light0Specular );
GL.Light(LightName.Light0, LightParameter.Position, light0Position );

%%   Light1
GL.Enable(EnableCap.Light1); 
light1Ambient  = OpenTK.Vector4(single(1),single(0.5),single(0.5),single(1));
light1Diffuse  = OpenTK.Vector4(single(1),single(0.5),single(0.5),single(1));
light1Specular = OpenTK.Vector4(single(1),single(0.5),single(0.5),single(1));
light1Position = OpenTK.Vector4(single(-30),single(30),single(0),single(1));
GL.Light(LightName.Light1, LightParameter.Ambient, light1Ambient );
GL.Light(LightName.Light1, LightParameter.Diffuse, light1Diffuse );
GL.Light(LightName.Light1, LightParameter.Specular, light1Specular );
GL.Light(LightName.Light1, LightParameter.Position, light1Position );

%% Draw Polygons
render( w );
%% draw twice the first time
render( w );

%% Now setup timer callback
if (w.timer.timeInterval > 0)
    w.timer.t = timer('ExecutionMode','fixedRate','BusyMode','queue',...
                      'Period',w.timer.timeInterval);        
    w.timer.t.TimerFcn = { w.timer.callbackFcn , w };
    if (w.timer.timeSteps > 0)
        w.timer.t.TasksToExcute = w.timer.timeSteps;
    end
    
    % start it
    start( w.timer.t );
end
end
