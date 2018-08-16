classdef dvcBody < handle
    %DVCBODY A rigid body
    %   Represent a rigid body during simulation
    %   I contains information about
    %       + the body states (position,rotation,etc..)
    %       + A handle to the body geometry (can share between bodies)    
    
    properties
        q = [0 0 0 0 0 0 1 ];% Body configuration q(1:3) = position, q(4-7)= quaternion
        nu= [0 0 0 0 0 0]; % Body velocity , nu(1:3)= linear, q(4:6)=angular
        m = 1.0% Mass ( kg )
        fExt = 0.0 % External force/torque ( fExt(1:6) )
        Ibd  % Moment of inertia tensor w.r.t body fixed frame (constant)
        isUpdated = false % If the body state changed?
        
        geom % geometry
        color = [0.4 0.4 0.4]% color of this body
        visible = true; % If it's visible;
    end

    % Auxiliary variable
    properties 
        R    % Rotation matrix (3x3)
        G    % Kinetic map
        Iw   % Moment of inertia tensor w.r.t world frame (changing)     
        Mass % Final mass matrix to put in big matrix
        Minv % Inverse of the final mass matrix        
    end
    
    methods
        function body = dvcBody(pos,vel)
            if nargin == 2
                body.q = pos;
                body.nu= vel;
            end
        end
        
        % Update data
        function onUpdate(obj)
%             if (~obj.isUpdated)
%                 % Update dependant data here           
%                 ep0 = obj.q(4);
%                 ep1 = obj.q(5);
%                 ep2 = obj.q(6);
%                 ep3 = obj.q(7);
%                 
%                 % update R
%                 obj.R = [ 1-2*(ep2^2 + ep3^2)   2*(ep1*ep2 - ep3*ep0)   2*(ep1*ep3 + ep2*ep0);
%                           2*(ep1*ep2 + ep3*ep0)   1-2*(ep1^2 + ep3^2)    2*(ep2*ep3 - ep1*ep0);
%                           2*(ep1*ep3 - ep2*ep0)  2*(ep2*ep3 + ep1*ep0)    1-2*(ep1^2 + ep2^2)  ];
% 
%                 % update G
%                 B = [-ep1 -ep2 -ep3;
%                     ep0 -ep3  ep2;
%                     ep3  ep0 -ep1;
%                     -ep2  ep1  ep0] / 2; 
% 
%                 obj.G = [eye(7)];
%                 obj.G(4:7,4:6) = B;
%                 
%                 % update Iw
%                 obj.Iw = obj.R * obj.Ibd * obj.R';
%                 
%                 % update mass
%                 obj.Mass = obj.m*eye(6);
%                 obj.Mass(4:6,4:6) = obj.Iw;
%                 obj.Minv = inv(obj.Mass);             
%                 
%                 obj.isUpdated = true;
%            end
        end
        
        function init(obj)
            if (obj.visible)
                obj.geom.init();
            end
        end
        
        function draw(obj)
            if (obj.visible)
              obj.geom.draw(obj.q,obj.color);
            end
        end
        
        function setPosition(obj,p)
            obj.q(1:3) = p;
        end

       function setAxisAngle(obj,axis,deg)
            rad    = pi * (deg / 180);
            axis   = axis./norm(axis); % normalize it
            obj.q(4:6) = axis.*sin(rad/2);
            obj.q(7)   = cos(rad/2);
       end
        
       function setQ(obj,pos,axis,deg)
           obj.setPosition(pos);
           obj.setAxisAngle(axis,deg);
       end

    end
    
end

