NET.addAssembly( 'd:\Work\dvcRender\dvcRender\Assembly\dotNetWrapper.dll');

import Bullet.dotNetWrapper.*;
import Bullet.dotNetWrapper.LinearMath.*;

addpath('.\BulletWorld');
%% create the world
g_world = BulletWorld(0.016);
g_world.timer.timeInterval = 0.016; % 60 Hertz
%% setup body and drawable
%% drawable
b1 = dvcOGLDrawable('models/cube.obj');
b2 = b1;

%% Create collision shapes
bBox1 = g_world.bulletSDK.CreateBox(1,1,1);
bBox1.SetMargin(0);

bBox2 = g_world.bulletSDK.CreateBox(50,1,50);
bBox2.SetMargin(0);
%% Create bodies
bulletBody1 = g_world.bulletSDK.CreateRigidBody(1,bBox1);
body1 = BulletBody(bulletBody1);
body1.geom = b1;
body1.setQ([0 2 0],[0 1 0],0);
%% body2
bulletBody2 = g_world.bulletSDK.CreateRigidBody(0,bBox2);
body2 = BulletBody(bulletBody2);
body2.visible = false;
body2.setQ([0 -1 0],[0 1 0],0);
%% add them to the world
% visual
g_world.addBody(body1);
g_world.addBody(body2);
%% grid
gr = dvcGrid();
g_world.grid = gr;
%% Call the app
setupApp( g_world );