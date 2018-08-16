classdef sampleWorld < dvcWorld
    %SAMPLEWORLD An extremely simple world
    %   Only for illustrative purposes
    %   This class demonstrates how we can subclass dvcWorld step() method
    %   to rotate bodies in the scene around their local z axes.
    properties
    end
    
    methods
        function sim_time = step(obj,time_step)
            if nargin == 1
                s = step@dvcWorld(obj);
            else
                s = step@dvcWorld(obj,time_step);
            end
            
            %% Only rotate objects around
            for i=1:size(obj.Bodies,2)
                current_q = obj.Bodies(i).q;
                obj.Bodies(i).setQ(current_q(1:3), [0 1 0], mod(s*i,2*pi)*360);
                % Body 2 rotates twice as fast as body 1
            end
            
            sim_time = s;            
            
            %% Need to call render here so all the changes are updated
            render( obj );
            
        end
    end
    
end

