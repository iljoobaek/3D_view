fileID = fopen('vt_values_right.txt','w');
formatSpec = 'vt %0.6f %0.6f\n';
for i = 1 : size(shuffled_vt_x_right)
   fprintf(fileID, formatSpec, shuffled_vt_x_right(i), shuffled_vt_y_right(i));     
end