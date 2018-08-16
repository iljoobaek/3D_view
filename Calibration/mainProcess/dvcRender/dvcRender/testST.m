% simple sphere on a plane test

%initialize world
world = dvcBTWorld();

% Initialize sphere
%   Position
sphere_initial_pos = [0 10 0];
sphere_initial_rot_axis = [0 1 0];
sphere_initial_rot_angle = 0;
sphere_initial_rot = [ sphere_initial_rot_axis*sin(sphere_initial_rot_angle/2) cos(sphere_initial_rot_angle/2)];
                   
q0 = [sphere_initial_pos sphere_initial_rot];  %shortcut 
%   Velocity
sphere_initial_velocity = [0 0 0 0 0 0]; 
nu0 = sphere_initial_velocity;

sphereBody = dvcBody(q0,nu0);
sphereBody.m = 1;
r = 1.0; % sphere radius
sphereBody.Ibd = diag([2/5*m*r^2 2/5*m*r^2 2/5*m*r^2]);

% Add sphereBody to world
world.Bodies = [world.Bodies sphereBody];