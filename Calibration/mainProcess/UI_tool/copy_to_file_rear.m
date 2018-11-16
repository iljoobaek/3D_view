fileID = fopen('vt_values_rear.txt','w');
formatSpec = 'vt %0.6f %0.6f\n';
for i = 1 : size(shuffled_vt_x_rear)
   fprintf(fileID, formatSpec, shuffled_vt_x_rear(i), shuffled_vt_y_rear(i));     
end