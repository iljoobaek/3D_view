classdef BulletBody < dvcBody
    %BULLETBODY a Bullet physics engine body
    %   Detailed explanation goes here
    
    properties
        body% Bullet rigid body handle
    end
    
    methods
        function obj = BulletBody(b)            
            obj.body = b;
        end
        
        function onUpdate(obj)
            import Bullet.dotNetWrapper.*;
            import Bullet.dotNetWrapper.LinearMath.*;
            %% Call based method
            onUpdate@dvcBody(obj);
            %% Update q from Bullet
            pos = obj.body.GetPosition();
            quat= obj.body.GetQuaternion();
            obj.q = [pos.X pos.Y pos.Z quat.X quat.Y quat.Z quat.W];
        end
               
        function setPosition(obj,p)
            %% Call base class
            setPosition@dvcBody(obj,p);
            %% Update Bullet handle accordingly
            obj.body.SetPosition(p(1),p(2),p(3));
        end

       function setAxisAngle(obj,axis,deg)
            %% Call base class
            setAxisAngle@dvcBody(obj,axis,deg);
            %% Update Bullet handle accordingly
            obj.body.SetQuaternion(obj.q(4),obj.q(5),obj.q(6),obj.q(7));
       end
        
    end
    
end

