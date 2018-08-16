classdef dvcBTWorld < dvcWorld
    %DVCBTWORLD Binh-Trinkle world, /ref ICRA 2010 paper
    %   New method that can handle non-convex contact
    
    properties
        
    end
    
    methods
        % Constructor
        function obj = dvcBTWorld()
            
        end 
    end

    methods
        % class method
        function sim_time = step(obj,time_step)
            % set global time step
            obj.timeStep = time_step;
            
            % run collision detection
            
            % formulate physics
            
            % solve it
            
            % update it
            
            % return total sim time
            sim_time = obj.simTime + obj.timeStep;
        end 
        
        % Run collision detection
        function collide(obj)
            
        end
        
        % formulate physics
        function formulate(obj)
            
        end
        
        % solve it
        function solvePhysics(obj)
            
        end
        
        % update states
        function update(obj)
            
        end
    end

end

