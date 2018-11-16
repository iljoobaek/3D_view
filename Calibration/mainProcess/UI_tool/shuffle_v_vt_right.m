shuffled_vt_x_right = (-1) * ones(size(x_bar_new_norm_right, 1), 1);
shuffled_vt_y_right = (-1) * ones(size(y_bar_new_norm_right, 1), 1);
F3_right = evalin('base', 'F3_right');
obj_right = evalin('base', 'obj_right');
local = obj_right.f.vt{size(F3_right, 2), 1};
for i = 1 : size(F3_right, 2)
    for j = 1 : 3
       f_val = F3_right(j, i);
       vt_val = local(j, i);
       if (shuffled_vt_x_right(vt_val, 1) == (-1)) 
            shuffled_vt_x_right (vt_val, 1) = x_bar_new_norm_right (f_val); 
            shuffled_vt_y_right (vt_val, 1) = y_bar_new_norm_right (f_val);
       end
    end
end