classdef dvcWorld < handle
    %DVCWORLD Abstract class that define a timestepper interface
    %   Base class for all timestepping method (Stewart-Trinkle,
    %   Binh-Trinkle,etc...)
    
    properties
        Geoms = []% Collision detection geometries
        Bodies = []% List of rigid bodies
        Constraints = []% List of constraint
        
        simTime = 0.0 % current simulation time
        timeStep= 0.01% current time step
        gravity = 9.8 % world gravity
        
        sceneData;  % persistent data for the scene
        camera;     % current camera
        grid=0;     % tiled grid
        
        timer;      % timing variable
    end
    
    methods 
        function obj = dvcWorld()
            
        obj.sceneData.width = 800;
        obj.sceneData.height = 600;
        obj.sceneData.text = 'dvcRender for Matlab version 2.0';
        
        obj.sceneData.clearColor = [0.2, 0.2, 0.2, 0.0];

        %% Scale data
        obj.camera.zoomScale = 100;
        obj.camera.transScale  = [80 80]; % view,tangential direction
        obj.camera.rotScale = [200 200];    
        obj.camera.minDistance = 2.0;
        obj.camera.eye  = [10 10 0];
        obj.camera.target = [0 0 0];
        obj.camera.v_up = [0 1 0];
        
        %% Timing data
        obj.timer.timeInterval = -1; % Not start automatically
        obj.timer.callbackFcn = @timerFunc;
        obj.timer.timeSteps = -1; % Infinite steps
        
        end
        % Run collision detection, dynamics then update        
        function sim_time = step(obj,time_step)
            if nargin == 1
                obj.simTime = obj.simTime + obj.timeStep;
            else
                obj.simTime = obj.simTime + time_step;
            end
             sim_time = obj.simTime;           
        end
        
        function addBody(obj,b)
            obj.Bodies = [obj.Bodies b];
        end
    end
    
end

