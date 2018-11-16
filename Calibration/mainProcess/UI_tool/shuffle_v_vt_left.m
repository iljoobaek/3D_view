shuffled_vt_x_left = (-1) * ones(size(x_bar_new_norm_left, 1), 1);
shuffled_vt_y_left = (-1) * ones(size(y_bar_new_norm_left, 1), 1);
F3_left = evalin('base', 'F3_left');
obj_left = evalin('base', 'obj_left');
local = obj_left.f.vt{size(F3_left, 2), 1};
for i = 1 : size(F3_left, 2)
    for j = 1 : 3
       f_val = F3_left(j, i);
       vt_val = local(j, i);
       if (shuffled_vt_x_left(vt_val, 1) == (-1)) 
            shuffled_vt_x_left (vt_val, 1) = x_bar_new_norm_left (f_val); 
            shuffled_vt_y_left (vt_val, 1) = y_bar_new_norm_left (f_val);
       end
    end
end