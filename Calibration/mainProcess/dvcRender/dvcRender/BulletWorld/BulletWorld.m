classdef BulletWorld < dvcWorld
    %BulletWorld World using Bullet
    % Use Bullet as physics engine
    properties
        bulletSDK %
        dynWorld  %
    end
    
    methods
        
        function obj = BulletWorld(timeStep)
            import Bullet.dotNetWrapper.*;
            import Bullet.dotNetWrapper.LinearMath.*;
            
            %% Create BulletSDK
            obj.bulletSDK = BulletSDK();
            %% Create DynamicsWorld
            obj.dynWorld = obj.bulletSDK.CreateDynamicsWorld();
            gr = Vector3(0,-10,0);
            obj.dynWorld.SetGravity(gr);        
            
            obj.timeStep = timeStep;            
        end
        
        
        function sim_time = step(obj,time_step)
            if nargin == 1
                s = step@dvcWorld(obj);
            else
                s = step@dvcWorld(obj,time_step);
            end
            
            %% step world
            obj.dynWorld.Step(obj.timeStep)
            %% Update bodies
            for i=1:size(obj.Bodies,2)
                obj.Bodies(i).onUpdate();
            end
            
            sim_time = s;            
            
            %% Need to call render here so all the changes are updated
            render( obj );
            
        end
        
        function addBody(obj,b)
            %% Call base class method
            addBody@dvcWorld(obj,b);
            %% This body should be BulletBody type
            if (strcmp(class(b),'BulletBody'))
                % should be ok to add body to bulletWorld
                obj.dynWorld.AddRigidBody(b.body);
            else
                % give out warning
                warning('Object_Mismatched','Object is not of BulletBody type.\n');
            end
        end
    end
    
end

