%% DemoLoadawobj
% loadawobj, at its simplest, will load a file and draws it on the
% current figure,
% e.g. loadawobj('icosahedron.obj').
%
% But more control is possible by extracting the vertices and faces
% information from the file
%
% *note*
%
% # Since the icosahedron only has triangles, only F3 needs to be in the output list,
% # the transpose of the vertices and faces matrix is given to the patch command.
fig=figure(4); % open a new figure
% modelname='rect_all_0514_front.obj';
% [v,F3]=loadawobj('rect_all_0514_front.obj');

% Different modelnames have been kept for convenience of switching
% different types of meshes

% modelname='Final_calibration files/curved_rectangle/rect_all_0514_front.obj';
% modelname='Final_calibration files/curved_rectangle/rect_all_0514_rear.obj';
% modelname='Final_calibration files/curved_rectangle/rect_all_0514_left.obj';
% modelname='Final_calibration files/curved_rectangle/rect_all_0514_right.obj';

% modelname='Final_calibration files/regular_rectangle/rectangular_mesh_measured_front.obj';
% modelname='Final_calibration files/regular_rectangle/rectangular_mesh_measured_rear.obj';
% modelname='Final_calibration files/regular_rectangle/rectangular_mesh_measured_left.obj';
% modelname='Final_calibration files/regular_rectangle/rectangular_mesh_measured_right.obj';
 
% modelname='Final_calibration files/FB_wide_rectangle/rectangular_mesh_measured_front_wide_final.obj';
% modelname='Final_calibration files/FB_wide_rectangle/rectangular_mesh_measured_rear_wide_final.obj';
% modelname='Final_calibration files/FB_wide_rectangle/rectangular_mesh_measured_left_wide_final.obj';
% modelname='Final_calibration files/FB_wide_rectangle/rectangular_mesh_measured_right_wide_final.obj';

% modelname = "Final_calibration files/narrow_rectangle/rect_narrow_mesh_front.obj";
% modelname = "Final_calibration files/narrow_rectangle/rect_narrow_mesh_rear.obj";
% modelname = "Final_calibration files/narrow_rectangle/rect_narrow_mesh_left.obj";
% modelname = "Final_calibration files/narrow_rectangle/rect_narrow_mesh_right.obj";

% modelname = "Final_calibration files/LR_wide_rectangle/rectangular_mesh_measured_front_narrow_0514.obj";
% modelname = "Final_calibration files/LR_wide_rectangle/rectangular_mesh_measured_rear_narrow_0514.obj";
% modelname = "Final_calibration files/LR_wide_rectangle/rectangular_mesh_measured_left_narrow_0514.obj";
% modelname = "Final_calibration files/LR_wide_rectangle/rectangular_mesh_measured_right_narrow_0514.obj";

% modelname = "Final_calibration files/asymmetric/narrowL_normalR/new_front.obj";
% modelname = "Final_calibration files/asymmetric/narrowL_normalR/new_rear.obj";
% modelname = "Final_calibration files/asymmetric/narrowL_normalR/new_left.obj";
% modelname = "Final_calibration files/asymmetric/narrowL_normalR/new_right.obj";

% modelname = "Final_calibration files/new_narrow/narrow_front.obj";
% modelname = "Final_calibration files/new_narrow/narrow_rear.obj";
% modelname = "Final_calibration files/new_narrow/narrow_left.obj";
% modelname = "Final_calibration files/new_narrow/narrow_right.obj";


%modelname = "Final_calibration files/asymmetric/narrowL_FRwideR/narL_FRwR_front.obj";
modelname = "Final_calibration files/asymmetric/narrowL_FRwideR/narL_FRwR_rear.obj";
%modelname = "Final_calibration files/asymmetric/narrowL_FRwideR/narL_FRwR_left.obj";
% modelname = "Final_calibration files/asymmetric/narrowL_FRwideR/narL_FRwR_right.obj";

[v,F3]=loadawobj(modelname);

ph = patch('Vertices',v','Faces',F3', 'FaceColor', 'g');
view(60,0);
axis('equal');
snapnow
pause(1)
