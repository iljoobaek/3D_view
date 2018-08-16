NET.addAssembly( 'd:\Work\dvcRender\dvcRender\Assembly\dotNetWrapper.dll');

import Bullet.dotNetWrapper.*;
import Bullet.dotNetWrapper.LinearMath.*;
%% Create BulletSDK
bulletSDK = BulletSDK();
%% Create DynamicsWorld
w = bulletSDK.CreateDynamicsWorld();
gr = Vector3(0,-10,0);
w.SetGravity(gr);

%% Create shapes
box = bulletSDK.CreateSphere(1);
box.SetMargin(0);

box2 = bulletSDK.CreateBox(50,1,50);
box2.SetMargin(0);
%% Create bodies
b = bulletSDK.CreateRigidBody(1,box);
b.SetPosition(0,2,0);
b.SetRotation(0,0,0);
lin1 = Vector3(0,-10,0);
b.SetLinearVel(lin1);

b2 = bulletSDK.CreateRigidBody(0,box2);
b2.SetPosition(0.0, -1, 0.0);
b2.SetRotation(0.0, 0.0, 0.0);

w.AddRigidBody(b);
w.AddRigidBody(b2);

%% Run simulation

pos = zeros(100,3);
vel = zeros(100,3);
d   = zeros(100,1);
for i=1:100
    w.Step(0.01);
    
    p1 = b.GetPosition();
    pos(i,:) = [p1.X p1.Y p1.Z];
    d(i) = p1.Y - 1;
    v1 = b.GetLinearVel();
    vel(i,:) = [v1.X v1.Y v1.Z];
    fprintf('vel(Y):[%f \t %f \t %f]\n',v1.X,v1.Y,v1.Z);    
end

plot(d);