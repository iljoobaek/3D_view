fileID = fopen('vt_values_left.txt','w');
formatSpec = 'vt %0.6f %0.6f\n';
for i = 1 : size(shuffled_vt_x_left)
   fprintf(fileID, formatSpec, shuffled_vt_x_left(i), shuffled_vt_y_left(i));     
end