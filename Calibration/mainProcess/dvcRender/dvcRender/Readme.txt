dvc3d Matlab-OpenGL renderer (2.0)

I) Introduction
This library use OpenTK (a .NET OpenGL wrapper) to provide 3D renderer inside Matlab.

II) Install

1. Add dvcRender into Matlab path (the one that contain dvcWorld.m)
2. Change Matlab directory to the one that contain testSampleWorld.m and run it. You should see
two spinning boxes

III) How to control camera
Drag left mouse to rotate
Drag right mouse to change focus point ( you should see a tiny dot at focus point position )
Mouse wheel to move camera in and out (zoom in / out )

iV) Demos
1) testBulletWorld.m : a simple demo (box/plane) using Bullet physics engine
    Things to try out: + after runnning the demo, you can set the box (body1) position to anywhere:
	         body1.setQ([0 10 0],[0 1 0],0);
			 
			 setQ function takes 3 parameters: [px py pz] : position
			                                   [ax ay az] : axis
											    a         : angle (in degree)
			 you can also change body1.q directly. body1.q is 7-tuple value with 3x for postion and 4x for its quaternion
			 
2) testSampleWorld.m : a simple demo show how to create your own world by subclassing dvcWorld
    Nothing fancy here, just 2 boxes rotating with different speed

3) testST.m kinda obsolete now, very low level on how to draw body

4) stApp.m  my starting place for ST demo ( not done yet )

5) testWorld.m Basic demo show how to draw bodies. Should be the starting place for all projects that dont want to use dvcWorld framework.

V) To do
+ Document matlab code



last edit: 11/2/2009
