% This file copies the final .OBJ values to a text file to be exported to
% openGL
fileID = fopen('vt_values.txt','w');
formatSpec = 'vt %0.6f %0.6f\n';
for i = 1 : size(shuffled_vt_x)
   fprintf(fileID, formatSpec, shuffled_vt_x(i), shuffled_vt_y(i));     
end