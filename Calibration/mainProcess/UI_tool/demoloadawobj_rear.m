%% An introduction to loadawobj
% Some examples of usage of loadawobs.m and companion files
% loadawmtl.m drawaw.m
%
% This file can be `published' with publish('demoloadawobj','pdf')
%% Simple files
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
fig=figure('Name', 'Mesh rear'); % open a new figure
modelname='elliptical_mesh_rectcutout_rear.obj';
[v_rear,F3_rear]=loadawobj('elliptical_mesh_rectcutout_rear.obj');
assignin('base', 'v_rear', v_rear);
assignin('base', 'F3_rear', F3_rear);
ph_rear = patch('Vertices',v_rear','Faces',F3_rear', 'FaceColor', 'g');
assignin('base', 'ph_rear', ph_rear);
view(60,0);
axis('equal');
snapnow
pause(1)

%% S=loadawobj('file.obj')
% If there is a single output variable, loadawobj will return a
% structure with more details extracted from the obj file.
%
% *The structure fields are*
%
%  version
%  v : vertices
%  f3,f4,f5,f6 : A list of faces with 3,4,5, and 6 vertices.
%  g : Group names
%  g3 g4 : The index indicates the group by faces
%  l : Lines (see diamond.obj)
%  umat3 umat4 : The index indicates to which group a face belongs
%  mtllib : The material library (load with loadawmtl)
%  usemtl : Material names
%  vt : Vertex textures
%  vn : Vertex normals
%  tc3 : texture coorndate for 3 face polygons
%  tc4 : texture coorndate for 4 face polygons
%  vn3 : texture coorndate for 3 face polygons
%  vn4 : texture coorndate for 4 face polygons
%
% *Note*
%
% g3 and g4 are the same length as f3 and f4 and indicate to which group a
% face set belongs.
%
% Only 3-6 faces are currently supported, it should be relatively easy
% to add more
% 
%close(fig)
