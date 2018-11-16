fileID = fopen('vt_values_front.txt','w');
formatSpec = 'vt %0.6f %0.6f\n';
for i = 1 : size(shuffled_vt_x_front)
   fprintf(fileID, formatSpec, shuffled_vt_x_front(i), shuffled_vt_y_front(i));     
end